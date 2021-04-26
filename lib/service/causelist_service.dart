import 'dart:io';
import 'package:apitolistview/class/causelist_class.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

const String url = 'https://rtionline.tn.gov.in/ipab/dev/causlist_details.json';

// ignore: missing_return
Future<List<Causelist>> fetchCauseList() async {
  String fileName = "workshopdeta.json";

  var dir = await getApplicationDocumentsDirectory();

  File file = new File(dir.path + "/" + fileName);

  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    try {
      print("Loading from API on Mobile");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var listofdata = response.body;
        //print(listofdata);
        List<Causelist> list = parseUsers(listofdata);
        file.writeAsStringSync(listofdata, flush: true, mode: FileMode.write);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    try {
      print("Loading from API on Desktop or wifi or lan or pc");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var listofdata = response.body;
        //print(listofdata);
        List<Causelist> list = parseUsers(listofdata);
        //print(list);
        file.writeAsStringSync(listofdata, flush: true, mode: FileMode.write);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  } else if (file.existsSync()) {
    print("Loading from cache");
    var jsonData = file.readAsStringSync();
    List<Causelist> list = parseUsers(jsonData);
    return list;
  } else {
    print("App first time loaded. So please on mobile data.");
  }
}

// ignore: missing_return
Future<List<Causelist>> fetchforweb() async {
  final response = await http.get(url);

  // response code 200 means that the request was successful
  if (response.statusCode == 200) {
    List<Causelist> list = parseUsers(response.body);
    return list;
  }
}

List<Causelist> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Causelist>((json) => Causelist.fromJson(json)).toList();
}
