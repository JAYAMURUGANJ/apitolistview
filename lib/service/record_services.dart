import 'dart:convert';
import 'package:apitolistview/class/record_class.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

const String url =
    'https://api.data.gov.in/resource/3f148185-0b3f-4aba-ab1c-9a0645e5f01c?api-key=579b464db66ec23bdd000001bc30dea24ddd4afc74a3e3b945e2a19b&format=json&offset=0&limit=all';

class MyHomePageProvider extends ChangeNotifier {
  MessageData data;
  MessageData district;
  MessageData taluk;

// ignore: missing_return
  Future<List<MessageData>> fetchforweb(context) async {
    final response = await http.get(url);

    // response code 200 means that the request was successful
    if (response.statusCode == 200) {
      final response = await http.get(url);
      var listofdata = response.body;
      var mJson = json.decode(listofdata);
      this.data = MessageData.fromJson(mJson);
      this.district = MessageData.fromJson(mJson);
      this.taluk = MessageData.fromJson(mJson);

      //removing the repeated district from the list
      var dis = this.district.records.map((rs) => rs.district).toSet();
      this.district.records.retainWhere((x) => dis.remove(x.district));

      //removing the repeated taluk from the list
      final tal = this.taluk.records.map((e) => e.teshilTaluk).toSet();
      this.taluk.records.retainWhere((x) => tal.remove(x.teshilTaluk));

      this.notifyListeners();
    }
  }
}
