import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chairs_factory/business_logic/cubit/chair_cubit.dart';
import 'package:chairs_factory/data/repository/database_repository.dart';
import 'package:chairs_factory/presentation/pages/chiar/add_new_chair_page.dart';
import 'package:chairs_factory/presentation/pages/home/home_page.dart';
import 'package:chairs_factory/presentation/pages/home/splash_page.dart';

class AppRouter {
  late DatabaseRepository databaseRepository;

  AppRouter() {
    databaseRepository = DatabaseRepository();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ChairCubit>(
            create: (_) => ChairCubit(databaseRepository),
            child: const HomePage(),
          ),
          settings: settings,
        );
      case AddNewChairPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ChairCubit>(
            create: (_) => ChairCubit(databaseRepository),
            child: const AddNewChairPage(),
          ),
          settings: settings,
        );
    }
  }
}
