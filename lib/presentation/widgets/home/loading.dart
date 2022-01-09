import 'package:chairs_factory/utils/constants/utils.dart';
import 'package:chairs_factory/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 35,
        ),
        SkeletonAnimation(
          shimmerColor: Colors.white,
          borderRadius: BorderRadius.circular(32),
          shimmerDuration: 1500,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              //boxShadow: shadowList,
            ),
            child: Text(
              translate('Loading'),
              style: AppStyle().textStyle2.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
