import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInDataProvider {
  final http.Client httpClient;

  SignInDataProvider({required this.httpClient});

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      final response = await httpClient.post(
        Uri.parse("uri"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, dynamic>{"email": email, "password": password}),
      );

      if (response.statusCode >= 400) {
        throw Exception("Sign In Failed.");
      }
      return response.body;
    } catch (e) {
      throw Exception("Connection Error");
    }
  }

  Future<String> signInWithGoogle({required String token}) async {
    try {
      final response = await httpClient.post(Uri.parse("uri"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({"token": token}));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Google failure');
      }
    } catch (e) {
      return "";
    }
  }
}
