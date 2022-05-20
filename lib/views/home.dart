import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:testfb/provider/google_signin_provider.dart';
import 'package:testfb/views/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? _userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Column(
          children: [
            Lottie.asset('Assets/images/73937-social.json'),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 15, 103),
                    onPrimary: Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(double.infinity, 50)),
                label: const Text('Log In With Google'),
                icon: FaIcon(FontAwesomeIcons.google),
                onPressed: () async {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  await provider.googleLogin();
                  final user = FirebaseAuth.instance.currentUser;
                  print(user);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Profile(
                  //               userPic: user!.photoURL,
                  //               email: user.email,
                  //               name: user.displayName,
                  //               type: 'google',
                  //             )));
                }),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(235, 97, 48, 255),
                    onPrimary: Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(double.infinity, 50)),
                label: const Text('Log In  With Facebook'),
                icon: FaIcon(FontAwesomeIcons.facebook),
                onPressed: facebookLogin),
          ],
        ),
      ),
    );
  }

  facebookLogin() async {
    final result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData();

      setState(() {
        _userData = userData;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(
                    userPic: _userData!["picture"]["data"]["url"],
                    email: _userData!["email"],
                    name: _userData!["name"],
                    type: 'facebook',
                  )));
    }
  }
}
