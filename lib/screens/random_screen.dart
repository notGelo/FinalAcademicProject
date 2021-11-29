import 'dart:convert';
import 'dart:math';
import 'package:grubhie/utilities/models.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/screens/loading_screen.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'loading_screen.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('What to cook?'),
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
                  image: AssetImage('assets/images/bg_plain.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MarkdownBody(data: description),
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
