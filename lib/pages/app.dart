import 'package:app/bloc/monitoreo_bloc/monitoreo_bloc.dart';
import 'package:app/pages/PageChatScreen.dart';
import 'package:app/pages/PageJobDetails.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/bloc/user_bloc/user_bloc.dart';
import 'package:app/pages/PageHistory.dart';
import 'package:app/pages/PageJobs.dart';
import 'package:app/pages/PageOnboarding.dart';
import 'package:app/pages/PageLogin.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/PageActiveGps.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => MonitoreoBloc())
      ],
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('en', 'ES'),
            const Locale('es', 'ES')
          ],
          title: 'Taxi Conductor',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Avenir'),
          darkTheme:
              ThemeData(primarySwatch: Colors.blue, fontFamily: 'Avenir'),
          routes: {
            'login': (_) => PageLogin(),
            'home': (_) => PageHome(),
            'gps': (_) => PagePermisosLocation(),
            'jobs': (_) => PageJobs(),
            'history': (_) => PageHistory(),
            'detailJobs': (_) => PageJobDetails(),
            'chat': (_) => PageChatScreen(),
            '/': (_) => PageOnboarding()
          },
          debugShowCheckedModeBanner: false,
          initialRoute: 'login'),
    );
  }
}
