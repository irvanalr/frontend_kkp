import 'package:febankflutter/ui/splash_screen/splash_screen.dart';
import 'package:febankflutter/utils/routes/route.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger();

  testWidgets('tree widget splashScren test', (WidgetTester tester) async {
    await dotenv.load(fileName: '.env');
    // Build SplashScreen
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: SplashScreen(),
      ),
      initialRoute: RoutePaths.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

    // cek SplashScreenadalah adalah widget teratas
    final SplashScreen splashScreenWidget = tester.firstWidget(find.byType(SplashScreen));
    expect(splashScreenWidget, isNotNull);
    logger.i('cek SplashScreen adalah widget teratas');

    // cek Scaffold anak dari SplashScreen
    expect(find.descendant(of: find.byType(SplashScreen), matching: find.byType(Scaffold)), findsOneWidget);
    logger.i('cek Scaffold anak dari SplashScreen');

    // cek Center anak dari Scaffold
    expect(find.descendant(of: find.byType(Scaffold), matching: find.byType(Center)), findsOneWidget);
    logger.i('cek Center anak dari Scaffold');

    // cek FadeTransition anak dari Center
    expect(find.descendant(of: find.byType(Center), matching: find.byType(FadeTransition)), findsOneWidget);
    logger.i('cek FadeTransition anak dari Center');

    // cek Image anak dari FadeTransisiton
    expect(find.descendant(of: find.byType(FadeTransition), matching: find.byType(Image)), findsOneWidget);
    logger.i('cek Image anak dari FadeTransition');

    // Menunggu hingga animasi FadeTransition SplashScreen selesai (1500 ms)
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    // Menunggu Future builder Login selesai (1500 ms)
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();
  });
}
