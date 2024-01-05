import 'dart:convert';
import 'dart:developer';

import 'package:bloc_auth/domain/contracts/local_datasource_contract/local_datasource_contract.dart';
import 'package:bloc_auth/injection.dart';

DateTime? extractExpiryFromToken(String token) {
  try {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid token format.');
    }

    final payload = parts[1];
    final normalizedPayload = base64Url.normalize(payload);
    final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));
    final payloadMap = json.decode(decodedPayload) as Map<String, dynamic>;

    if (payloadMap.containsKey('exp') && payloadMap['exp'] is int) {
      final expiry = DateTime.fromMillisecondsSinceEpoch(
        (payloadMap['exp'] as int) * 1000,
      );
      return expiry;
    } else {
      throw const FormatException(
        '"exp" is missing or not an integer in the token payload.',
      );
    }
  } catch (e) {
    log('Error extracting expiry from token: $e');
    return null; // return null in case of any exceptions
  }
}

Future<bool> isTokenExpired({String? tokenValue}) async {
  final token = tokenValue ??
      await getItInstance<LocalDataSourceContract>().get(key: 'token');
  if (token != null) {
    final tokenExp = extractExpiryFromToken(token);
    if (tokenExp != null && DateTime.now().isAfter(tokenExp)) {
      return true;
    }
  }
  return false;
}
