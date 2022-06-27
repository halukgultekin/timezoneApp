import 'package:flutter/material.dart';
import 'package:flutter_timezone_app/constants.dart';
import 'package:flutter_timezone_app/model/timezone_model.dart';
import 'package:flutter_timezone_app/services/timezone_api.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hour_and_minute.dart';

class TimeZoneDetails extends StatefulWidget {
  String city;

  TimeZoneDetails({Key? key, required this.city}) : super(key: key);

  @override
  State<TimeZoneDetails> createState() => _TimeZoneDetailsState();
}

class _TimeZoneDetailsState extends State<TimeZoneDetails> {
  Map<String, dynamic> result = {};

  TimezoneModel? gelenCevap;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    gelenCevap = await RemoteService().getDetailsData();
    result = gelenCevap!.toJson();
    if (result != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/WORLD TIME2 1.png')),
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
        ),
      ),
      body: isLoaded == false
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: HourAndMinute(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text('xx',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: kTextColor))),
                          Text(result['timezone'],
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: kTextColor))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text('Carsamba, GMT +01:00',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: kTextColor))),
                          Text('Haziran 8, 2022',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: kTextColor)))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
