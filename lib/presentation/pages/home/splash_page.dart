import 'dart:async';

import 'package:chairs_factory/presentation/pages/home/home_page.dart';
import 'package:chairs_factory/utils/constants/utils.dart';
import 'package:chairs_factory/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        goNext(context);
        timer.cancel();
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon.png',
              width: 150,
            ),
            const SizedBox(
              height: 35,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 35,
            ),
            SkeletonAnimation(
              shimmerColor: Colors.white,
              borderRadius: BorderRadius.circular(32),
              shimmerDuration: 1000,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  //boxShadow: shadowList,
                ),
                child: Text(
                  translate('WelcomeDear'),
                  style: AppStyle().textStyle2.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: SkeletonAnimation(
                shimmerColor: Colors.white,
                borderRadius: BorderRadius.circular(32),
                shimmerDuration: 1000,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    //boxShadow: shadowList,
                  ),
                  child: Text(
                    translate('appName'),
                    style: AppStyle().textStyle2.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  goNext(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
}
