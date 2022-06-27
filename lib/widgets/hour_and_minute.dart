import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class HourAndMinute extends StatelessWidget {
  const HourAndMinute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kTextColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(14))),
          height: 140,
          width: 140,
          child: Center(
              child: Text(
            '13',
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
                    textStyle: TextStyle(fontSize: 79, color: kTextColor)))),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kTextColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(14))),
          height: 140,
          width: 140,
          child: Center(
            child: Text('48',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 79,
                        fontWeight: FontWeight.w600,
                        color: kTextColor))),
          ),
        )
      ],
    );
  }
}
