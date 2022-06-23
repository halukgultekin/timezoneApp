import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/my_list_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var darkMode = Hive.box("darkMode").get("themeMode", defaultValue: false);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height * 0.25,
                width: width,
                padding: EdgeInsets.only(left: 33, top: 63, right: 33),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 181, 211, 255),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Günaydın, Özgür!",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "09:54",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "8 Haziran Çarşamba",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(77, 0, 9, 55),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Hive.box("darkMode").get("themeMode") == true
                                ? Colors.white
                                : Color.fromARGB(238, 1, 18, 104),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: IconButton(
                          icon: Hive.box("darkMode").get("themeMode") == true
                              ? Icon(
                                  Icons.light_mode_outlined,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.dark_mode_outlined,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            setState(() {
                              if (Hive.box("darkMode").get("themeMode") ==
                                  true) {
                                darkMode = Hive.box("darkMode")
                                    .put("themeMode", false);
                              } else {
                                darkMode =
                                    Hive.box("darkMode").put("themeMode", true);
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: -22,
                child: Container(
                  width: width,
                  height: 44,
                  padding: EdgeInsets.symmetric(horizontal: 33),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Arama',
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 33, top: 40, right: 33),
            child: Column(
              children: [
                MyListButton(
                  width: width,
                  cityName: "Africa, Abidjan",
                ),
                MyListButton(
                  width: width,
                  cityName: "Africa, Abidjan",
                ),
                MyListButton(
                  width: width,
                  cityName: "Africa, Abidjan",
                ),
                MyListButton(
                  width: width,
                  cityName: "Africa, Abidjan",
                ),
                MyListButton(
                  width: width,
                  cityName: "Africa, Abidjan",
                ),
                MyListButton(
                  width: width,
                  cityName: "Africa, Abidjan",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
