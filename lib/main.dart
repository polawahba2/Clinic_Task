import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/Cubit/AppCubit/AppStates.dart';
import 'package:technical_task/Res/AppTheme/AppTheme.dart';
import 'package:technical_task/translation/codegen_loader.g.dart';

import 'Cubit/AppCubit/AppCubit.dart';
import 'Cubit/AppCubit/MyBlockObserver.dart';
import 'Screens/TakeInformationScreen/TakeInformationScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    blocObserver: MyBlocObserver(),
    () {
      runApp(
        EasyLocalization(
          path: 'assets/translation',
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: const Locale('en'),
          assetLoader: const CodegenLoader(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => AppCubit()..createDB(),
              ),
            ],
            child: BlocConsumer<AppCubit, AppSataes>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  theme: !AppCubit.getCubit(context).isDarkMode
                      ? ThemeClass.lightTheme
                      : ThemeClass.darkTheme,
                  debugShowCheckedModeBanner: false,
                  home: TakeInformationScreen(),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
