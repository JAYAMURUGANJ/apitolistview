import 'dart:io';
import 'package:apitolistview/class/workshopdetails_class.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

const String url =
    'https://storage.googleapis.com/s3.codeapprun.io/userassets/jayamurugan/YvNGFagKOVnew_causelist.json';

// ignore: missing_return
Future<List<WorkShopDetails>> fetchProfileInfo() async {
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
        List<WorkShopDetails> list = parseUsers(listofdata);
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
        List<WorkShopDetails> list = parseUsers(listofdata);
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
    List<WorkShopDetails> list = parseUsers(jsonData);
    return list;
  } else {
    print("App first time loaded. So please on mobile data.");
  }
}

// ignore: missing_return
Future<List<WorkShopDetails>> fetchforweb() async {
  final response = await http.get(url);

  // response code 200 means that the request was successful
  if (response.statusCode == 200) {
    List<WorkShopDetails> list = parseUsers(response.body);
    return list;
  }
}

List<WorkShopDetails> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<WorkShopDetails>((json) => WorkShopDetails.fromJson(json))
      .toList();
}
