import 'package:flutter/material.dart';
import 'package:newsapi/cubit/news_api/news_api_cubit.dart';
import 'package:newsapi/dependancy_injection/dependancy_injection.dart';
import 'package:newsapi/screens/view_news.dart';
import 'package:newsapi/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  var countryCode;
  var newsCategory;
  List<String> _countryCode = <String>[
    'in',
    'gr',
    'ca',
    'us',
    'br',
    'za',
  ];

  List<String> _newsCategory = <String>[
    'sports',
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'technology',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: Text("News"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DropdownButtonFormField(
                        items: _countryCode
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (selectedCountryCode) {
                          if (mounted)
                            setState(() {
                              countryCode = selectedCountryCode;
                            });
                        },
                        value: countryCode,
                        isExpanded: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          labelText: 'Country code',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DropdownButtonFormField(
                        items: _newsCategory
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (selectednewsCategory) {
                          if (mounted)
                            setState(() {
                              newsCategory = selectednewsCategory;
                            });
                        },
                        value: newsCategory,
                        isExpanded: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          labelText: 'News Category',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewNews(
                      category: newsCategory,
                      countryCode: countryCode,
                    ),
                  ),
                );
              },
              child: Text("Fetch News"),
            )

            // Center(
            //   child: RaisedButton(
            //     onPressed: () async {
            //       final response = await NewsRepositories()
            //           .fetchNews(counrtyCode: "in", newsCategory: "technology");
            //       setState(() {
            //         data = response;
            //       });
            //     },
            //     child: Text("Fetch News"),
            //   ),
            // ),
            // Text(data.toString()),
          ],
        ),
      ),
    );
  }
}
