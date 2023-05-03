import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:safee/presentation/widgets/widget.dart';
import 'package:safee/routes/route_generator.dart';
import 'package:safee/styles/style.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: ThemeData(fontFamily: 'Poppins'),
        builder: EasyLoading.init(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}

void setupApp() {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  runApp(const MainApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 60.0
    ..radius = 10.0
    ..backgroundColor = Colors.transparent
    ..progressColor = primaryPurple
    ..boxShadow = <BoxShadow>[]
    ..indicatorColor = primaryPurple
    ..textColor = primaryPurple
    ..maskColor = Colors.black.withOpacity(0.7)
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black;
}
