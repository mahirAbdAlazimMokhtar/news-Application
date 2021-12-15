import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CachedNetworkImage(
          height: 120.0,
          width: 120.0,
          fit: BoxFit.cover,
          imageUrl: '${article['urlToImage']}',
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText1,
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
