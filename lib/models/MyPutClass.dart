import 'dart:convert';
import 'dart:core';

MyPutClass myPutClassFromJson(String str) =>
    MyPutClass.fromJson(json.decode(str));

String myPutClassToJson(MyPutClass data) => json.encode(data.toJson());

class MyPutClass {
  MyPutClass({
    this.success,
    this.message,
    this.object,
    this.totalElements,
  });

  MyPutClass.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['object'] != null) {
      object = [];
      json['object'].forEach((v) {
        object?.add(Object.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
  }

  bool? success;
  String? message;
  List<Object>? object;
  int? totalElements;

  MyPutClass copyWith({
    bool? success,
    String? message,
    List<Object>? object,
    int? totalElements,
  }) =>
      MyPutClass(
        success: success ?? this.success,
        message: message ?? this.message,
        object: object ?? this.object,
        totalElements: totalElements ?? this.totalElements,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (object != null) {
      map['object'] = object?.map((v) => v.toJson()).toList();
    }
    map['totalElements'] = totalElements;
    return map;
  }
}

Object objectFromJson(String str) => Object.fromJson(json.decode(str));

String objectToJson(Object data) => json.encode(data.toJson());

class Object {
  Object({
    this.id,
    this.roomNumber,
    this.bron,
    this.maxPerson,
    this.minPerson,
    this.chayxanaId,
    this.chayxanaDto,
    this.price,
    this.roomDetailDTOS,
  });

  Object.fromJson(dynamic json) {
    id = json['id'];
    roomNumber = json['roomNumber'];
    bron = json['bron'];
    maxPerson = json['maxPerson'];
    minPerson = json['minPerson'];
    chayxanaId = json['chayxana_id'];
    chayxanaDto = json['chayxanaDto'];
    price = json['price'];
    if (json['roomDetailDTOS'] != null) {
      roomDetailDTOS = [];
      json['roomDetailDTOS'].forEach((v) {
        roomDetailDTOS?.add(RoomDetailDtos.fromJson(v));
      });
    }
  }

  String? id;
  int? roomNumber;
  bool? bron;
  int? maxPerson;
  int? minPerson;
  String? chayxanaId;
  dynamic chayxanaDto;
  double? price;
  List<RoomDetailDtos>? roomDetailDTOS;

  Object copyWith({
    String? id,
    int? roomNumber,
    bool? bron,
    int? maxPerson,
    int? minPerson,
    String? chayxanaId,
    dynamic chayxanaDto,
    double? price,
    List<RoomDetailDtos>? roomDetailDTOS,
  }) =>
      Object(
        id: id ?? this.id,
        roomNumber: roomNumber ?? this.roomNumber,
        bron: bron ?? this.bron,
        maxPerson: maxPerson ?? this.maxPerson,
        minPerson: minPerson ?? this.minPerson,
        chayxanaId: chayxanaId ?? this.chayxanaId,
        chayxanaDto: chayxanaDto ?? this.chayxanaDto,
        price: price ?? this.price,
        roomDetailDTOS: roomDetailDTOS ?? this.roomDetailDTOS,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roomNumber'] = roomNumber;
    map['bron'] = bron;
    map['maxPerson'] = maxPerson;
    map['minPerson'] = minPerson;
    map['chayxana_id'] = chayxanaId;
    map['chayxanaDto'] = chayxanaDto;
    map['price'] = price;
    if (roomDetailDTOS != null) {
      map['roomDetailDTOS'] = roomDetailDTOS?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

RoomDetailDtos roomDetailDtosFromJson(String str) =>
    RoomDetailDtos.fromJson(json.decode(str));

String roomDetailDtosToJson(RoomDetailDtos data) => json.encode(data.toJson());

class RoomDetailDtos {
  RoomDetailDtos({
    this.id,
    this.name,
    this.iconId,
    this.active,
  });

  RoomDetailDtos.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    iconId = json['iconId'];
    active = json['active'];
  }

  int? id;
  String? name;
  String? iconId;
  bool? active;

  RoomDetailDtos copyWith({
    int? id,
    String? name,
    String? iconId,
    bool? active,
  }) =>
      RoomDetailDtos(
        id: id ?? this.id,
        name: name ?? this.name,
        iconId: iconId ?? this.iconId,
        active: active ?? this.active,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['iconId'] = iconId;
    map['active'] = active;
    return map;
  }
}
