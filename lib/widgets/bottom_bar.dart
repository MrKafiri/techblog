import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      height: 70,
      width: _size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.6),
            Colors.white.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              Color(0xFF420b53),
              Color(0xFF130553),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(
                Icons.create_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(
                Icons.person_outline_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
