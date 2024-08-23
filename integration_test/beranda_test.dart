import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:logger/logger.dart';
import 'package:febankflutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final logger = Logger();

  testWidgets("beranda test", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Menunggu splash screen selesai ditampilkan selama 3 detik
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // Menunggu splash screen selesai ditampilkan selama 3 detik
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      logger.i('SplashScreen berhasil di tampilkan');

      // memasukan text iwanaf ke dalam key usernameField
      await tester.enterText(find.byKey(const Key('namaPengguna')), 'iwanaf');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      logger.i('Nama pengguna berhasil di isi');
      await tester.pump(const Duration(seconds: 1));

      // test tap container yang akan menutup keyboard
      await tester.tapAt(const Offset(300, 100));
      await tester.pumpAndSettle();
      logger.i('Berhasil menutup keyboard');
      await tester.pump(const Duration(seconds: 1));

      // memasukan text Iw4n4f ke dalam key passwordField
      await tester.enterText(find.byKey(const Key('kataSandi')), 'Iw4n4f');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      logger.i('Kata sandi berhasil di isi');
      await tester.pump(const Duration(seconds: 1));

      // test tap container yang akan menutup keyboard
      await tester.tapAt(const Offset(300, 100));
      await tester.pumpAndSettle();
      logger.i('Berhasil menutup keyboard');
      await tester.pump(const Duration(seconds: 1));

      // Menekan loggin button
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      // Menekan Mutasi Selengkapnya
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.text('Mutasi Selengkapnya'));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Mutasi Selengkapnya');
      await tester.pump(const Duration(seconds: 2));

      // Menekan arrow icon kembali ke beranda
      await tester.tap(find.byKey(const Key('arrowKembaliKeBeranda')));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke beranda');
      await tester.pump(const Duration(seconds: 2));

      // // Menekan Selengkapnya
      // await tester.tap(find.text('Selengkapnya'));
      // await tester.pumpAndSettle();
      // logger.i('Berhasil berpindah ke Mutasi Selengkapnya');
      // await tester.pump(const Duration(seconds: 2));

      // // Menekan arrow icon kembali ke beranda
      // await tester.tap(find.byKey(const Key('arrowKembaliKeBeranda')));
      // await tester.pumpAndSettle();
      // logger.i('Berhasil berpindah ke beranda');
      // await tester.pump(const Duration(seconds: 2));

      // Menekan Rekening navigation
      await tester.tap(find.text('Rekening'));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Rekening');
      await tester.pump(const Duration(seconds: 1));

      // Menekan Simpanan Berjangka
      await tester.tap(find.byKey(const Key('Simpanan Berjangka')));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Rekening Simpanan Berjangka');
      await tester.pump(const Duration(seconds: 2));

      // Menekan Pembiayaan
      await tester.tap(find.byKey(const Key('Pembiayaan')));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Rekening Pembiayaan');
      await tester.pump(const Duration(seconds: 2));

      // Menekan notifikasi navigation
      await tester.tap(find.text('Notifikasi'));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Notifikasi');
      await tester.pump(const Duration(seconds: 1));

      // Menekan Akun navigation
      await tester.tap(find.text('Akun'));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Akun');
      await tester.pump(const Duration(seconds: 1));

      // Menekan logo iw ke profile
      await tester.tap(find.text('IW'));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Profile');
      await tester.pump(const Duration(seconds: 1));

      // Menekan arrow icon kembali ke Akun Navigation
      await tester.tap(find.byKey(const Key('arrowKembaliKeNavigationBottomBar')));
      await tester.pumpAndSettle();
      logger.i('Berhasil berpindah ke Akun navigation');
      await tester.pump(const Duration(seconds: 2));
  });
}