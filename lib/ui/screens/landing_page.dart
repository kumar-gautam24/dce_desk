import 'package:dce_desk/ui/screens/manage_class.dart';
import 'package:dce_desk/ui/screens/take_attendance.dart';
import 'package:dce_desk/ui/screens/view_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

User? user;
String? photoUrl;
String? displayName;
String? email;

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() async {
    final User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      setState(() {
        user = currentUser;
        photoUrl = user?.photoURL;
        displayName = user?.displayName;
        email = user?.email;
      });
    }
  }

  _signOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    setState(() {
      user = null;
      photoUrl = null;
      displayName = null;
      email = null;
    });
  }

  Widget buildCustomButton({
    required String text,
   required BuildContext context,
    required Widget nextPage,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      child: Text(
        text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 2,
        title: const Text('HomePage'),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage(photoUrl ??
                'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: _signOut, icon: const Icon(Icons.power_settings_new)),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 181,
              width: 341,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFD9D9D9),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${displayName ?? 'UserName'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Mail: ${email ?? 'abc@email.com'}',
                      style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            buildCustomButton(
              text: 'TAKE ATTENDANCE',
             context: context,
              nextPage: TakeAttendance(),
            ),

            // manage class button
            const SizedBox(height: 50),
            buildCustomButton(
              text: 'MANAGE CLASS',
              context: context,
              nextPage: ManageClass(),
            ),
            //View Register Button
            const SizedBox(height: 50),
            buildCustomButton(
              text: 'VIEW REGISTER',
              context: context,
              nextPage: ViewRegister(),
            ),

            const SizedBox(height: 10),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
