import 'package:practice_app/Mina_Farid_App/app/extension.dart';
import 'package:practice_app/Mina_Farid_App/data/response/base_response.dart';

import '../../domain/model.dart';

const Empty = "";
const Zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? Empty,
        this?.name?.orEmpty() ?? Empty,
        this?.nameOfNotification?.orZero() ?? Zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.email?.orEmpty() ?? Empty,
        (this?.link?.orEmpty() ?? Empty) as int,
        this?.link?.orEmpty() ?? Empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.customer?.toDomain(), this?.contacts?.toDomain());
  }
}
