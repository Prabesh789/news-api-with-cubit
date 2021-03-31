import 'package:flutter/material.dart';
import 'package:newsapi/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class ViewArticle extends StatefulWidget {
  final ArticlesModel articleModel;

  ViewArticle({@required this.articleModel});
  @override
  _ViewArticleState createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  bool _isLoading = true;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Article",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: widget.articleModel.url,
                onWebViewCreated: ((WebViewController webViewController) {
                  _completer.complete(webViewController);
                }),
                onPageFinished: (finished) {
                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
            ),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
