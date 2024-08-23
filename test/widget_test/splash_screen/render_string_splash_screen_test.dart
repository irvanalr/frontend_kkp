import 'package:febankflutter/ui/login/login.dart';
import 'package:febankflutter/ui/splash_screen/splash_screen.dart';
import 'package:febankflutter/utils/routes/route.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger();

  testWidgets('functional widget splash screen test', (WidgetTester tester) async {
    await dotenv.load(fileName: '.env');
    // Build SplashScreen
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: SplashScreen(),
      ),
      initialRoute: RoutePaths.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

    // SplashScreen di temukan
    expect(find.byType(SplashScreen), findsOneWidget);
    logger.i('SplashScreen di temukan');

    // Cek apakah ada String yang di render
    expect(find.text('assets/png/bmtdigi.png'), findsNothing);
    logger.i('Cek apakah ada String yang di render');
    logger.w('Tidak ada String yang di render');

    // Menunggu hingga animasi SplashScreen selesai (1500 ms)
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    // Menunggu Future builder Login selesai (1500 ms)
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    // Login di temukan
    expect(find.byType(Login), findsOneWidget);
    logger.i('Loggin di temukan');
  });
}
