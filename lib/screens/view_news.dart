import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapi/cubits/news_api/news_api_cubit.dart';
import 'package:newsapi/dependancy_injection/dependancy_injection.dart';
import 'package:newsapi/screens/view_article.dart';
import 'package:newsapi/theme/theme.dart';

class ViewNews extends StatefulWidget {
  final String countryCode;
  final String category;
  ViewNews({@required this.category, @required this.countryCode});
  @override
  _ViewNewsState createState() => _ViewNewsState();
}

class _ViewNewsState extends State<ViewNews> {
  @override
  void initState() {
    inject<NewsApiCubit>()
        .fetchNews(category: widget.category, countryCode: widget.countryCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("View News"),
        backgroundColor: AppColors.appBarColor,
      ),
      body: BlocConsumer<NewsApiCubit, NewsApiState>(
        cubit: inject<NewsApiCubit>(),
        listener: (context, state) {
          if (state is NewsErrorState) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              backgroundColor: Colors.white,
              textColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          if (state is NewsLoadingState || state is NewsInitial) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[600],
              ),
            );
          } else if (state is NewsLoadedState) {
            return SingleChildScrollView(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.newsModel.articles.length,
                itemBuilder: (context, item) {
                  final data = state.newsModel.articles[item];

                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ViewArticle(articleModel: data)));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            data.urlToImage == null
                                ? Icon(Icons.error)
                                : Image.network("${data.urlToImage}"),
                            Text(
                              "${data.title}",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${data.description}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Failed to load News"),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text("Retry"),
                    onPressed: () {
                      inject<NewsApiCubit>().fetchNews(
                          category: widget.category,
                          countryCode: widget.countryCode);
                    },
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Text("Something Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
