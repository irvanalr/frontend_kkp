import 'package:febankflutter/ui/login/costume_textfield_login.dart';
import 'package:febankflutter/ui/login/information_registrasi_overlay/information_registrasi_overlay.dart';
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

    // cek GestureDetector anak dari Login
    expect(find.descendant(of: find.byType(Login), matching: find.byKey(const Key('gestureDetectorPertama'))), findsOneWidget);
    logger.i('cek GestureDetector anak dari Login');

    // cek Scaffold anak dari GestureDetector
    expect(find.descendant(of: find.byKey(const Key('gestureDetectorPertama')), matching: find.byType(Scaffold)), findsOneWidget);
    logger.i('cek Scaffold anak dari GestureDetector');

    // cek AppBar anak dari Scaffold
    expect(find.descendant(of: find.byType(Scaffold), matching: find.byType(AppBar)), findsOneWidget);
    logger.i('cek AppBar anak dari Scaffold ');

    // cek Image anak dari AppBar
    expect(find.descendant(of: find.byType(AppBar), matching: find.byType(Image)), findsOneWidget);
    logger.i('cek Image anak dari AppBar ');

    // cek Text anak dari AppBar
    expect(find.descendant(of: find.byType(AppBar), matching: find.byType(Text)), findsOneWidget);
    logger.i('cek Text anak dari AppBar ');

    // Menekan AlertButtonOk
    expect(find.byType(AlertDialog), findsOneWidget);
    logger.i('cek AlertDialog anak dari Scaffold');
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // cek FutureBuilder anak dari Scaffold
    expect(find.descendant(of: find.byType(Scaffold), matching: find.byKey(const Key('futureBuilderKey'))), findsOneWidget);
    logger.i('cek FutureBuilder anak dari Scaffold ');

    // cek 2 SingleChildScrollView anak dari FutureBuilder
    expect(find.byType(SingleChildScrollView), findsNWidgets(2));
    logger.i('cek 2 SingleChildScrollView anak dari FutureBuilder');

    await tester.pumpAndSettle();

    // cek Stack anak dari SingleChildScrollViewPertama
    expect(find.descendant(of: find.byType(SingleChildScrollView), matching: find.byKey(const Key('stackPertama'))), findsOneWidget);
    logger.i('cek Stack anak dari SingleChildScrollView');

    // cek ColumnPertama anak dari stackPertama
    expect(find.descendant(of: find.byKey(const Key('stackPertama')), matching: find.byKey(const Key('columnPertama'))), findsOneWidget);
    logger.i('cek ColumnPertama anak dari stackPertama');

    // cek sizedBoxPertama anak dari ColumnPertama
    expect(find.descendant(of: find.byKey(const Key('columnPertama')), matching: find.byKey(const Key('sizedBoxPertama'))), findsOneWidget);
    logger.i('cek SizedBoxPertama anak dari ColumnPertama');

    // cek stackKedua anak dari SizedBoxPertama
    expect(find.descendant(of: find.byKey(const Key('sizedBoxPertama')), matching: find.byKey(const Key('stackKedua'))), findsOneWidget);
    logger.i('cek stackKedua anak dari SizedBoxPertama');

    // cek containerPertama anak dari stackKedua
    expect(find.descendant(of: find.byKey(const Key('stackKedua')), matching: find.byKey(const Key('containerPertama'))), findsOneWidget);
    logger.i('cek containerPertama anak dari stackKedua');

    // cek paddingPertama anak dari sizedBoxPertama
    expect(find.descendant(of: find.byKey(const Key('sizedBoxPertama')), matching: find.byKey(const Key('paddingPertama'))), findsOneWidget);
    logger.i('cek paddingPertama anak dari sizedBoxPertama');

    // cek sizedBoxKedua anak dari paddingPertama
    expect(find.descendant(of: find.byKey(const Key('paddingPertama')), matching: find.byKey(const Key('sizedBoxKedua'))), findsOneWidget);
    logger.i('cek sizedBoxKedua anak dari paddingPertama');

    // cek paddingKedua anak dari sizedBoxPertama
    expect(find.descendant(of: find.byKey(const Key('sizedBoxPertama')), matching: find.byKey(const Key('paddingKedua'))), findsOneWidget);
    logger.i('cek paddingKedua anak dari sizedBoxPertama');

    // cek sizedBoxKetiga anak dari paddingKedua
    expect(find.descendant(of: find.byKey(const Key('paddingKedua')), matching: find.byKey(const Key('sizedBoxKetiga'))), findsOneWidget);
    logger.i('cek sizedBoxKetiga anak dari paddingKedua');

    // cek positionedPertama anak dari sizedBoxPertama
    expect(find.descendant(of: find.byKey(const Key('sizedBoxPertama')), matching: find.byKey(const Key('positionedPertama'))), findsOneWidget);
    logger.i('cek positionedPertama anak dari sizedBoxPertama');

    // cek columnKedua anak dari positionedPertama
    expect(find.descendant(of: find.byKey(const Key('positionedPertama')), matching: find.byKey(const Key('columnKedua'))), findsOneWidget);
    logger.i('cek columnKedua anak dari positionedPertama');

    // cek CostumeTextFieldLogin anak dari columnKedua
    expect(find.descendant(of: find.byKey(const Key('columnKedua')), matching: find.byType(CostumeTextFieldLogin)), findsOneWidget);
    logger.i('cek CostumeTextFieldLogin anak dari columnKedua');

    // cek gestureDetectorKedua anak dari columnKedua
    expect(find.descendant(of: find.byKey(const Key('columnKedua')), matching: find.byKey(const Key('gestureDetectorKedua'))), findsOneWidget);
    logger.i('cek gestureDetectorKedua anak dari columnKedua');

    // cek Text anak dari gestureDetectorKedua
    expect(find.descendant(of: find.byKey(const Key('gestureDetectorKedua')), matching: find.byType(Text)), findsOneWidget);
    logger.i('cek Text anak dari gestureDetectorKedua');

    // cek InformationMessageOverlayRegistrasi anak dari Login
    expect(find.descendant(of: find.byType(Login), matching: find.byType(InformationMessageOverlayRegistrasi)), findsOneWidget);
    logger.i('cek InformationMessageOverlayRegistrasi anak dari Login');
  });
}
