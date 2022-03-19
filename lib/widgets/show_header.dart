import 'package:flutter/material.dart';
import 'package:tec/models/result.dart';

class ShowsHeader extends StatelessWidget {
  final List<Result> items;
  final BuildContext context;

  ShowsHeader({
    required this.items,
    required this.context,
  });

  List<Widget> renderItems() {
    return items.map((item) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin:
                    EdgeInsets.only(right: 30, top: 30, left: 30, bottom: 10),
                width: double.infinity,
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
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/image.png',
                            placeholderFit: BoxFit.scaleDown,
                            image: item.imgUrl.toString(),
                            fit: BoxFit.cover,
                            imageErrorBuilder:
                                (BuildContext, Object, StackTrace) {
                              return Image.asset(
                                'assets/images/loading.png',
                                fit: BoxFit.scaleDown,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xFF201650),
                            Color(0xFF201650).withOpacity(0),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          SizedBox(height: 5),
                          Text(
                            item.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: renderItems(),
      ),
    );
  }
}
