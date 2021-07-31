import 'package:budget_planner/preferences/app_pref_controller.dart';
import 'package:budget_planner/screens/about_app_screen.dart';
import 'package:budget_planner/screens/app_main/actions/actions_screen.dart';
import 'package:budget_planner/screens/app_main/main_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/add_action_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/categories/add_new_category.dart';
import 'package:budget_planner/screens/bottom_navigation/categories/category_screen.dart';
import 'package:budget_planner/screens/bottom_navigation/home/settings_screen.dart';
import 'package:budget_planner/screens/auth/create_account_screen.dart';
import 'package:budget_planner/screens/currency_screen.dart';
import 'package:budget_planner/screens/auth/pin_code_screen.dart';
import 'package:budget_planner/screens/launch_screen.dart';
import 'package:budget_planner/screens/auth/login_screen.dart';
import 'package:budget_planner/screens/on_boarding/on_boarding_screen.dart';
import 'package:budget_planner/screens/success_action_screen.dart';
import 'package:budget_planner/screens/success_screen.dart';
import 'package:budget_planner/storage/db_provider.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await AppPrefController().initSharedPref();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static void changeLanguage({
    required BuildContext context,
    required Locale locale,
  }) {
    _MyAppState _myAppState = context.findAncestorStateOfType<_MyAppState>()!;
    _myAppState.changeLanguage(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _appLocale = Locale(AppPrefController().languageCode);

  void changeLanguage(Locale locale) {
    setState(() {
      _appLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: AppColors.APP_PRIMARY_COLOR,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
                color: AppColors.APP_DARK_PRIMARY_COLOR,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.APP_PRIMARY_COLOR,
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            color: AppColors.TEXT_COLOR,
          ),
        ),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
      ],
      locale: _appLocale,
      initialRoute: '/launch_screen',
      // initialRoute: '/main_screen',
      // initialRoute: '/login_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/on_boarding_screen': (context) => OnBoardingScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/create_account_screen': (context) => CreateAccountScreen(),
        '/pin_code_screen': (context) => PinCodeScreen(),
        '/success_screen': (context) => SuccessScreen(),
        '/success_action_screen': (context) => SuccessActionScreen(),
        '/main_screen': (context) => MainScreen(),
        '/settings_screen': (context) => SettingsScreen(),
        '/actions_screen': (context) => ActionsScreen(),
        '/add_new_category': (context) => AddNewCategory(),
        '/category_screen': (context) => CategoryScreen(),
        '/about_screen': (context) => AboutScreen(),
        '/currency_screen': (context) => CurrencyScreen(),
        '/add_action_screen': (context) => AddActionScreen(),
        // '/action_details_screen': (context) => ActionDetailsScreen()
      },
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     centerTitle: true,
      //     elevation: 0,
      //     color: Colors.transparent,
      //     iconTheme: IconThemeData(
      //       color: AppColors.APP_DARK_PRIMARY_COLOR,
      //       size: 20,
      //     ),
      //   ),
      // ),
    );
  }
}
