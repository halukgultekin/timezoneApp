import 'package:flutter_timezone_app/model/city_model.dart';
import 'package:flutter_timezone_app/model/timezone_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future getCityData() async {
    var client = http.Client();

    var uri = Uri.parse('https://worldtimeapi.org/api/timezone');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return cityListFromJson(json);
    }
  }

  Future getDetailsData() async {
    var client = http.Client();

    var uri =
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London.json');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return timezoneModelFromJson(json);
    } else {
      'hata';
    }
  }
}
