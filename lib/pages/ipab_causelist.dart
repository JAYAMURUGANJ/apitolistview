import 'package:apitolistview/class/causelist_class.dart';
import 'package:apitolistview/service/causelist_service.dart';
import 'package:flutter/material.dart';

class CauseListDetails extends StatefulWidget {
  @override
  _CauseListDetailsState createState() => _CauseListDetailsState();
}

bool isLoading = true;

class _CauseListDetailsState extends State<CauseListDetails> {
  List<Causelist> documents = [];
  List<Causelist> announcementList = [];

  var workdetails;

  @override
  void initState() {
    super.initState();

    fetchCauseList().then(
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
          'CauseList Details',
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
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
                  //     .subformcldetails[0]
                  //     .toJson()
                  //     .forEach((k, v) =>
                  //         v.forEach((k, v) => print('${k}: ${v}')));

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ExpansionTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                "https://www.ipab.gov.in/img/logo.jpg",
                                width: 80.0,
                              ),
                            ),
                            title: Text(
                                "BENCH" +
                                    ": " +
                                    announcementList[index]
                                        .jurisdiction
                                        .toUpperCase(),
                                textAlign: TextAlign.left),
                            subtitle: Text(
                                "SERVICE" +
                                    ": " +
                                    announcementList[index]
                                        .services
                                        .toUpperCase(),
                                textAlign: TextAlign.left),
                            children: [
                              Column(
                                children:
                                    announcementList[index]
                                                .causelistSubformData !=
                                            null
                                        ? announcementList[index]
                                            .causelistSubformData[0]
                                            .toJson()
                                            .values
                                            .map<Widget>(
                                              (v) => Container(
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
                                                                  .all(12.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "CASE NUMBER: "),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.8,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(
                                                                          v['case_number']
                                                                              .toUpperCase()),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "PETTINOR:        "),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.8,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(
                                                                          v['pettioner']
                                                                              .toUpperCase()),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "RESPONDENT: "),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.8,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child: Text(
                                                                          v['respondent']
                                                                              .toUpperCase()),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ])
                                                    ]),
                                              ),
                                            )
                                            .toList()
                                        : [Text("No Cases")],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
