import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:grubhie/utilities/favorites.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
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
                          return Center(
                            child: ListTile(
                              title: Text(favorite.label),
                              onLongPress: () {
                                setState(() {
                                  DatabaseHelper.instance.remove(favorite.id!);
                                });
                              },
                            ),
                          );
                        }).toList(),
                      );
              }),
        ),
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
