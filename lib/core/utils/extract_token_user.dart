import 'dart:convert';

import 'package:bloc_auth/domain/contracts/local_datasource_contract/local_datasource_contract.dart';
import 'package:bloc_auth/domain/entity/user_entity.dart';
import 'package:bloc_auth/injection.dart';

Future<UserEntity> extractTokenUser() async {
  final token =
      await getItInstance<LocalDataSourceContract>().get(key: 'token');

  if (token == null) {
    throw const FormatException('Token not found.');
  }
  final parts = token.split('.');
  if (parts.length != 3) {
    throw const FormatException('Invalid token format.');
  }

  final payload = parts[1];
  final normalizedPayload = base64Url.normalize(payload);
  final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));
  final payloadMap = json.decode(decodedPayload) as Map<String, dynamic>;
  return UserEntity.fromJson(payloadMap);
}
