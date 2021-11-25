import 'dart:convert';
import 'package:grubhie/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List<Model> list = <Model>[];
  String? text;
  final url =
      'https://api.edamam.com/search?q=chicken&app_id=2e2604e9&app_key=444a2c93c792b342e5507bba576d0220&from=0&to=100&calories=591-722&health=alcohol-free';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Recipes Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
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
                              builder: (context) => SearchPage(search: text)));
                    },
                    icon: Icon(Icons.search),
                  ),
                  hintText: "Search For Recipes..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.grey,
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
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: list.length,
                itemBuilder: (context, i) {
                  final x = list[i];
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
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            x.image.toString(),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            height: 20,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                x.label.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            height: 20,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                "source: " + x.source.toString(),
                                style: TextStyle(
                                  color: Colors.white,
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
  List<Model> list = <Model>[];
  String? text;

  getApiData(search) async {
    final url =
        'https://api.edamam.com/search?q=$search&app_id=2e2604e9&app_key=444a2c93c792b342e5507bba576d0220&from=0&to=100&calories=591-722&health=alcohol-free';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Recipes Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
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
                              builder: (context) => SearchPage()));
                    },
                    icon: Icon(Icons.search),
                  ),
                  hintText: "Search For Recipes..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.grey,
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
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: list.length,
                itemBuilder: (context, i) {
                  final x = list[i];
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
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            x.image.toString(),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            height: 20,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                x.label.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            height: 20,
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                "source: " + x.source.toString(),
                                style: TextStyle(
                                  color: Colors.white,
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
    );
  }
}
