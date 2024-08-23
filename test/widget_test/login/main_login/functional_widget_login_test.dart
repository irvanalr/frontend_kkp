import 'package:febankflutter/ui/login/login.dart';
import 'package:febankflutter/utils/routes/route.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() async {
  final logger = Logger();

  testWidgets('Login widget test', (WidgetTester tester) async {
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

    // menangani alert button ok error
    expect(find.text('OK'), findsOneWidget);
    logger.i('Menemukan alert button ok error');
    await tester.tap(find.text('OK'));
    logger.i('Berhasil menekan alert button ok error');
    await tester.pumpAndSettle();

    // Menemukan widget carouselLogin
    expect(find.byKey(const Key('carouselLoginKey')), findsOneWidget);
    logger.i('Menemukan widget carousel login');

    // Tekan gambar pertama
    await tester.tap(find.byKey(const Key('carouselLoginKey')));
    await tester.pumpAndSettle();
    logger.i('menekan gambar ke-1 carouselLogin');

    // Loop untuk menekan gambar-gambar berikutnya di carousel
    for (int i = 0; i < 3; i++) { // 3 adalah jumlah gambar - 1 karena sudah menekan gambar pertama sebelumnya
      // Menunggu hingga alert muncul
      await tester.pump(const Duration(seconds: 1));

      // Menemukan button OK pada alert
      expect(find.text('OK'), findsOneWidget);
      logger.i('Menemukan button OK pada alert gambar ke-${i + 1}');

      // Tekan button OK pada alert
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      logger.i('button ok alert gambar ke-${i + 1} berhasil di tekan');

      // Geser dari kanan ke kiri untuk beralih ke gambar berikutnya
      await tester.drag(find.byKey(const Key('carouselLoginKey')), const Offset(-300, 0));
      await tester.pumpAndSettle();
      logger.i('Berhasil memindahkan gambar ke-${i + 2} carousel dari kanan ke kiri');

      // Tekan gambar berikutnya
      await tester.tap(find.byKey(const Key('carouselLoginKey')));
      await tester.pumpAndSettle();
      logger.i('menekan gambar ke-${i + 2} carouselLogin');
    }

    // Memasukan value kedalam NamaPengguna
    await tester.enterText(find.byKey(const Key('namaPengguna')), 'iwanaf');
    logger.i('Memasukan value kedalam textField namaPengguna');
    await tester.pumpAndSettle();

    // Memasukan value kedalam kataSandi
    await tester.enterText(find.byKey(const Key('kataSandi')), 'Iw4n4f');
    logger.i('Memasukan value kedalam textField kataSandi');
    await tester.pumpAndSettle();

    // Menemukan loginButton
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
    logger.i('Menemukan widget logginButton');
    // Menekan loginButton
    await tester.tap(find.byKey(const Key('loginButton')));
    logger.i('Menekan logginButton');
    await tester.pumpAndSettle();

    // menemukan menuKilat
    final visibilityWidget = tester.widget<Visibility>(find.byKey(const Key('menuKilatKey')));
    expect(visibilityWidget.visible, isTrue);
    logger.i('menemukan menuKilat');

    // menemukan String Registrasi
    expect(find.text('Registrasi'), findsOneWidget);
    logger.i('Menemukan String Registrasi');

    // mentap String Registrasi
    await tester.tap(find.text('Registrasi'));
    logger.i('Mentap String Registrasi');
    await tester.pumpAndSettle();

    // menemukan registrasiOverlay
    final visibilityWidgett = tester.widget<Visibility>(find.byKey(const Key('registrasiOverlay')));
    expect(visibilityWidgett.visible, isTrue);
    logger.i('menemukan registrasiOverlay');

    // menemukan iconClose
    expect(find.byKey(const Key('iconClose')), findsOneWidget);
    logger.i('menemukan IconClose');

    // mentap iconClose
    await tester.tap(find.byKey(const Key('iconClose')));
    logger.i('Berhasil menutup iconClose untuk overlay Registrasi');
    await tester.pumpAndSettle();

    // menutup registrasiOverlay
    final visibilityWidgettt = tester.widget<Visibility>(find.byKey(const Key('registrasiOverlay')));
    expect(visibilityWidgettt.visible, isFalse);
    logger.i('menutup registrasiOverlay');

    // Loop untuk mengetuk elemen index 1 sampai 3
    for (int index = 1; index <= 3; index++) {
      // Menemukan elemen di dalam menu kilat berdasarkan index
      final gestureDetector = find.descendant(
        of: find.byKey(const Key('menuKilatKey')),
        matching: find.byType(GestureDetector),
      ).at(index);

      // Mentap elemen
      await tester.tap(gestureDetector);
      logger.i('Mentap icon index ke-$index di menu kilat');
      await tester.pumpAndSettle();

      // Memeriksa apakah muncul alert dialog
      if (find.byType(AlertDialog).evaluate().isNotEmpty) {
        logger.i('Menemukan alert dialog setelah mentap icon index ke-$index');

        // Menemukan tombol OK pada alert dialog dan menekannya
        await tester.tap(find.byKey(const Key('alertOkPengembangan')));
        logger.i('Menekan tombol OK pada alert dialog untuk index ke-$index');
        await tester.pumpAndSettle();
      } else {
        logger.i('Tidak ada alert dialog yang muncul untuk index ke-$index');
      }
    }
  });
}
