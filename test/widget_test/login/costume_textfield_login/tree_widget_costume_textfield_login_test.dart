import 'package:febankflutter/ui/login/costume_textfield_login.dart';
import 'package:febankflutter/ui/login/login.dart';
import 'package:febankflutter/utils/routes/route.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger();

  testWidgets('tree widget login test', (WidgetTester tester) async {
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

    // cek CostumeTextFieldLogin apakah ada
    expect(find.byType(CostumeTextFieldLogin), findsOneWidget);
    logger.i('Menemukan CostumeTextfieldLogin');

    // cek CostumeTextFieldLogin anak dari columnKedua
    expect(find.descendant(of: find.byKey(const Key('columnKedua')), matching: find.byType(CostumeTextFieldLogin)), findsOneWidget);
    logger.i('cek CostumeTextFieldLogin anak dari columnKedua');

    // cek SingleChildScrollView anak dari CostumeTextFieldLogin
    expect(find.descendant(of: find.byType(CostumeTextFieldLogin), matching: find.byKey(const Key('costumeTextFieldLoginKey'))), findsOneWidget);
    logger.i('cek SingleChildScrollView anak dari CostumeTextFieldLogin');

    // cek Column CostumeTextField anak dari SingleChildScrollView
    expect(find.descendant(of: find.byKey(const Key('costumeTextFieldLoginKey')), matching: find.byKey(const Key('columnCostumeTextField'))), findsOneWidget);
    logger.i('cek Column CostumeTextField anak dari SingleChildScrollView');

    // cek containerCostumeTextField anak dari columnCostumeTextField
    expect(find.descendant(of: find.byKey(const Key('columnCostumeTextField')), matching: find.byKey(const Key('containerCostumeTextField'))), findsOneWidget);
    logger.i('cek containerCostumeTextField anak dari columnCostumeTextField');

    // cek namaPengguna anak dari containerCostumeTextField
    expect(find.descendant(of: find.byKey(const Key('containerCostumeTextField')), matching: find.byKey(const Key('namaPengguna'))), findsOneWidget);
    logger.i('cek namaPengguna anak dari containerCostumeTextField');
  });
}
