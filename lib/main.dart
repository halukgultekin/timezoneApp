import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timezone_app/constants/constants.dart';
import 'package:flutter_timezone_app/screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Hive.initFlutter();
  await Hive.openBox('darkMode');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('darkMode').listenable(),
        builder: (context, Box box, widget) {
          // var darkMode = ;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Timezone App',
            themeMode: box.get('themeMode', defaultValue: false)
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(
                  centerTitle: true, color: Constats.kBackGroundLightColor),
            ),
            darkTheme: ThemeData.dark().copyWith(),
            home: SplashScreen(),
          );
        });
  }
}
