import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



signInWithGoogle() async {
  // Google Sign In
  // begin interactive sign in process
  GoogleSignInAccount? googleuser= await GoogleSignIn().signIn();

  // obtain auth details from requests
  GoogleSignInAuthentication? googleAuth=await googleuser?.authentication;

  // create new credential for user
  AuthCredential credential= GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken ,
    idToken: googleAuth?.idToken,
  );

  // final sing in
  UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user?.displayName);
  // photoUrl= userCredential.user?.photoURL;

  // store image to firebase.
  // void _savePhotoUrl(String uid, String photoUrl) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .set({'photoUrl': photoUrl});
  // }
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // User? user ;
  // String? photoUrl ;
  // String? displayName ;
  // String? email ;
  // _getCurrentUser() async {
  //   final User? currentUser = _auth.currentUser;
  //
  //   if (currentUser != null) {
  //     setState(() {
  //       user = currentUser;
  //       photoUrl = user?.photoURL;
  //       displayName = user?.displayName;
  //       email = user?.email;
  //     });
  //   }
  // }

}