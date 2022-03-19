import 'package:flutter/material.dart';
import 'package:tec/models/result.dart';

class ShowsList extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final String title;
  final List<Result> items;

  ShowsList({
    required this.title,
    required this.items,
  });

  List<Widget> renderItems() {
    return items.map((item) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
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
                          Text(
                            item.writer ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: Text(
                  item.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: renderItems(),
            ),
          )
        ],
      ),
    );
  }
}
