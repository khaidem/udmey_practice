import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practice_app/ShoppingApp/models/http_exception.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  //* User is check Auth or not
  bool get isAuth {
    return token != null;
  }

  //** USER IS CHECK AUTH OR NOT */
  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    //** first we using const but we change final because we have dyanamic UrlSegment here
    //** so it is run time constant not a compline time const hence we should use  final instead of const */ */

    final url = Uri.parse(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyC_t4xRbraqRiaQJjsDk53ItoNT3_4f2B8');
//** using try catch for error handle */
    try {
      final reponse = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      print(json.decode(reponse.body));
      final responseData = json.decode(reponse.body);
      //** Check in key ['error] */
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> sigup(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'verifyPassword');
  }

  // Future<void> signup(String email, String password) async {
  //   var url = Uri.parse(
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC_t4xRbraqRiaQJjsDk53ItoNT3_4f2B8');
  //   final reponse = await http.post(
  //     url,
  //     body: json.encode(
  //       {
  //         'email': email,
  //         'password': password,
  //         'returnSecureToken': true,
  //       },
  //     ),
  //   );
  //   print(json.decode(reponse.body));
  // }

  // final FirebaseAuth auth = FirebaseAuth.instance;

  // Future<void> createAccount(String email, String password) {
  //   return auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  // }
}
