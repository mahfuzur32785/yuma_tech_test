import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:yuma_tech_test/model/consumer_model.dart';
import 'package:yuma_tech_test/model/provider_model.dart';

class DataModel extends Equatable {
  final int id;
  final String uuid;
  final String providerUuid;
  final String consumerUuid;
  final String accountNumber;
  final int percentage;
  final int authId;
  final Consumer? consumer;
  final Provider? provider;

  DataModel({
    required this.id,
    required this.uuid,
    required this.providerUuid,
    required this.consumerUuid,
    required this.accountNumber,
    required this.percentage,
    required this.authId,
    this.consumer,
    this.provider,
  });

  DataModel copyWith({
    int? id,
    String? uuid,
    String? providerUuid,
    String? consumerUuid,
    String? accountNumber,
    int? percentage,
    int? authId,
    Consumer? consumer,
    Provider? provider,
  }) =>
      DataModel(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        providerUuid: providerUuid ?? this.providerUuid,
        consumerUuid: consumerUuid ?? this.consumerUuid,
        accountNumber: accountNumber ?? this.accountNumber,
        percentage: percentage ?? this.percentage,
        authId: authId ?? this.authId,
        consumer: consumer ?? this.consumer,
        provider: provider ?? this.provider,
      );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
    id: json["id"]??0,
    uuid: json["uuid"]??'',
    providerUuid: json["provider_uuid"]??'',
    consumerUuid: json["consumer_uuid"]??'',
    accountNumber: json["account_number"]??'',
    percentage: json["percentage"]??0,
    authId: json["auth_id"]??0,
    consumer: json["consumer"] == null ? null : Consumer.fromMap(json["consumer"]),
    provider: json["provider"] == null ? null : Provider.fromMap(json["provider"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "uuid": uuid,
    "provider_uuid": providerUuid,
    "consumer_uuid": consumerUuid,
    "account_number": accountNumber,
    "percentage": percentage,
    "auth_id": authId,
    "consumer": consumer?.toMap(),
    "provider": provider?.toMap(),
  };

  @override
  String toString() {
    return 'DataModel(id: $id, uuid: $uuid, provider_uuid: $providerUuid, consumer_uuid: $consumerUuid, account_number: $accountNumber, percentage: $percentage, auth_id: $authId, consumer: $consumer, provider: $provider)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      uuid,
      providerUuid,
      consumerUuid,
      accountNumber,
      percentage,
      authId,
      consumer,
      provider
    ];
  }
}