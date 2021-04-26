class Causelist {
  String id;
  String ordering;
  String state;
  String createdBy;
  String modifiedBy;
  String causeDate;
  String causeTime;
  String jurisdiction;
  String technicalMembers;
  String services;
  String judge;
  String attachment;
  String modifiedDate;
  String createdDate;
  List<CauselistSubformData> causelistSubformData;

  Causelist(
      {this.id,
      this.ordering,
      this.state,
      this.createdBy,
      this.modifiedBy,
      this.causeDate,
      this.causeTime,
      this.jurisdiction,
      this.technicalMembers,
      this.services,
      this.judge,
      this.attachment,
      this.modifiedDate,
      this.createdDate,
      this.causelistSubformData});

  Causelist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ordering = json['ordering'];
    state = json['state'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    causeDate = json['cause_date'];
    causeTime = json['cause_time'];
    jurisdiction = json['jurisdiction'];
    technicalMembers = json['technical_members'];
    services = json['services'];
    judge = json['judge'];
    attachment = json['attachment'];
    modifiedDate = json['modified_date'];
    createdDate = json['created_date'];
    if (json['causelistSubformData'] != null) {
      causelistSubformData = <CauselistSubformData>[];
      json['causelistSubformData'].forEach((v) {
        causelistSubformData.add(new CauselistSubformData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ordering'] = this.ordering;
    data['state'] = this.state;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['cause_date'] = this.causeDate;
    data['cause_time'] = this.causeTime;
    data['jurisdiction'] = this.jurisdiction;
    data['technical_members'] = this.technicalMembers;
    data['services'] = this.services;
    data['judge'] = this.judge;
    data['attachment'] = this.attachment;
    data['modified_date'] = this.modifiedDate;
    data['created_date'] = this.createdDate;
    if (this.causelistSubformData != null) {
      data['causelistSubformData'] =
          this.causelistSubformData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CauselistSubformData {
  Subformcldetails subformcldetails0;
  Subformcldetails subformcldetails1;
  Subformcldetails subformcldetails2;
  Subformcldetails subformcldetails3;
  Subformcldetails subformcldetails4;
  Subformcldetails subformcldetails5;
  Subformcldetails subformcldetails6;
  Subformcldetails subformcldetails7;
  Subformcldetails subformcldetails8;
  Subformcldetails subformcldetails9;

  CauselistSubformData(
      {this.subformcldetails0,
      this.subformcldetails1,
      this.subformcldetails2,
      this.subformcldetails3,
      this.subformcldetails4,
      this.subformcldetails5,
      this.subformcldetails6,
      this.subformcldetails7,
      this.subformcldetails8,
      this.subformcldetails9});

  CauselistSubformData.fromJson(Map<String, dynamic> json) {
    subformcldetails0 = json['subformcldetails0'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails0'])
        : null;
    subformcldetails1 = json['subformcldetails1'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails1'])
        : null;
    subformcldetails2 = json['subformcldetails2'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails2'])
        : null;
    subformcldetails3 = json['subformcldetails3'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails3'])
        : null;
    subformcldetails4 = json['subformcldetails4'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails4'])
        : null;
    subformcldetails5 = json['subformcldetails5'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails5'])
        : null;
    subformcldetails6 = json['subformcldetails6'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails6'])
        : null;
    subformcldetails7 = json['subformcldetails7'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails7'])
        : null;
    subformcldetails8 = json['subformcldetails8'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails8'])
        : null;
    subformcldetails9 = json['subformcldetails9'] != null
        ? new Subformcldetails.fromJson(json['subformcldetails9'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subformcldetails0 != null) {
      data['subformcldetails0'] = this.subformcldetails0.toJson();
    }
    if (this.subformcldetails1 != null) {
      data['subformcldetails1'] = this.subformcldetails1.toJson();
    }
    if (this.subformcldetails2 != null) {
      data['subformcldetails2'] = this.subformcldetails2.toJson();
    }
    if (this.subformcldetails3 != null) {
      data['subformcldetails3'] = this.subformcldetails3.toJson();
    }
    if (this.subformcldetails4 != null) {
      data['subformcldetails4'] = this.subformcldetails4.toJson();
    }
    if (this.subformcldetails5 != null) {
      data['subformcldetails5'] = this.subformcldetails5.toJson();
    }
    if (this.subformcldetails6 != null) {
      data['subformcldetails6'] = this.subformcldetails6.toJson();
    }
    if (this.subformcldetails7 != null) {
      data['subformcldetails7'] = this.subformcldetails7.toJson();
    }
    if (this.subformcldetails8 != null) {
      data['subformcldetails8'] = this.subformcldetails8.toJson();
    }
    if (this.subformcldetails9 != null) {
      data['subformcldetails9'] = this.subformcldetails9.toJson();
    }
    return data;
  }
}

class Subformcldetails {
  String mpNo;
  String services;
  String caseType;
  String caseYear;
  String pettioner;
  String capplicant;
  String hiringdate;
  String respondent;
  String caseNumber;
  String caseStatus;
  String crespondent;
  String jurisdiction;
  String applicationNumber;

  Subformcldetails(
      {this.mpNo,
      this.services,
      this.caseType,
      this.caseYear,
      this.pettioner,
      this.capplicant,
      this.hiringdate,
      this.respondent,
      this.caseNumber,
      this.caseStatus,
      this.crespondent,
      this.jurisdiction,
      this.applicationNumber});

  Subformcldetails.fromJson(Map<String, dynamic> json) {
    mpNo = json['mp_no'];
    services = json['Services'];
    caseType = json['case_type'];
    caseYear = json['case_year'];
    pettioner = json['pettioner'];
    capplicant = json['capplicant'];
    hiringdate = json['hiringdate'];
    respondent = json['respondent'];
    caseNumber = json['case_number'];
    caseStatus = json['case_status'];
    crespondent = json['crespondent'];
    jurisdiction = json['jurisdiction'];
    applicationNumber = json['application_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mp_no'] = this.mpNo;
    data['Services'] = this.services;
    data['case_type'] = this.caseType;
    data['case_year'] = this.caseYear;
    data['pettioner'] = this.pettioner;
    data['capplicant'] = this.capplicant;
    data['hiringdate'] = this.hiringdate;
    data['respondent'] = this.respondent;
    data['case_number'] = this.caseNumber;
    data['case_status'] = this.caseStatus;
    data['crespondent'] = this.crespondent;
    data['jurisdiction'] = this.jurisdiction;
    data['application_number'] = this.applicationNumber;
    return data;
  }
}
