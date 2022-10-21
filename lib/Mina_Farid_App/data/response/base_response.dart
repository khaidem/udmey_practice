import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  //** this key is form api response */
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "nameOfNotification")
  int? nameOfNotification;
  CustomerResponse(this.id, this.name, this.nameOfNotification);

  /// A necessary factory constructor for creating a new CustomerResponse instance
  /// from a map. Pass the map to the generated `_$CustomerResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CustomerResponse.
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CustomerResponseToJson`.
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  ContactsResponse(this.email, this.link, this.phone);

  /// A necessary factory constructor for creating a new ContactsResponse instance
  /// from a map. Pass the map to the generated `_$ContactsResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ContactsResponse.
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ContactsResponseToJson`.
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(
    this.contacts,
    this.customer,
  );

  /// A necessary factory constructor for creating a new AuthenticationResponse instance
  /// from a map. Pass the map to the generated `_$AuthenticationResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, AuthenticationResponse.
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AuthenticationResponseToJson`.
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
