import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:food_app/screens/home%20/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

Future<User?> _googleSignUp() async {
  try {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // The user canceled the sign-in
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user = (await _auth.signInWithCredential(credential)).user;
    //print("signed in " + user.displayName);
    // userProvider.addUserData(
    //   currentUser: user,
    //   userEmail: user.email,
    //   userImage: user.photoURL,
    //   userName: user.displayName,
    // );

   return user;
  } catch (e) {
    print(e.toString());
  }
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/background.png')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Sign in to contunue'),
                  Text(
                    'Vegi',
                    style: TextStyle(
                        fontSize: 50.sp,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.green.shade900,
                            offset: Offset(3, 3),
                          )
                        ]),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign in with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign in with Google",
                        onPressed: ()
                            //async
                            {
                          // await 
                          _googleSignUp().then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        'Terms and Pricacy Policy',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
