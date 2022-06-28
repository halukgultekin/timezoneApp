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
        abbreviation:
            json["abbreviation"] == null ? null : json["abbreviation"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        dayOfWeek: json["day_of_week"] == null ? null : json["day_of_week"],
        dayOfYear: json["day_of_year"] == null ? null : json["day_of_year"],
        dst: json["dst"] == null ? null : json["dst"],
        dstFrom:
            json["dst_from"] == null ? null : DateTime.parse(json["dst_from"]),
        dstOffset: json["dst_offset"] == null ? null : json["dst_offset"],
        dstUntil: json["dst_until"] == null
            ? null
            : DateTime.parse(json["dst_until"]),
        rawOffset: json["raw_offset"] == null ? null : json["raw_offset"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        unixtime: json["unixtime"] == null ? null : json["unixtime"],
        utcDatetime: json["utc_datetime"] == null
            ? null
            : DateTime.parse(json["utc_datetime"]),
        utcOffset: json["utc_offset"] == null ? null : json["utc_offset"],
        weekNumber: json["week_number"] == null ? null : json["week_number"],
      );

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation == null ? null : abbreviation,
        "client_ip": clientIp == null ? null : clientIp,
        "datetime": datetime == null ? null : datetime?.toIso8601String(),
        "day_of_week": dayOfWeek == null ? null : dayOfWeek,
        "day_of_year": dayOfYear == null ? null : dayOfYear,
        "dst": dst == null ? null : dst,
        "dst_from": dstFrom == null ? null : dstFrom?.toIso8601String(),
        "dst_offset": dstOffset == null ? null : dstOffset,
        "dst_until": dstUntil == null ? null : dstUntil?.toIso8601String(),
        "raw_offset": rawOffset == null ? null : rawOffset,
        "timezone": timezone == null ? null : timezone,
        "unixtime": unixtime == null ? null : unixtime,
        "utc_datetime":
            utcDatetime == null ? null : utcDatetime?.toIso8601String(),
        "utc_offset": utcOffset == null ? null : utcOffset,
        "week_number": weekNumber == null ? null : weekNumber,
      };
}
