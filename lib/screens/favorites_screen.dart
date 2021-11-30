import 'package:flutter/material.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:grubhie/utilities/favorites.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorites',
          style: TextStyle(fontSize: 24),
        ),
        // actions: [Icon(Icons.search), SizedBox(width: 12)],
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: getScreenWidth(context) * 0.02,
            bottom: getScreenWidth(context) * 0.02),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_plain.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Favorites>>(
            future: DatabaseHelper.instance.getFavorites(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Favorites>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? Center(child: Text('No Favorites PO.'))
                  : ListView(
                      children: snapshot.data!.map((favorite) {
                        return Container(
                            margin: EdgeInsets.only(
                                top: getScreenWidth(context) * 0.02,
                                right: getScreenWidth(context) * 0.04,
                                left: getScreenWidth(context) * 0.04,
                                bottom: getScreenWidth(context) * 0.02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(favorite.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.black.withOpacity(0),
                                    Colors.black.withOpacity(0.3),
                                  ],
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(
                                    getScreenWidth(context) * 0.06),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: GestureDetector(
                                          child: Text(
                                            favorite.label,
                                            style: (TextStyle(
                                                fontSize:
                                                    getScreenWidth(context) *
                                                        0.045,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebPage(
                                                          url: favorite.url,
                                                        )));
                                          },
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: getScreenWidth(context) * 0.08,
                                        ),
                                        onTap: () {
                                          _showDialog(context, favorite.label);
                                          setState(() {
                                            DatabaseHelper.instance
                                                .remove(favorite.id!);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }).toList(),
                    );
            }),
      ),
    );
  }
}

class WebPage extends StatelessWidget {
  final url;
  WebPage({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Alert!"),
        content: new Text('You removed ' + text + ' from Favorites.'),
        actions: <Widget>[
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
