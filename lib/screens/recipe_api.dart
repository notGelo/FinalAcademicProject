import 'dart:convert';
import 'package:grubhie/utilities/models.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/screens/loading_screen.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:grubhie/utilities/constants.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
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
    return loading
        ? Loading()
        : SafeArea(
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
                            icon: Icon(Icons.search),
                          ),
                          hintText: "Search For Recipes..",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.white,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (16 / 20),
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
                                    offset: Offset(
                                        0, 1.3), // changes position of shadow
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
                          );
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

class SearchPage extends StatefulWidget {
  String? search;
  SearchPage({this.search});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    return loading
        ? Loading()
        : SafeArea(
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
                            icon: Icon(Icons.search),
                          ),
                          hintText: "Search For Recipes..",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.white,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (16 / 20),
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
                                    offset: Offset(
                                        0, 1.3), // changes position of shadow
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
                          );
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
