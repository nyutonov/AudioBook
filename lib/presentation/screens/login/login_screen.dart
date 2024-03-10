import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utills/constants/utils.dart';
import '../../components/background.dart';
import '../../components/button_auth.dart';
import '../../components/go_back.dart';
import '../../components/text_field_auth.dart';
import 'login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(child: AudioBookLoginScreen());
  }
}

class AudioBookLoginScreen extends StatelessWidget {
  const AudioBookLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == Status.SUCCESS) {
          Navigator.pushReplacementNamed(context, 'BOTTOM_NAVIGATION');
        } else if (state.status == Status.ERROR) {
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar('Error'));
        }
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(flex: 1),
                const GoBack(),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 108,
                      height: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/book.png')
                          )
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 24,
                        fontFamily: 'Uni Neue',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In to continue',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 20,
                        fontFamily: 'Uni Neue',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 41),
                  child: TextFieldAuth(hintText: 'Email Address'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 41),
                  child: TextFieldAuth(hintText: 'Password'),
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {  },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Ink(
                          child: Text(
                            'Forget Password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: redColor,
                              fontSize: 14,
                              fontFamily: 'Uni Neue',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                ButtonAuth(
                    text: 'SIGN IN',
                    fontSize: 16,
                    isShowNext: false,
                    callback: (value) => Navigator.pushReplacementNamed(context, 'BOTTOM_NAVIGATION')
                ),
                const Spacer(flex: 1),
                Text(
                  'or sign in using',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 14,
                    fontFamily: 'Uni Neue',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        onTap: () => BlocProvider.of<LoginBloc>(context).add(SignInGoogle()),
                        child: Ink(
                          padding: const EdgeInsets.all(10),
                          width: 52,
                          height: 52,
                          child: const Image(
                              image: AssetImage('assets/icons/google.png'),
                          ),
                        )
                    ),
                    InkWell(
                        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        onTap: () {  },
                        child: Ink(
                          padding: const EdgeInsets.all(10),
                          width: 52,
                          height: 52,
                          child: const Image(
                            image: AssetImage('assets/icons/facebook.png'),
                          ),
                        )
                    ),
                  ],
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 14,
                        fontFamily: 'Uni Neue',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    InkWell(
                      onTap: () { Navigator.pushNamed(context, 'REGISTER'); },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Ink(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: redColor,
                              fontSize: 14,
                              fontFamily: 'Uni Neue',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}