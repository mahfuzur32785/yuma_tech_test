import 'dart:convert';

import 'package:equatable/equatable.dart';

class Provider extends Equatable{
  const Provider({
    required this.uuid,
    required this.businessName,
    required this.categoryId,
    required this.vatNo,
    required this.regNo,
    required this.idNo,
    required this.type,
    required this.email,
    required this.phone,
    required this.note,
    required this.webLink,
    required this.highlight,
    required this.category,
    required this.keyword,
    required this.imagePath,
    required this.backgroundImagePath,
  });
  final String uuid;
  final String businessName;
  final dynamic categoryId;
  final String vatNo;
  final String regNo;
  final String idNo;
  final String type;
  final String email;
  final String phone;
  final String note;
  final String webLink;
  final int highlight;
  final String category;
  final dynamic keyword;
  final String imagePath;
  final String backgroundImagePath;

  Provider copyWith({
    String? uuid,
    String? businessName,
    dynamic categoryId,
    String? vatNo,
    String? regNo,
    String? idNo,
    String? type,
    String? email,
    String? phone,
    String? note,
    String? webLink,
    int? highlight,
    String? category,
    dynamic keyword,
    String? imagePath,
    String? backgroundImagePath,
  }) =>
      Provider(
        uuid: uuid ?? this.uuid,
        businessName: businessName ?? this.businessName,
        categoryId: categoryId ?? this.categoryId,
        vatNo: vatNo ?? this.vatNo,
        regNo: regNo ?? this.regNo,
        idNo: idNo ?? this.idNo,
        type: type ?? this.type,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        note: note ?? this.note,
        webLink: webLink ?? this.webLink,
        highlight: highlight ?? this.highlight,
        category: category ?? this.category,
        keyword: keyword ?? this.keyword,
        imagePath: imagePath ?? this.imagePath,
        backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      );

  factory Provider.fromJson(String str) => Provider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provider.fromMap(Map<String, dynamic> json) => Provider(
    uuid: json["uuid"],
    businessName: json["business_name"],
    categoryId: json["category_id"],
    vatNo: json["vat_no"],
    regNo: json["reg_no"],
    idNo: json["id_no"],
    type: json["type"],
    email: json["email"],
    phone: json["phone"],
    note: json["note"],
    webLink: json["web_link"],
    highlight: json["highlight"],
    category: json["category"],
    keyword: json["keyword"],
    imagePath: json["image_path"],
    backgroundImagePath: json["background_image_path"],

  );

  Map<String, dynamic> toMap() => {
    "uuid": uuid,
    "business_name": businessName,
    "category_id": categoryId,
    "vat_no": vatNo,
    "reg_no": regNo,
    "id_no": idNo,
    "type": type,
    "email": email,
    "phone": phone,
    "note": note,
    "web_link": webLink,
    "highlight": highlight,
    "category": category,
    "keyword": keyword,
    "image_path": imagePath,
    "background_image_path": backgroundImagePath,
  };

  @override
  String toString() {
    return 'Category(uuid:$uuid, business_name: $businessName, category_id: $categoryId, vat_no: $vatNo, reg_no: $regNo,image_path: $imagePath,background_image_path: $backgroundImagePath, highlight: $highlight)';
  }

  @override
  List<Object?> get props {
    return [
      uuid,
      businessName,
      categoryId,
      vatNo,
      highlight,
      imagePath,
      backgroundImagePath
    ];
  }
}