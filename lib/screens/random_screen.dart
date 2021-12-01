import 'dart:convert';
import 'dart:math';
import 'package:flutter/painting.dart';
import 'package:grubhie/utilities/models.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/screens/loading_screen.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'loading_screen.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';

class RandomRecipe extends StatefulWidget {
  @override
  _RandomRecipeState createState() => _RandomRecipeState();
}

class _RandomRecipeState extends State<RandomRecipe> {
  bool loading = true;
  List<Model> list = <Model>[];
  var description = '';
  String? text;
  final headers = {
    "x-rapidapi-host": "yummly2.p.rapidapi.com",
    "x-rapidapi-key": "6f1631ab05msha6e80d8960887e3p1f86e2jsn8bd9de764450"
  };
  final url =
      'https://yummly2.p.rapidapi.com/feeds/list?limit=100&start=0&tag=list.recipe.popular';
  getApiData() async {
    var response = await http.get(Uri.parse(url), headers: headers);
    Map json = jsonDecode(response.body);
    var random = new Random();
    var index = random.nextInt(json['feed'].length);
    var e = json['feed'][index];

    try {
      description = e['seo']['firebase']['description'];
      Model model = Model(
        image: e['display']['images'][0],
        url: e['seo']['firebase']['webUrl'],
        source: e['display']['source']['sourceDisplayName'],
        label: e['display']['displayName'],
      );
      setState(() {
        loading = false;
        list.add(model);
      });
    } catch (e) {
      list.clear();
      getApiData();
    }
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
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Color(0x44000000),
                  elevation: 0,
                  title: Text('What to cook?'),
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
                  height: getScreenHeight(context),
                  width: getScreenWidth(context),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(list[0].image.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: getScreenHeight(context) * 0.8,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: getScreenWidth(context) * 0.05,
                              left: getScreenWidth(context) * 0.05),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Container(
                                height: getScreenHeight(context) * 0.014,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: getScreenHeight(context) * 0.05,
                                  horizontal: getScreenHeight(context) * 0.03,
                                ),
                                child: Text(list[0].label.toString(),
                                    style: TextStyle(
                                      color: 'e84060'.toColor(),
                                      fontSize: getScreenWidth(context) * 0.06,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 2,
                                          color: Colors.black.withOpacity(0.3),
                                        )
                                      ],
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                              MarkdownBody(
                                  styleSheet: MarkdownStyleSheet(
                                    h1: TextStyle(
                                      color: Colors.black,
                                    ),
                                    h2: TextStyle(
                                      color: Colors.black,
                                    ),
                                    p: TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlign: WrapAlignment.spaceBetween,
                                  ),
                                  data: description),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: getScreenWidth(context) * 0.03),
                                child: TextButton.icon(
                                    icon: Icon(Icons.arrow_right_alt_rounded),
                                    label: Text('VIEW FULL RECIPE'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WebPage(
                                                    url: list[0].url.toString(),
                                                  )));
                                    }),
                              )
                            ],
                          ),
                        ),
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
