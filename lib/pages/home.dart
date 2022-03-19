import 'package:flutter/material.dart';
import 'package:tec/models/item_model.dart';
import 'package:tec/models/repository.dart';
import 'package:tec/widgets/bottom_bar.dart';
import 'package:tec/widgets/show_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppbar(),
            Expanded(
              child: Stack(
                children: [
                  FutureBuilder(
                    future: Repository.fetchAll(),
                    builder:
                        (context, AsyncSnapshot<List<ItemModel>> snapshot) {
                      if (snapshot.hasData) {
                        return CustomScrollView(
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => ShowsList(
                                  items: snapshot.data![index].results,
                                  title: snapshot.data![index].title ?? "",
                                  context: context,
                                ),
                                childCount: snapshot.data!.length,
                              ),
                            )
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    },
                  ),
                  Positioned(left: 0, bottom: 0, child: BottomBar()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppbar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.8),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ),
          Image.asset('assets/images/logo.png'),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }
}
