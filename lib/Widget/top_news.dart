import 'package:flutter/material.dart';
import 'package:newsapp/Model/news_model.dart';

class TopNews extends StatelessWidget {
  final NewsModel news;
  const TopNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Text(news.title);
  }
}
