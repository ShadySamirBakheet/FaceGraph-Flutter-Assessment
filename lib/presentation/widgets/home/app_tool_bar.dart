import 'package:chairs_factory/presentation/widgets/utils/text_view.dart';
import 'package:chairs_factory/utils/constants/values.dart';
import 'package:chairs_factory/utils/themes/color.dart';
import 'package:chairs_factory/utils/themes/text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppToolBar extends StatelessWidget {
  AppToolBar({
    Key? key,
    required this.title,
    required this.changeLang,
    this.back,
    this.action,
    this.isFirst = false,
    this.subTitle,
  }) : super(key: key);

  bool isOpen = false;
  final Function()? back;
  final String title;
  Widget? action;
  Widget? subTitle;
  bool isFirst;

  Function() changeLang;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: AppColor.background1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          children: [
            if (!isFirst)
              IconButton(
                onPressed: back,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.txtColor1,
                  size: 20,
                ),
              ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: title,
                      style: AppStyle()
                          .textStyle1
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      padding: const EdgeInsets.all(4),
                    ),
                    subTitle ?? Container(),
                  ],
                ),
              ),
            ),
            action ?? Container(),
            GestureDetector(
              onTap: changeLang,
              child: Container(
                child: TextView(
                  text: isEn ? 'AR' : 'EN',
                  style: AppStyle()
                      .textStyle2
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                decoration: BoxDecoration(
                    color: AppColor.btnColor1,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
