import 'package:flutter/material.dart';
import 'package:tec/models/result.dart';

class ShowArticle extends StatelessWidget {
  const ShowArticle({Key? key, required this.item}) : super(key: key);
  final Result item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              title: Text(
                item.title ?? "",
                style: TextStyle(color: Colors.black),
              ),
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: item,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/image.png',
                    placeholderFit: BoxFit.scaleDown,
                    image: item.imgUrl.toString(),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (BuildContext, Object, StackTrace) {
                      return Image.asset(
                        'assets/images/loading.png',
                        fit: BoxFit.scaleDown,
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [Text('datdatadatadatadatadataa')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
