import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grubhie/note_needs/note_database.dart';
import 'package:grubhie/utilities/note_models.dart';
import 'package:grubhie/screens/add_note.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:grubhie/utilities/constants.dart';

class Details extends StatefulWidget {
  final int noteId;

  const Details({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    this.note = await NotesDatabase.instance.readNote(widget.noteId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
          backgroundColor:
              themeNotifier.isDark ? '424242'.toColor() : '77b255'.toColor(),
          elevation: 0,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title,
                      style: TextStyle(
                        color:
                            themeNotifier.isDark ? Colors.white : Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(note.createdTime),
                      style: TextStyle(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      note.description,
                      style: TextStyle(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
      );
    });
  }

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
      );
}
