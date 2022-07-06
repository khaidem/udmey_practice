import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? dateTime;
  String? _userId;

  Future<void> signup(String email, String password) async {
    var url = Uri.parse(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyC_t4xRbraqRiaQJjsDk53ItoNT3_4f2B8');
    final reponse = await http.post(
      url,
      body: json.encode(
        {
          email: email,
          password: password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(reponse.body));
  }
}
