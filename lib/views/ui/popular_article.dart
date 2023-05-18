import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mansoor_assessment/provider_services/articles_provider.dart';
import 'package:provider/provider.dart';

import '../widget/article_listtile.dart';

class PopularArticles extends StatefulWidget {
  const PopularArticles({Key? key}) : super(key: key);

  @override
  State<PopularArticles> createState() => _PopularArticlesState();
}

class _PopularArticlesState extends State<PopularArticles> {
  @override
  void initState() {
    _fetchArticles();
    super.initState();
  }

  _fetchArticles() async {
    await Provider.of<ArticlesProvider>(context, listen: false).fetchMostPopularArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Most Popular Articles'),
          centerTitle: true,
        ),
        body: Consumer<ArticlesProvider>(builder: (context, articlesProvider, _) {
          final articles = articlesProvider.articles;

          if (articles == null) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return ListView.builder(
              itemCount: articles.results?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final article = articles.results?[index];
                return ArticleListItem(article: article);
              });
        }),
      ),
    );
  }
}
