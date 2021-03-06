import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'core/constant/language_manager.dart';
import 'core/theme/app_theme.dart';
import 'features/contestPage/model/contest_model.dart';
import 'features/homePage/view/homePage_view.dart';
import 'features/onboardingpage/view/onboarding_view.dart';
import 'features/profilPage/view/profil_view.dart';
import 'features/registerPage/view/register_view.dart';
import 'features/searchPage/view/search_view.dart';

import 'core/constant/app/app_constants.dart';

import 'features/addFoodPage/view/addFoodPage_view.dart';
import 'features/contestPage/views/ContestDetailPage/view/contestdetail_view_page.dart';
import 'features/contestPage/views/ContestPage/view/contestHomePage_view.dart';
import 'features/contestPage/views/contestFinishedDetailPage/finishedContestPage.dart';

import 'features/profilPage/service/profile_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: AppConstants.LANG_ASSET_PATH,
      supportedLocales: LanguageManager.instance!.supportedLocales,
      startLocale: LanguageManager.instance!.trLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileService().getUser();
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.createTheme(AppThemeLight()),
        initialRoute: '/',
        routes: {
          "/": (context) => const OnboardingScreen(),
        },
        onGenerateRoute: (settings) {
          List<String> filtered = settings.name!.split("/");
          switch (filtered[1]) {
            case "/homePome":
              return PageTransition(
                child: const HomePageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
            case "searchPage":
              return PageTransition(
                child: const SearchPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
            case "contestPage":
              return PageTransition(
                child: const ContestPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
            case "contestDetail":
              return PageTransition(
                child: const ContestDetailPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );

            case "finishContestDetail":
              return PageTransition(
                child: FinishedContestPageView(
                  pageId: int.parse(filtered[3]),
                  model: ContestModel(),
                ),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );

            case "registerPage":
              return PageTransition(
                child: const RegisterView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );

            case "profilePage":
              return PageTransition(
                child: const ProfilPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
            case "addFoodPage":
              return PageTransition(
                child: const AddFoodPageView(),
                type: PageTransitionType.fade,
                settings: settings,
                reverseDuration: const Duration(seconds: 0),
              );
          }
          return null;
        });
  }
}
