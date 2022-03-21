import 'package:flutter/material.dart';
import 'package:tec/models/item_model.dart';

class ShowsList extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();

  final ItemModel itemModel;
  final BuildContext context;

  ShowsList({
    required this.itemModel,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    if (itemModel.type == "list") {
      return ShowList();
    } else if (itemModel.type == "header") {
      return ShowHeader();
    } else {
      return ShowCategory();
    }
  }

  Container ShowCategory() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: renderItemsCategory(),
        ),
      ),
    );
  }

  List<Widget> renderItemsCategory() {
    return itemModel.resultCategory.map((item) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.6),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )),
            child: Row(
              children: [
                Icon(
                  Icons.tag_outlined,
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(width: 5),
                Text(
                  item.title ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Container ShowHeader() {
    return Container(
      width: double.infinity,
      height: 155,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: renderItemsHeader(),
      ),
    );
  }

  List<Widget> renderItemsHeader() {
    return itemModel.results.map((item) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 155,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
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
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
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
      );
    }).toList();
  }

  Container ShowList() {
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
                      IconData(int.parse(itemModel.icon ?? "0xe89b"),
                          fontFamily: 'MaterialIcons'),
                      color: Color(
                        int.parse(itemModel.color ?? "0xFF533E85"),
                      ),
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      itemModel.title ?? "",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'MyFontBold',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          int.parse(itemModel.color ?? "0xFF533E85"),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
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
                          int.parse(itemModel.color ?? "0xFF533E85"),
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
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: renderItemsList(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderItemsList() {
    return itemModel.results.map((item) {
      return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 165,
          height: 210,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: 150,
                height: 150,
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
                              Text(
                                item.like ?? "0",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 3),
                              Icon(
                                Icons.favorite,
                                size: 14,
                                color: Colors.white,
                              ),
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
}
