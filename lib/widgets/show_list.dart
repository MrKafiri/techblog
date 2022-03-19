import 'package:flutter/material.dart';
import 'package:tec/models/result.dart';

class ShowsList extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final String title;
  final String color;
  final String query;
  final String icon;
  final List<Result> items;
  final BuildContext context;

  ShowsList({
    required this.color,
    required this.icon,
    required this.query,
    required this.title,
    required this.items,
    required this.context,
  });

  List<Widget> renderItems() {
    return items.map((item) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Container(
                width: 155,
                height: 155,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Hero(
                          tag: item,
                          child: Image.network(
                            item.imgUrl.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.writer ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(width: 3),
                              Text(
                                '1254',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ), //*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    item.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    Icon(
                      IconData(int.parse(icon), fontFamily: 'MaterialIcons'),
                      color: Color(
                        int.parse(color),
                      ),
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'MyFontBold',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          int.parse(color),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'نمایش همه >',
                      style: TextStyle(
                        fontFamily: 'MyFontBold',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          int.parse(color),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            physics: BouncingScrollPhysics(),
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: renderItems(),
            ),
          )
        ],
      ),
    );
  }
}
