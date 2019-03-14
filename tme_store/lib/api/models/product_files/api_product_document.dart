import 'package:json_annotation/json_annotation.dart';

part 'api_product_document.g.dart';

@JsonSerializable()
class ApiProductDocument {
  @JsonKey(name: 'DocumentUrl')
  final String url;

  @JsonKey(name: 'DocumentType')
  final DocumentType type;

  @JsonKey(name: 'Filesize')
  final String fileSizeBytes;

   @JsonKey(name: 'Language')
  final String language;

  ApiProductDocument({
    this.url,
    this.type,
    this.fileSizeBytes,
    this.language
  });

  static ApiProductDocument fromJson(Map<String, dynamic> json) =>
     _$ApiProductDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductDocumentToJson(this);
}

enum DocumentType {
    INS,
    DTE,
    KCH,
    GWA,
    INB,
    MOV,
    YTB,
    PRE,
    SFT
}