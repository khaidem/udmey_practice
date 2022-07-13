import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practice_app/ShoppingApp/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  //* User is check Auth or not
  //** if token is expire user not login */
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

  String get userId {
    return _userId!;
  }

  Future<void> logOut() async {
    _expiryDate = null;
    _token = null;
    _userId != null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
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
      //** When there is no error in the response data, so if we are not throwing exception here then
      //** of course I want to log my userId and I want to set my token and store the token here in memory and so on */ */
      //** so we set token equal to responseData and the ID token because remember form firebase doc
      //** we are extracting Id token form the response we are getting here */ */
      _token = responseData['idToken'];
      //** Form Firebase doc we are extracting UserId  */
      _userId = responseData['localId'];
      //** Form Firebase doc for expiresIn when we expire time */
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
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

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedData = json.decode(prefs.getString('userData') as String)
        as Map<String, Object>;
    final expiredDate = DateTime.parse(extractedData['expiryDate'] as String);

    if (expiredDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedData['token'] as String;
    _userId = extractedData['userId'] as String;
    _expiryDate = expiredDate;
    notifyListeners();
    return true;
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
