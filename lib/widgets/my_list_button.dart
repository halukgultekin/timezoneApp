import 'package:flutter/material.dart';

class MyListButton extends StatelessWidget {
  const MyListButton({Key? key, required this.width, required this.cityName})
      : super(key: key);

  final double width;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          width: width,
          height: 60,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(227, 238, 255, 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Text(
            cityName,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Positioned(
          right: -15,
          bottom: 20,
          child: Container(
            width: 30,
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 237, 254),
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: const Icon(
                Icons.navigate_next_rounded,
              ),
            ),
          ),
        )
      ],
    );
  }
}
