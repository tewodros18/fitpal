import 'package:google_sign_in/google_sign_in.dart';

class Authentication{
  static Future<Map<String, dynamic>> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    Map<String, dynamic> userdata = <String, dynamic>{};

    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      userdata = {
        "token": googleSignInAuthentication.idToken,
        "email": googleSignInAccount.email
      };
    }
    return userdata;
  }

  static Future<void> signOutFromGoogle() async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
  }
}