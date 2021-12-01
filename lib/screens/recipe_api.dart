import 'dart:convert';
import 'package:grubhie/utilities/models.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/screens/loading_screen.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:grubhie/utilities/favorites.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  Color myColor = Colors.white;
  bool loading = true;
  List<Model> list = <Model>[];
  String? text;
  final url =
      'https://api.edamam.com/search?q=cake&app_id=2e2604e9&app_key=444a2c93c792b342e5507bba576d0220&from=0&to=20&calories=591-722&health=alcohol-free';
  getApiData() async {
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      Model model = Model(
        url: e['recipe']['url'],
        image: e['recipe']['image'],
        source: e['recipe']['source'],
        label: e['recipe']['label'],
      );
      setState(() {
        loading = false;
        list.add(model);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return loading
          ? Loading()
          : SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: themeNotifier.isDark
                      ? '424242'.toColor()
                      : 'ea9052'.toColor(),
                  elevation: 0,
                  titleTextStyle:
                      TextStyle(fontFamily: 'patrickHand', fontSize: 25),
                  title: Text('Search Recipes'),
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
                        color:
                            themeNotifier.isDark ? Colors.yellow : Colors.white,
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
                  padding: EdgeInsets.only(
                      top: getScreenWidth(context) * 0.05,
                      right: getScreenWidth(context) * 0.03,
                      bottom: getScreenWidth(context) * 0,
                      left: getScreenWidth(context) * 0.03),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          onChanged: (v) {
                            text = v;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchPage(search: text)));
                              },
                              icon: Icon(
                                Icons.search,
                                color: themeNotifier.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            hintText: "Search For Recipes..",
                            hintStyle: TextStyle(
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: themeNotifier.isDark
                                ? Colors.grey
                                : Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          primary: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (16 / 25),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 18,
                                  mainAxisSpacing: 18),
                          itemCount: list.length,
                          itemBuilder: (context, i) {
                            final x = list[i];
                            Color col = randomColor();

                            return InkWell(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset(0, 1.3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  x.image.toString(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: FutureBuilder<bool>(
                                                future: DatabaseHelper.instance
                                                    .isFavorite(
                                                        x.label.toString(),
                                                        x.source.toString()),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<bool>
                                                        snapshot) {
                                                  if (snapshot.data == true) {
                                                    myColor = Colors.red;
                                                  } else {
                                                    myColor = Colors.white;
                                                  }
                                                  return IconButton(
                                                    // style: ,
                                                    icon: DecoratedIcon(
                                                      Icons.favorite,
                                                      color: myColor,
                                                      size: getScreenWidth(
                                                              context) *
                                                          0.05,
                                                      shadows: [
                                                        BoxShadow(
                                                          blurRadius: 13.0,
                                                          color: Colors.black,
                                                        ),
                                                      ],
                                                    ),

                                                    onPressed: () async {
                                                      if (snapshot.data ==
                                                          true) {
                                                        setState(() {
                                                          myColor =
                                                              Colors.white;
                                                          DatabaseHelper
                                                              .instance
                                                              .remove_heart(x
                                                                  .label
                                                                  .toString());
                                                        });
                                                      } else {
                                                        setState(() {
                                                          myColor = Colors.red;
                                                        });

                                                        await DatabaseHelper
                                                            .instance
                                                            .add(Favorites(
                                                                url: x.url
                                                                    .toString(),
                                                                label: x.label
                                                                    .toString(),
                                                                image: x.image
                                                                    .toString(),
                                                                source: x.source
                                                                    .toString()));
                                                      }
                                                    },
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        color: col,
                                        child: Center(
                                          child: Text(
                                            x.label.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  getScreenWidth(context) *
                                                      0.045,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'font2',
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
                                              fontSize:
                                                  getScreenWidth(context) *
                                                      0.028,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
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

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  String? search;
  SearchPage({this.search});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Color myColor = Colors.white;
  bool loading = true;
  List<Model> list = <Model>[];
  String? text;

  getApiData(search) async {
    final url =
        'https://api.edamam.com/search?q=$search&app_id=2e2604e9&app_key=444a2c93c792b342e5507bba576d0220&from=0&to=20&calories=591-722&health=alcohol-free';
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    json['hits'].forEach((e) {
      Model model = Model(
        url: e['recipe']['url'],
        image: e['recipe']['image'],
        source: e['recipe']['source'],
        label: e['recipe']['label'],
      );
      setState(() {
        loading = false;
        list.add(model);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData(widget.search);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return loading
          ? Loading()
          : SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: themeNotifier.isDark
                      ? '424242'.toColor()
                      : 'ea9052'.toColor(),
                  elevation: 0,
                  titleTextStyle:
                      TextStyle(fontFamily: 'patrickHand', fontSize: 25),
                  title: Text('Search Recipes'),
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
                        color:
                            themeNotifier.isDark ? Colors.yellow : Colors.white,
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
                  padding: EdgeInsets.only(
                      top: getScreenWidth(context) * 0.05,
                      right: getScreenWidth(context) * 0.03,
                      bottom: getScreenWidth(context) * 0,
                      left: getScreenWidth(context) * 0.03),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          onChanged: (v) {
                            text = v;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchPage(search: text)));
                              },
                              icon: Icon(
                                Icons.search,
                                color: themeNotifier.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            hintText: "Search For Recipes..",
                            hintStyle: TextStyle(
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: themeNotifier.isDark
                                ? Colors.grey
                                : Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          primary: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: (16 / 25),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 18,
                                  mainAxisSpacing: 18),
                          itemCount: list.length,
                          itemBuilder: (context, i) {
                            final x = list[i];
                            Color col = randomColor();

                            return InkWell(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset(0, 1.3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  x.image.toString(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: FutureBuilder<bool>(
                                                future: DatabaseHelper.instance
                                                    .isFavorite(
                                                        x.label.toString(),
                                                        x.source.toString()),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<bool>
                                                        snapshot) {
                                                  if (snapshot.data == true) {
                                                    myColor = Colors.red;
                                                  } else {
                                                    myColor = Colors.white;
                                                  }
                                                  return IconButton(
                                                    // style: ,
                                                    icon: DecoratedIcon(
                                                      Icons.favorite,
                                                      color: myColor,
                                                      size: getScreenWidth(
                                                              context) *
                                                          0.05,
                                                      shadows: [
                                                        BoxShadow(
                                                          blurRadius: 13.0,
                                                          color: Colors.black,
                                                        ),
                                                      ],
                                                    ),

                                                    onPressed: () async {
                                                      if (snapshot.data ==
                                                          true) {
                                                        setState(() {
                                                          myColor =
                                                              Colors.white;
                                                          DatabaseHelper
                                                              .instance
                                                              .remove_heart(x
                                                                  .label
                                                                  .toString());
                                                        });
                                                      } else {
                                                        setState(() {
                                                          myColor = Colors.red;
                                                        });

                                                        await DatabaseHelper
                                                            .instance
                                                            .add(Favorites(
                                                                url: x.url
                                                                    .toString(),
                                                                label: x.label
                                                                    .toString(),
                                                                image: x.image
                                                                    .toString(),
                                                                source: x.source
                                                                    .toString()));
                                                      }
                                                    },
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        color: col,
                                        child: Center(
                                          child: Text(
                                            x.label.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  getScreenWidth(context) *
                                                      0.045,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'font2',
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
                                              fontSize:
                                                  getScreenWidth(context) *
                                                      0.028,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
