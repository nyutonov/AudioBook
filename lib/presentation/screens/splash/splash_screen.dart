import 'package:flutter/material.dart';

import '../../../data/source/remote/firebase/shared_preference_service.dart';
import '../../../utills/constants/utils.dart';
import '../../components/background.dart';
import '../../components/button_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SharedPreferenceService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SafeArea(
          child: Center(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/shobdo_kutir_logo.png',
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                              'assets/lottie/book.gif',
                              fit: BoxFit.cover
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: ButtonAuth(
                                  text: 'Get Started',
                                  fontSize: 20,
                                  isShowNext: true,
                                  callback: (value) {
                                    if (CurrentUser.isLogin) {
                                      Navigator.pushNamed(context, 'BOTTOM_NAVIGATION');
                                    } else {
                                      Navigator.pushNamed(context, 'LOGIN');
                                    }
                                  }
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        )
    );
  }
}