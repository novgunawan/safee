import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:safee/bloc/authentication/authentication_bloc.dart';
import 'package:safee/data/authentication/authentication_data_provider.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';
import 'package:safee/routes/route_generator.dart';
import 'package:safee/styles/style.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //BloC
  final AuthenticationBloc _authenticationBloc =
      AuthenticationBloc(AuthenticationDataProvider());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _authenticationBloc,
        )
      ],
      child: DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoute.onGenerateRoute,
          theme: ThemeData(fontFamily: 'Poppins'),
          builder: EasyLoading.init(),
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}

void setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
