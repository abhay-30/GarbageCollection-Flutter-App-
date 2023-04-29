import 'package:ecotags/const/color.dart';
import 'package:ecotags/providers/user/UserDetailsProvider.dart';
import 'package:ecotags/screens/home.dart';
import 'package:ecotags/screens/login.dart';
import 'package:ecotags/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

// class WelcomeScreen extends StatelessWidget {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   void _showLoginSheet(BuildContext context) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(40.0),
//       ),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: MediaQuery.of(context).viewInsets,
//           child: const LoginBottomScreen(),
//         );
//       },
//     );
//   }

//   static String tag = 'welcome-page';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: backgroundColor,
//         body: Column(children: <Widget>[
//           // add empty space
//           mainAxisAlignment: MainAxisAlignment.center,
//           const SizedBox(height: 200),
//           Container(
//               width: 375,
//               height: 152,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/logo.png'), fit: BoxFit.fitWidth),
//               )),
//           // add empty space

//           const SizedBox(height: 80),
//           Text(
//             "Welcome!",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 36.0, color: primaryTextColor),
//           ),

//           // const SizedBox(height: 100),
//           // Text(
//           //   "",
//           //   textAlign: TextAlign.center,
//           //   style: TextStyle(fontSize: 21.0, color: secondaryTextColor),
//           // ),
//           const SizedBox(height: 100),
//           Container(
//               width: 300,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(SignUpScreen.tag);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Create Account',
//                   style: TextStyle(fontSize: 20, color: appColor),
//                 ),
//               )),
//           const SizedBox(height: 20),

//           SizedBox(
//               width: 300,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Navigator.of(context).pushNamed(LoginScreen.tag);
//                   _showLoginSheet(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: backgroundColor,
//                   // border

//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     side: BorderSide(color: primaryColor),
//                   ),
//                 ),
//                 child: Text(
//                   'Login',
//                   style: TextStyle(fontSize: 20, color: primaryColor),
//                 ),
//               )),

//           const SizedBox(height: 50),
//           Text(
//             'IIT Ropar Team G16',
//             textAlign: TextAlign.left,
//             style: TextStyle(
//                 color: primaryColor,
//                 fontSize: 11,
//                 letterSpacing: 0,
//                 fontWeight: FontWeight.normal,
//                 height: 1),
//           ),
//         ]));
//   }
// }

class WelcomeScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _showLoginSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: const LoginBottomScreen(),
        );
      },
    );
  }

  static String tag = 'welcome-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 200),
            Container(
              width: 375,
              height: 152,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 80),
            Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36.0, color: primaryTextColor),
            ),
            const SizedBox(height: 100),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpScreen.tag);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20, color: appColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(LoginScreen.tag);
                  _showLoginSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  // border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: primaryColor),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'IIT Ropar Team G16',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: primaryColor,
                fontSize: 11,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
