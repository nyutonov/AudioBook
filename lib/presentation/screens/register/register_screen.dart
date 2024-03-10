import 'package:audio_book/presentation/screens/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utills/constants/utils.dart';
import '../../components/background.dart';
import '../../components/button_auth.dart';
import '../../components/go_back.dart';
import '../../components/text_field_auth.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(child: AudioBookRegisterScreen());
  }
}

class AudioBookRegisterScreen extends StatelessWidget {
  const AudioBookRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
                    'Create an Account',
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
                    'Register to continue',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 41),
                child: TextFieldAuth(hintText: 'Retype password'),
              ),
              const Spacer(flex: 2),
              ButtonAuth(
                  text: 'REGISTER',
                  fontSize: 16,
                  isShowNext: false,
                  callback: (value) {}
              ),
              const Spacer(flex: 1),
              Text(
                'or register using',
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
                      onTap: () => BlocProvider.of<RegisterBloc>(context).add(SignInGoogle()),
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
                    'Already have an account? ',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Uni Neue',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () { Navigator.pop(context); },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Ink(
                        child: Text(
                          'Sign In',
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
    );
  }
}
