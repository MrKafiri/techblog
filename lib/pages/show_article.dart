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
              title: _buildAppBar(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 0,
              leadingWidth: 0,
              stretch: true,
              floating: true,
              pinned: true,
              snap: true,
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
                children: [SizedBox(height: 1200)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF351244),
          Color(0xFF351244).withOpacity(0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back),
            ),
          ),
          Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share_outlined),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.star_border_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
