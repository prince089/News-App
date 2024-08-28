import 'package:flutter/material.dart';
import 'package:newsapp/Asset/Theme/font_style.dart';
import 'package:newsapp/Model/news_model.dart';

class SingleNews extends StatelessWidget {
  final NewsModel news;
  const SingleNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3,
                color: Colors.grey,
                offset: Offset(2, 2),
                spreadRadius: 1)
          ]),
      child: Row(
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                news.image,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 0.5,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: AppTextTheme.h2,
                  ),
                  Text(
                    news.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
          //
        ],
      ),
    );
  }
}
