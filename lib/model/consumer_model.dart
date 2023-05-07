import 'dart:convert';

import 'package:equatable/equatable.dart';

class Consumer extends Equatable{
  const Consumer({
    required this.uuid,
    required this.businessName,
    required this.vatNo,
    required this.regNo,
    required this.idNo,
    required this.type,
    required this.email,
    required this.phone,
    required this.note,
  });
  final String uuid;
  final String businessName;
  final String vatNo;
  final String regNo;
  final String idNo;
  final String type;
  final String email;
  final String phone;
  final String note;

  Consumer copyWith({
    String? uuid,
    String? businessName,
    String? vatNo,
    String? regNo,
    String? idNo,
    String? type,
    String? email,
    String? phone,
    String? note,
  }) =>
      Consumer(
        uuid: uuid ?? this.uuid,
        businessName: businessName ?? this.businessName,
        vatNo: vatNo ?? this.vatNo,
        regNo: regNo ?? this.regNo,
        idNo: idNo ?? this.idNo,
        type: type ?? this.type,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        note: note ?? this.note,
      );

  factory Consumer.fromJson(String str) => Consumer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Consumer.fromMap(Map<String, dynamic> json) => Consumer(
    uuid: json["uuid"]??'',
    businessName: json["business_name"]??'',
    vatNo: json["vat_no"]??'',
    regNo: json["reg_no"]??'',
    idNo: json["id_no"]??'',
    type: json["type"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
    note: json["note"]??'',
  );

  Map<String, dynamic> toMap() => {
    "uuid": uuid,
    "business_name": businessName,
    "vat_no": vatNo,
    "reg_no": regNo,
    "id_no": idNo,
    "type": type,
    "email": email,
    "phone": phone,
    "note": note,
  };

  @override
  String toString() {
    return 'Consumer(uuid: $uuid, business_name: $businessName, vat_no: $vatNo, reg_no: $regNo, id_no: $idNo, type: $type, email: $email,phone: $phone, note:$note)';
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      businessName,
      vatNo,
      regNo,
      idNo,
      type,
      email,
      phone,
      note
    ];
  }
}