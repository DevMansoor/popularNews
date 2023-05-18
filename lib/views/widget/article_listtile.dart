import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/article_model.dart';

class ArticleListItem extends StatelessWidget {
  final Result? article;

  const ArticleListItem({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
      ),
      title: Text(article?.title ?? ''),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () async {
        final url = Uri.parse(article?.url ?? "");
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
