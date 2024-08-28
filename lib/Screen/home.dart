import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/Asset/Theme/font_style.dart';
import 'package:newsapp/Asset/app_string.dart';
import 'package:newsapp/Model/news_model_res_dm.dart';
import 'package:newsapp/Service/api_repository.dart';
import 'package:newsapp/Widget/single_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiRepository apiRepository = ApiRepository();
  NewsModelResDM newsdata = NewsModelResDM(data: [], count: 0);
  bool isMoreDataLoading = false;
  final newsScrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    getNews();
    needToLoadMoredata();
  }

  Future getNews({page = 1}) async {
    log("page $page");
    if (page == 1) {
      newsdata = await apiRepository.getNews(page: page);
    } else {
      isMoreDataLoading = true;
      setState(() {});
      newsdata.data.addAll((await apiRepository.getNews(page: page)).data);
      isMoreDataLoading = false;
    }
    setState(() {});
  }

  void needToLoadMoredata() {
    newsScrollController.addListener(() {
      if (newsScrollController.position.atEdge &&
          newsScrollController.position.pixels != 0 &&
          newsdata.count > newsdata.data.length) {
        log("count ${newsdata.count} length: ${newsdata.data.length}");
        getNews(page: ++currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: newsdata.data.isNotEmpty
          ? Container(margin: const EdgeInsets.only(top: 20), child: news())
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget news() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.recentNews,
            style: AppTextTheme.h1,
          ),
          Expanded(
            child: ListView.builder(
              controller: newsScrollController,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SingleNews(news: newsdata.data[index]),
                    if (isMoreDataLoading && index == newsdata.data.length - 1)
                      const CircularProgressIndicator(),
                  ],
                );
              },
              itemCount: newsdata.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
