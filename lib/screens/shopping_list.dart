import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grubhie/note_needs//note_database.dart';
import 'package:grubhie/utilities/note_models.dart';
import 'package:grubhie/screens/details.dart';
import 'package:grubhie/screens/add_note.dart';
import 'package:grubhie/note_needs/note_card_widget.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:grubhie/utilities/constants.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            titleTextStyle: TextStyle(fontFamily: 'patrickHand', fontSize: 25),
            backgroundColor:
                themeNotifier.isDark ? '424242'.toColor() : '77b255'.toColor(),
            elevation: 0,
            title: Text('My Shopping Lists'),
            flexibleSpace: Container(
              alignment: Alignment(1, 0),
              child: IconButton(
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
                icon: Icon(
                  themeNotifier.isDark
                      ? Icons.wb_sunny
                      : Icons.nightlight_round,
                  color: themeNotifier.isDark ? Colors.yellow : Colors.white,
                ),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(themeNotifier.isDark
                    ? 'assets/images/bg_plain_dm.png'
                    : 'assets/images/bg_plain.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : notes.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: getScreenWidth(context) * 0.6,
                              image: AssetImage(themeNotifier.isDark
                                  ? 'assets/images/empty_dm.png'
                                  : 'assets/images/empty.png'),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) * 0.02,
                            ),
                            Text('no shopping lists... try adding some')
                          ],
                        )
                      : buildNotes(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:
                themeNotifier.isDark ? 'CCCCCC'.toColor() : '77b255'.toColor(),
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddEditNotePage()),
              );

              refreshNote();
            },
          ),
        ),
      );
    });
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Details(noteId: note.id!),
              ));

              refreshNote();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
