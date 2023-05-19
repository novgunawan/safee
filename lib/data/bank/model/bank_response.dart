import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bank_response.g.dart';

@JsonSerializable()
class BankResponse extends Equatable {
  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'name')
  final String name;

  const BankResponse({required this.code, required this.name});
  @override
  List<Object?> get props => [code, name];

  factory BankResponse.fromJson(Map<String, dynamic> json) =>
      _$BankResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankResponseToJson(this);
}
