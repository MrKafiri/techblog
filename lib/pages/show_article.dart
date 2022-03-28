import 'package:flutter/material.dart';
import 'package:tec/models/result.dart';
import 'package:intl/intl.dart';

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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [_buildTitleAndWriter()],
                ),
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
              child: Icon(Icons.bookmark_border_outlined),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndWriter() {
    return Column(
      children: [
        Text(
          item.title.toString(),
          style: TextStyle(
            fontFamily: 'MyFontBold',
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              item.writer.toString(),
              style: TextStyle(
                fontFamily: 'MyFontMedium',
                fontSize: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              timeAgoSinceDate(numericDates: true, dt: item.date.toString()),
              style: TextStyle(
                fontFamily: 'MyFontMedium',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }

  String timeAgoSinceDate({bool numericDates = true, required String dt}) {
    DateTime date = DateFormat("dd-MM-yyyy h:mma").parse(dt);

    print(date);
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }
}
