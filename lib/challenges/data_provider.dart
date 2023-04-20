import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pose_detection/challenge.dart';

class ChallengeProvider {
  // final http.Client httpClient;

  // ChallengeProvider({required this.httpClient});

  static List<Challenge> getChallenges() {
    // try {
    //   final response = await httpClient.post(Uri.parse(""));
    //
    //   if (response.statusCode >= 400) {
    //     throw Exception("Sign In Failed.");
    //   }
    //   // return jsonDecode(response.body);
    // } catch (e) {
    //   throw Exception("");
    // }

    return <Challenge>[
      Challenge(name: "Jump Surge", exerciseId: "JUMPING-JACK", repetition: 10),
      Challenge(name: "Jump Surge", exerciseId: "JUMPING-JACK", repetition: 10),
      Challenge(name: "Jump Surge", exerciseId: "JUMPING-JACK", repetition: 10)
    ];
  }
}
