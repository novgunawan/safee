import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'firebase_user_response.g.dart';

@JsonSerializable()
class FirebaseUserResponse extends Equatable {
  @JsonKey(name: 'displayName')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'photoURL')
  final String picture;

  const FirebaseUserResponse(this.name, this.email, this.picture);
  @override
  List<Object?> get props => throw UnimplementedError();

  factory FirebaseUserResponse.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FirebaseUserResponseToJson(this);
}
