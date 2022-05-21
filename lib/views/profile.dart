import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:testfb/views/home.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Profile extends StatelessWidget {
  String? userPic;
  String? name;
  String? email;
  String? type;

  Profile(
      {Key? key, required this.name,
      required this.email,
      required this.userPic,
      required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: const Color.fromARGB(170, 255, 15, 103),
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        spacing: 5,
        spaceBetweenChildren: 5,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.logout_outlined),
              label: 'Logout',
              onTap: () {
                if (type == 'facebook') FacebookAuth.i.logOut();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                    (route) => false);
              }),
          SpeedDialChild(child: const Icon(Icons.info_outline), label: 'About App'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 55),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(
                            color:  Color.fromARGB(255, 234, 173, 244),
                            width: 3))),
                    child: Image(
                      image: type == 'google'
                          ? const AssetImage('Assets/images/google.png')
                          : const AssetImage('Assets/images/facebook.jpg'),
                      fit: BoxFit.contain,
                      height: 230,
                      width: double.infinity,
                    ),
                  ),
                  const Positioned(
                    top: 176,
                    child: CircleAvatar(
                      radius: 54,
                      backgroundColor: Color.fromARGB(255, 234, 173, 244),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(userPic!),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              name!,
              style: const TextStyle(fontSize: 19),
            ),
            Text(email!, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
