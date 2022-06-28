import 'package:flutter/material.dart';
import 'package:flutter_timezone_app/constants.dart';
import 'package:flutter_timezone_app/model/timezone_model.dart';
import 'package:flutter_timezone_app/services/timezone_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
    String selectedTimezone = result['datetime'].toString();

    String offset = result['utc_offset'].toString().substring(0, 3);
    DateTime now = DateTime.parse(selectedTimezone);
    now = now.add(Duration(hours: int.parse(offset)));
    String nowHour = DateFormat('HH').format(DateTime.parse(now.toString()));
    String selectedTimezoneMinute =
        DateFormat('mm').format(DateTime.parse(selectedTimezone));
    String selectedTextDay =
        DateFormat.EEEE('tr').format(DateTime.parse(selectedTimezone));
    String selectedTimezoneDay =
        DateFormat.MMMMd('tr').format(DateTime.parse(selectedTimezone));
    String selectedTimezoneYear =
        DateFormat.y('tr').format(DateTime.parse(selectedTimezone));

    String countries = result['timezone'].toString();
    List<String> clist = countries.split('/');
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
          : Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: kTextColor, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              height: 140,
                              width: 140,
                              child: Center(
                                  child: Text(
                                nowHour.toString(),
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: 79,
                                        fontWeight: FontWeight.w600,
                                        color: kTextColor)),
                              )),
                            ),
                            Container(
                                child: Text(':',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 79, color: kTextColor)))),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: kTextColor, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              height: 140,
                              width: 140,
                              child: Center(
                                child: Text(selectedTimezoneMinute,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 79,
                                            fontWeight: FontWeight.w600,
                                            color: kTextColor))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(clist[0],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: kTextColor))),
                            Text(clist[1],
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
                            Text(
                                selectedTextDay +
                                    ', GMT ' +
                                    result['utc_offset'],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: kTextColor))),
                            Text(
                                selectedTimezoneDay +
                                    ', ' +
                                    selectedTimezoneYear,
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
            ),
    );
  }
}
