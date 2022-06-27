import 'package:flutter/material.dart';
import 'package:flutter_timezone_app/constants.dart';
import 'package:flutter_timezone_app/screens/details_screen.dart';
import 'package:flutter_timezone_app/services/timezone_api.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List? sehirlistesi;
  var isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    sehirlistesi = await RemoteService().getCityData();
    if (sehirlistesi != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.272,
            child: Stack(children: [
              Container(
                height: size.height * 0.272 - 22,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kSearchBorderColor),
                        borderRadius: BorderRadius.circular(99)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Arama',
                          hintStyle: GoogleFonts.montserrat(
                              color: kTextColor, fontSize: 12),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Image.asset('assets/icons/search.png')),
                    ),
                  ))
            ]),
          ),
          Expanded(
            child: Visibility(
              visible: isloaded,
              child: ListView.builder(
                  itemCount: sehirlistesi?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                            color: kPrimaryColor,
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimeZoneDetails(
                                                city: sehirlistesi?[index],
                                              )));
                                },
                                title: Text(
                                  sehirlistesi?[index],
                                  style: GoogleFonts.montserrat(
                                      color: kTextColor, fontSize: 15),
                                ))),
                        Positioned(
                          top: 15,
                          right: -13,
                          child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 3, color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: kTextColor,
                              )),
                          height: 31,
                          width: 31,
                        ),
                      ]),
                    );
                  }),
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
