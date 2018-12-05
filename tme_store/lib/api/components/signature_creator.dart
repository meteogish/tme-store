import 'dart:collection';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';

class SignatureCreator {
  SignatureCreator(String secret, this.token) {
    // HMAC-SHA256
    var keyBytes = ascii.encode(secret);
    _hmacSha1Encryptor = new Hmac(sha1, keyBytes);
  }

  Hmac _hmacSha1Encryptor;
  String token;

  String createApiSignature(String urlEndpoint, Map<String, String> values) {
    String signatureBase = _createSignatureBase(urlEndpoint, values);
    //print(signatureBase);

    var encodedSignature =
        _hmacSha1Encryptor.convert(ascii.encode(signatureBase));
    var signature = base64Encode(encodedSignature.bytes);
    return signature;
  }

  String _createSignatureBase(String urlEndpoint, Map<String, String> values) {
    String requestPrefix = _prefixRequestUri(urlEndpoint);

    LinkedHashMap<String, String> sortedValues = _sortRequestValues(values);

    String requestSuffix = sortedValues.entries
        .map((mapEntry) =>
            "${Uri.encodeComponent(mapEntry.key)}=${Uri.encodeComponent(mapEntry.value)}")
        .join("&");

    return requestPrefix + Uri.encodeComponent(requestSuffix);
  }

  String _prefixRequestUri(String endpoint) =>
      "POST&${Uri.encodeComponent(endpoint)}&";

  LinkedHashMap<String, String> _sortRequestValues(Map<String, String> values) {
    List<String> sortedKeys = values.keys.toList();

    sortedKeys.sort(compareNatural);

    return LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => values[k]);
  }
}
