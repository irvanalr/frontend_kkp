// import 'dart:io';

import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:febankflutter/utils/theme/theme.dart';
import 'package:febankflutter/utils/routes/route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // /// Pengaturan tidak boleh screenShoot dan record
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   if(Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // });
  /// Pengaturan perangkat rotasi layar
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      initialRoute: RoutePaths.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}