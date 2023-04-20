import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pose_detection/challenge.dart';

class ChallengeProvider {
  final http.Client httpClient;

  ChallengeProvider({required this.httpClient});

  Future<List<Challenge>> getChallenges() async {
    try {
      final response = await httpClient.post(Uri.parse(""));

      if (response.statusCode >= 400) {
        throw Exception("Sign In Failed.");
      }
      // return jsonDecode(response.body);
    } catch (e) {
      throw Exception("");
    }

    return <Challenge>[
      Challenge(
          name: "New Challenge", exerciseId: "JUMPING-JACK", repetition: 10)
    ];
  }
}
