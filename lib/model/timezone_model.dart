// To parse this JSON data, do
//
//     final timezoneModel = timezoneModelFromJson(jsonString);

import 'dart:convert';

TimezoneModel timezoneModelFromJson(String str) =>
    TimezoneModel.fromJson(json.decode(str));

String timezoneModelToJson(TimezoneModel data) => json.encode(data.toJson());

class TimezoneModel {
  TimezoneModel({
    this.abbreviation,
    this.clientIp,
    this.datetime,
    this.dayOfWeek,
    this.dayOfYear,
    this.dst,
    this.dstFrom,
    this.dstOffset,
    this.dstUntil,
    this.rawOffset,
    this.timezone,
    this.unixtime,
    this.utcDatetime,
    this.utcOffset,
    this.weekNumber,
  });

  String? abbreviation;
  String? clientIp;
  DateTime? datetime;
  int? dayOfWeek;
  int? dayOfYear;
  bool? dst;
  DateTime? dstFrom;
  int? dstOffset;
  DateTime? dstUntil;
  int? rawOffset;
  String? timezone;
  int? unixtime;
  DateTime? utcDatetime;
  String? utcOffset;
  int? weekNumber;

  factory TimezoneModel.fromJson(Map<String, dynamic> json) => TimezoneModel(
        abbreviation: json["abbreviation"],
        clientIp: json["client_ip"],
        datetime: DateTime.parse(json["datetime"]),
        dayOfWeek: json["day_of_week"],
        dayOfYear: json["day_of_year"],
        dst: json["dst"],
        dstFrom: DateTime.parse(json["dst_from"]),
        dstOffset: json["dst_offset"],
        dstUntil: DateTime.parse(json["dst_until"]),
        rawOffset: json["raw_offset"],
        timezone: json["timezone"],
        unixtime: json["unixtime"],
        utcDatetime: DateTime.parse(json["utc_datetime"]),
        utcOffset: json["utc_offset"],
        weekNumber: json["week_number"],
      );

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation,
        "client_ip": clientIp,
        "datetime": datetime!.toIso8601String(),
        "day_of_week": dayOfWeek,
        "day_of_year": dayOfYear,
        "dst": dst,
        "dst_from": dstFrom!.toIso8601String(),
        "dst_offset": dstOffset,
        "dst_until": dstUntil!.toIso8601String(),
        "raw_offset": rawOffset,
        "timezone": timezone,
        "unixtime": unixtime,
        "utc_datetime": utcDatetime!.toIso8601String(),
        "utc_offset": utcOffset,
        "week_number": weekNumber,
      };
}
