import 'dart:io';

import 'package:chairs_factory/business_logic/cubit/chair_cubit.dart';
import 'package:chairs_factory/data/models/chiars/chair.dart';
import 'package:chairs_factory/presentation/pages/chiar/add_new_chair_page.dart';
import 'package:chairs_factory/presentation/widgets/utils/button.dart';
import 'package:chairs_factory/presentation/widgets/utils/icon_button.dart';
import 'package:chairs_factory/presentation/widgets/utils/text_view.dart';
import 'package:chairs_factory/utils/constants/utils.dart';
import 'package:chairs_factory/utils/constants/values.dart';
import 'package:chairs_factory/utils/themes/color.dart';
import 'package:chairs_factory/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChairItem extends StatelessWidget {
  const ChairItem({Key? key, required this.chair}) : super(key: key);

  final Chair chair;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AddNewChairPage.routeName, arguments: {'Chair': chair});
      },
      child: Card(
        margin: const EdgeInsets.all(4),
        child: Stack(children: [
          Align(
            alignment: isEn ? Alignment.topRight : Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: (chair.status == 1)
                    ? AppColor.txtColor3
                    : AppColor.txtColor5,
              ),
              child: TextView(
                padding: const EdgeInsets.all(4),
                text: (chair.status == 1)
                    ? translate('Open')
                    : translate('Closed'),
                style: AppStyle().textStyle2.copyWith(fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(
                    File(chair.picture),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextView(
                        padding: const EdgeInsets.all(2),
                        text: chair.title,
                        style: AppStyle().textStyle1.copyWith(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      TextView(
                        padding: const EdgeInsets.all(2),
                        text: chair.description,
                        style: AppStyle().textStyle1.copyWith(fontSize: 17),
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            padding: const EdgeInsets.all(2),
                            text: chair.createDate,
                            style: AppStyle().textStyle4.copyWith(fontSize: 14),
                            textAlign: TextAlign.start,
                          ),
                          IconButtonApp(
                            action: () => _chekDelete(context),
                            icon: Icon(
                              Icons.delete,
                              color: AppColor.white,
                              size: 20,
                            ),
                            bcolor: AppColor.txtColor5,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _chekDelete(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) {
      return Container(
        color: AppColor.conColor3l2,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Divider(
                thickness: 3,
                color: AppColor.conColor3b,
              ),
            ),
            const SizedBox(height: 24),
            ButtonApp(
              title: translate('DeleteChair'),
              action: () {
                Navigator.of(context).pop();
                BlocProvider.of<ChairCubit>(context).deleteChiar(chair);
              },
            ),
            const SizedBox(height: 16),
            ButtonApp(
              title: translate('Cancel'),
              action: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
    });
  }
}
/**
  BlocProvider.of<ChairCubit>(context)
      .deleteChiar(chair); */