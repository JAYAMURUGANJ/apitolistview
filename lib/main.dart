import 'package:flutter/material.dart';
import 'class/workshopdetails_class.dart';
import 'pages/ipab_causelist.dart';
import 'service/workshopdetails_services.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CauseListDetails(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool isLoading = true;

class _MyHomePageState extends State<MyHomePage> {
  List<WorkShopDetails> documents = [];
  List<WorkShopDetails> announcementList = [];

  var workdetails;

  @override
  void initState() {
    super.initState();

    fetchProfileInfo().then(
      (value) {
        setState(() {
          documents = value;
          announcementList = documents;
          isLoading = false;
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Work Details',
          ),
        ),
        body: SingleChildScrollView(
            child: isLoading
                ? Container(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: announcementList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // DateTime date =
                      //     DateTime.parse(announcementList[index].createdDate);

                      // String causeDate =
                      //     formatDate(date, [yyyy, '/', mm, '/', dd]);

                      // var det = announcementList[index]
                      //     .workDetails[0]
                      //     .toJson()
                      //     .forEach((k, v) =>
                      //         v.forEach((k, v) => print('${k}: ${v}')));

                      return Card(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ExpansionTile(
                                    leading: Icon(Icons.picture_as_pdf_rounded),
                                    title: Text(
                                        "Mechanic Name" +
                                            ": " +
                                            announcementList[index].name,
                                        textAlign: TextAlign.left),
                                    subtitle: Text(
                                        "Service" +
                                            ": " +
                                            announcementList[index].services,
                                        textAlign: TextAlign.left),
                                    children: [
                                      Column(
                                        children: announcementList[index]
                                            .workDetails[0]
                                            .toJson()
                                            .values
                                            .map<Widget>((v) => Container(
                                                color: Colors.white,
                                                padding: EdgeInsets.all(10.0),
                                                child: Table(
                                                    border: TableBorder.all(
                                                        color: Colors.black),
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Text("Place: " +
                                                              v['place'] +
                                                              "\n" +
                                                              "Bike Model : " +
                                                              v['bike_model'] +
                                                              "\n" +
                                                              "Owner Name : " +
                                                              v['owner_name']),
                                                        )
                                                      ])
                                                    ])))
                                            .toList(),
                                      ),
                                    ],
                                  )
                                ],
                              )));
                    })));
  }
}
