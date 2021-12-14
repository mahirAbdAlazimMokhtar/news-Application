import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

Widget buildArticleItem(article) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${article['urlToImage']}',
                ),
              )),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    maxLines: 3,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
