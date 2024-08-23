
import 'package:febankflutter/ui/login/login.dart';
import 'package:febankflutter/utils/routes/route.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  final logger = Logger();

  testWidgets('render String login test', (WidgetTester tester) async {
    await dotenv.load(fileName: '.env');

    // Build SplashScreen
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: Login(),
      ),
      initialRoute: RoutePaths.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

    // Menunggu Future builder Login selesai (1500 ms)
    await tester.pump(const Duration(milliseconds: 1500));
    logger.i('Render Future Builder sudah di lakukan');
    await tester.pumpAndSettle();

    // cek Login adalah widget teratas
    final Login login = tester.firstWidget(find.byType(Login));
    expect(login, isNotNull);
    logger.i('cek Login adalah widget teratas');

    // Cek String Perhatian alert getApikey
    expect(find.text('Perhatian'), findsOneWidget);
    logger.i('Menemukan String Perhatian');

    // Cek String Perhatian body alert getApiKey
    expect(find.text('Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!'), findsOneWidget);
    logger.i('Menemukan String Perhatian body alert getApiKey');

    // Cek String Perhatian Button alert getApiKey
    expect(find.text('OK'), findsOneWidget);
    logger.i('Menemukan String Perhatian Button alert getApiKey');

    // // menghilangkan alert dengan mengetuk button ok
    // await tester.tap(find.text('OK'));
    // logger.i('Berhasil menekan button Alert ok getApiKey');

    //
  });
}