import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tec/models/result.dart';
import 'package:intl/intl.dart';

class ShowArticle extends StatelessWidget {
  ShowArticle({Key? key, required this.item}) : super(key: key);
  final Result item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: _buildAppBar(context),
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleSpacing: 0,
              leadingWidth: 0,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 330,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Hero(
                      tag: item,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/image.png',
                        placeholderFit: BoxFit.scaleDown,
                        image: item.imgUrl.toString(),
                        fit: BoxFit.cover,
                        height: 220,
                        width: double.infinity,
                        imageErrorBuilder: (BuildContext, Object, StackTrace) {
                          return Image.asset(
                            'assets/images/loading.png',
                            fit: BoxFit.scaleDown,
                          );
                        },
                      ),
                    ),
                    _buildTitleAndWriter(),
                    Divider(
                      color: Colors.grey.withOpacity(0.4),
                      height: 10,
                      indent: 30,
                      endIndent: 30,
                      thickness: 1,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      item.content.toString(),
                    ),
                    SizedBox(height: 1200),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) {
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
            onTap: () => Navigator.of(context).pop(),
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10, right: 20, bottom: 10),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Marquee(
              text: item.title.toString(),
              style: TextStyle(
                fontFamily: 'MyFontBold',
                fontSize: 18,
              ),
              blankSpace: 100.0,
              accelerationDuration: Duration(milliseconds: 1000),
              decelerationDuration: Duration(milliseconds: 1000),
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
              SizedBox(width: 20),
              Text(
                timeAgoSinceDate(numericDates: true, dt: item.date.toString()),
                style: TextStyle(
                  fontFamily: 'MyFontMedium',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String timeAgoSinceDate({bool numericDates = true, required String dt}) {
    DateTime date = DateFormat("dd-MM-yyyy h:mma").parse(dt);
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);
    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} ثانیه پیش';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 دقیقه پیش' : '1 دقیقه پیش';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} دقیقه پیش';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 ساعت پیش' : '1 ساعت پیش';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} ساعت پیش';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 روز پیش' : 'دیروز';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} روز پیش';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 هفته پیش' : 'هفته پیش';
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} هفته پیش';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 ماه پیش' : 'ماه پیش';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} ماه پیش';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 سال پیش' : 'سال پیش';
    }
    return '${(difference.inDays / 365).floor()} سال پیش';
  }
}
