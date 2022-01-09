import 'package:chairs_factory/app_router.dart';
import 'package:chairs_factory/data/repository/database_repository.dart';
import 'package:chairs_factory/utils/constants/values.dart';
import 'package:chairs_factory/utils/themes/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DatabaseRepository().initDb();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang', // <- change the path of the translation files
      fallbackLocale: const Locale('en'),
      startLocale: Locale(isEn ? 'en' : 'ar'),
      useOnlyLangCode: true,
      child: CharsFactroy(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class CharsFactroy extends StatelessWidget {
  final AppRouter appRouter;

  const CharsFactroy({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppThemes().lightTheme,

      ///initialRoute: InfoHomePage.routeName,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
