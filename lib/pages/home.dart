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
            Expanded(
              child: Stack(
                children: [
                  FutureBuilder(
                    future: Repository.fetchAll(),
                    builder:
                        (context, AsyncSnapshot<List<ItemModel>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(bottom: 90, top: 56),
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ShowsList(
                              isHeader: snapshot.data![index].isHeader ?? false,
                              query: snapshot.data![index].query ?? "null",
                              icon: snapshot.data![index].icon ?? "edit",
                              color:
                                  snapshot.data![index].color ?? "0xFF285fa4",
                              items: snapshot.data![index].results,
                              title: snapshot.data![index].title ?? "",
                              context: context,
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    },
                  ),
                  buildAppbar(),
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
            Colors.white,
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
              child: Icon(Icons.menu),
            ),
          ),
          Image.asset('assets/images/logo.png'),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
