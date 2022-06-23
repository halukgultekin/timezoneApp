import 'package:flutter/material.dart';
import 'package:flutter_timezone_app/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hour_and_minute.dart';

class TimeZoneDetails extends StatelessWidget {
  const TimeZoneDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/WORLD TIME2 1.png')),
              color: Constats.kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
        ),
      ),
      body: ListView(
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
                    Text('Abidjan',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Constats.kBackGroundDarkColor))),
                    Text('Africa',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Constats.kBackGroundDarkColor))),
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
                                color: Constats.kBackGroundDarkColor))),
                    Text('Haziran 8, 2022',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Constats.kBackGroundDarkColor)))
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
