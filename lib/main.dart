import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learner_prokit/Screens/LearnerWalkThrough.dart';
import 'package:learner_prokit/store/AppStore.dart';
import 'package:learner_prokit/utils/AppTheme.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
import 'package:learner_prokit/utils/LearnerDataGenerator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'sql_connection.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  checkPostgreSQLConnection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learner ${!isMobile ? ' ${platformName()}' : ''}',
        home: LearnerWalkThrough(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}
