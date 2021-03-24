import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstEntry {
  String help;
  bool success;
  Result result;

  FirstEntry({this.help, this.success, this.result});

  FirstEntry.fromJson(Map<String, dynamic> json) {
    help = json['help'];
    success = json['success'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['help'] = this.help;
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String resourceId;
  List<Fields> fields;
  List<Records> records;
  Links lLinks;
  int total;

  Result({this.resourceId, this.fields, this.records, this.lLinks, this.total});


  Result.fromJson(Map<String, dynamic> json) {
    resourceId = json['resource_id'];
    if (json['fields'] != null) {
      fields = new List<Fields>();
      json['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
    if (json['records'] != null) {
      records = new List<Records>();
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource_id'] = this.resourceId;
    if (this.fields != null) {
      data['fields'] = this.fields.map((v) => v.toJson()).toList();
    }
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    data['total'] = this.total;
    return data;
  }

  List<Records> get _records => records;

}

class Fields {
  String type;
  String id;

  Fields({this.type, this.id});

  Fields.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}

class Records {
  String shortTermParking;
  String carParkType;
  String yCoord;
  String xCoord;
  String freeParking;
  String gantryHeight;
  String carParkBasement;
  String nightParking;
  String address;
  String carParkDecks;
  int iId;
  String carParkNo;
  String typeOfParkingSystem;

  Records(
      {this.shortTermParking,
        this.carParkType,
        this.yCoord,
        this.xCoord,
        this.freeParking,
        this.gantryHeight,
        this.carParkBasement,
        this.nightParking,
        this.address,
        this.carParkDecks,
        this.iId,
        this.carParkNo,
        this.typeOfParkingSystem});

  Records.fromJson(Map<String, dynamic> json) {
    shortTermParking = json['short_term_parking'];
    carParkType = json['car_park_type'];
    yCoord = json['y_coord'];
    xCoord = json['x_coord'];
    freeParking = json['free_parking'];
    gantryHeight = json['gantry_height'];
    carParkBasement = json['car_park_basement'];
    nightParking = json['night_parking'];
    address = json['address'];
    carParkDecks = json['car_park_decks'];
    iId = json['_id'];
    carParkNo = json['car_park_no'];
    typeOfParkingSystem = json['type_of_parking_system'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short_term_parking'] = this.shortTermParking;
    data['car_park_type'] = this.carParkType;
    data['y_coord'] = this.yCoord;
    data['x_coord'] = this.xCoord;
    data['free_parking'] = this.freeParking;
    data['gantry_height'] = this.gantryHeight;
    data['car_park_basement'] = this.carParkBasement;
    data['night_parking'] = this.nightParking;
    data['address'] = this.address;
    data['car_park_decks'] = this.carParkDecks;
    data['_id'] = this.iId;
    data['car_park_no'] = this.carParkNo;
    data['type_of_parking_system'] = this.typeOfParkingSystem;
    return data;
  }


}

class Links {
  String start;
  String next;

  Links({this.start, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['next'] = this.next;
    return data;
  }
}


