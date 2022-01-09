import 'package:chairs_factory/business_logic/cubit/chair_cubit.dart';
import 'package:chairs_factory/presentation/pages/chiar/add_new_chair_page.dart';
import 'package:chairs_factory/presentation/widgets/chair/chair_item.dart';
import 'package:chairs_factory/presentation/widgets/home/app_tool_bar.dart';
import 'package:chairs_factory/presentation/widgets/home/loading.dart';
import 'package:chairs_factory/utils/constants/utils.dart';
import 'package:chairs_factory/utils/constants/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChairCubit>(context).findAllChiar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              changeLang: () {
                EasyLocalization.of(context)!
                    .setLocale(Locale(isEn ? 'ar' : 'en'));
                setState(() {
                  isEn = !isEn;
                });
              },
              title: translate('Home'),
              isFirst: true,
              action: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AddNewChairPage.routeName),
                icon: const Icon(Icons.add_circle),
              ),
            ),
            BlocBuilder<ChairCubit, ChairState>(
              builder: (context, state) {
                if (state is ChairSelectAll) {
                  return _viewData(state);
                } else if (state is ChiarInitial) {
                  return const Expanded(child: Center(child: Loading()));
                } else {
                  return Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AddNewChairPage.routeName),
                        child: Image.asset(
                          'assets/icons/add.png',
                          width: MediaQuery.of(context).size.width * .5,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _viewData(ChairSelectAll state) {
    return Expanded(
      child: ListView(
        //    shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.chairs.length,
            itemBuilder: (context, index) {
              return ChairItem(
                chair: state.chairs[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
