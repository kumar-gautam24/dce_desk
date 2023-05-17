import 'package:dce_desk/ui/screens/landing_page.dart';
import 'package:dce_desk/ui/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsheets/gsheets.dart';
import 'firebase_options.dart';

// gsheet credentials
const _credentials= r'''
{
  "type": "service_account",
  "project_id": "triple-acre-387013",
  "private_key_id": "f43383be7a5f070f26a63a4748dfc1de57e0fa85",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC4HutVbfPG+Kg2\nnG8ALQyFCAU/s7EX7wl4uqSgq7dOGXU6Koz1+BxC3/sHWoZLs6w2Z1UP0IYbz0cD\nLn1gyAYMVdTsZmtw9ZuGechvVpRQSVj9UdQ5BEAHKSBt550bYJPtFwlR9lDp2yLk\nzR4Yxe3Ld5rkj5yfRnmEi51c8JUYk/gCIf/p5q9Z0okkZPQUa0CrTQcy0hn0vXAH\njlaSH/g4PmLfPn1WuhcDRhj3CPsMtGR/xNuvh7+H1sRCOeJH6E82DAj9qwVK2N6a\nNgFuAPIu/JVP/IUVa8aRNKI8MkT6INd13HPwkr8p/yrTFD8fvezBvsf1/AhXQ0y0\nipJ01GnnAgMBAAECggEAUP3E3nj15Z4G/LLWfxjR64jqKinkqlcLbxCHD2hJw3Ce\naP5DsIU6BU7acVMoRQ+dnvbYa5L6EyycG7GtFFAYnP96oJyzAWcAyWgzu4o1xpVl\nMFV5CbWtZpj4O3BJYzwaBg5+mo/D6wLquAPki9gxMLIFsCneJxAMrzns+G+Z3kuj\n6wWzHhdGd5dnr3F03GBl3RGhSzNJD/3iTSTe8nhy/Gu8CMDYJdx+URThVK6LJ/GP\nzsyMX9FQZSTH19cb+zKsa/WqGc3SmVF6QOvbp5O+OJEOgcfMJbK9TqOJkXaCwJCH\nUOglTynd2n3fkLanXg3p0+M+HsFqVdFahnW3/A/AoQKBgQD4fDpzzXXDZ+ciL5V+\nXNweZFfynGM3ERPUEFCO4pqVKEsVajq9m5Q0FGdrT5DFawP8M+91Hv/qkqmOVdFg\nMvcETjmp1aK+QTi+xBHizMhRvD50EVVUsUA9oFYKelUtIvyDIiUMaLD8io6Oc5Y/\nmKyp84dPA1mPhYhTEYxpu9tl4QKBgQC9sGGjefwrhfTW2fJjEyIDWRu7dsik3kOP\nmrxcUVbwomz7iKiT7HZeovzU3RxmSkxPBS9OQakJgGyFfPRagmSSsOyZOmNf95yM\nqt8uyIMZ/MbnGo2CJ6TwbkDjpYkRVKMv6QkhaSe40ys9LXSO0cug8fwwVvPtpfMl\nyktBsN84xwKBgQCbsQLS4i5iVCzvL49kkHxfEpJEchZ8P1gELIC9NmCTCp8Y+Ol7\nOgr/IrW1+DGGcMobcNMduGGzMVfJ1h2NQAGkEftxXWlN+gG7DZEDYTo2dFNRWDb2\nDOVqd5bRk9rgoCZFZ9R81O/oHEy8FtJSYK/3AJ6MNFYeZhWHrtwit9D9IQKBgFP0\nUuKVxORGf5zwDXWILE+rCrkn05oUvXY7mA6L+Zy7ZtzVGTePOrycCqbzzfQAAlIf\nC1bpfLU139IdAdFlULoUEEOpMf5xixo/LlR4bn38ANScTfFDNp8rTRD0XPwMp8U2\nsNHWxrvoyoRjL+leNW/gaivC8GdIQZuCM1i5vbJVAoGBAOESV3PRvNBAmstj9S/7\nKh7iPmRXGcAxwG9YXPgRFtcdrYLbXRxxsrSRYefhwn7W3V7NRkF5YHSFOK7c4nno\n3GObWLfzNIzDbgKHagA2jnu2D9KMr3E0elAWZf76uFgzLHxMxmUb+42t33u/PWY5\ni7lWfU/j1UdQbb2V2GW9Nn2Y\n-----END PRIVATE KEY-----\n",
  "client_email": "dce-desk-24-feb@triple-acre-387013.iam.gserviceaccount.com",
  "client_id": "104813851805926002232",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/dce-desk-24-feb%40triple-acre-387013.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
// sheet id
const _spreadsheetId='1xvez9ziaxHZZyuSa0eYwauCf3UtShFN5g7bzlsgCfPI';

void main() async {
  // init firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// init gsheet
  final gsheets = GSheets(_credentials);
  // fetch spredshet by id
  final mySheet= await gsheets.spreadsheet(_spreadsheetId);
  //get worksheets
  var sheet= mySheet.worksheetByTitle('Sheet1');
  //testing
//  await sheet!.values.insertValue('trial', column: 1, row: 1); // sheet connected working fine
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const SignInGoogle();
            } else {
              return const LandingPage();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.grey, // Set grey color for app background
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.black),
            textStyle: MaterialStateProperty.all(const TextStyle(
                color: Colors.black
            ),
            ), // Set black color for button text
// Set white color for button background
          ),
        ),
      ),
    );
  }
}
