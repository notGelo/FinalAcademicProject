import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grubhie/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:grubhie/customWidgets/change_theme_button_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Favorites extends StatefulWidget {
  final state;
  Favorites({this.state});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  var list;

  @override
  Widget build(BuildContext context) {
    list = widget.state['listFavorites']();

    var isEmpty = (list.length == 0);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     ChangeThemeButtonWidget(),
        //   ],
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_plain.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(
              top: getScreenWidth(context) * 0.05,
              right: getScreenWidth(context) * 0.03,
              bottom: getScreenWidth(context) * 0,
              left: getScreenWidth(context) * 0.03),
          child: SingleChildScrollView(
            child: isEmpty ? Text('Favorite list is empty.') : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (16 / 20),
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final x = list[i];
                    Color col = randomColor();
                    return Stack(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebPage(
                                    url: x.url,
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                offset:
                                Offset(0, 1.3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          x.image.toString(),
                                        ),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  color: col,
                                  child: Center(
                                    child: Text(
                                      x.label.toString().toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(0.5, 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    color: col,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "from " + x.source.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned( // will be positioned in the top right of the container
                        top: 0,
                        right: 0,
                        // child: Icon(
                        //   FontAwesomeIcons.solidHeart, color: Colors.white,
                        // ),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.solidHeart, color: 
                    widget.state['favorites'][x.url] is Model ? Colors.red : Colors.white,
                          ),
                          onPressed: (() {
                            var state = widget.state;
                            bool isFavorite = widget.state['favorites'][x.url] is Model;

                            if (isFavorite) {
                              // TODO: remove favorite
                              state['removeFavorite'](x.url);
                            } else {
                              // not favorite yet, so add it.
                              state['addFavorite'](x);
                            }
                          }))
                      )
                    ]);
                  },
                )
              ],
            ),
          ),
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
