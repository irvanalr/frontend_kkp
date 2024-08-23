
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:logger/logger.dart';
import 'package:febankflutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final logger = Logger();

  testWidgets("login test", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Menunggu splash screen selesai ditampilkan selama 3 detik
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    logger.i('SplashScreen berhasil di tampilkan');

    // memasukan text iwanaf ke dalam key usernameField
    await tester.enterText(find.byKey(const Key('namaPengguna')), 'abcdef');
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

    // test tap memperlihatkan password
    await tester.tap(find.byKey(const Key('buttonIconEye')));
    await tester.pumpAndSettle();
    logger.i('Berhasil memperlihatkan password');
    await tester.pump(const Duration(seconds: 1));

    // test tap menutup password
    await tester.tap(find.byKey(const Key('buttonIconEye')));
    await tester.pumpAndSettle();
    logger.i('Berhasil menyembunyikan password');
    await tester.pump(const Duration(seconds: 1));

    // test tap memperlihatkan password
    await tester.tap(find.byKey(const Key('buttonIconEye')));
    await tester.pumpAndSettle();
    logger.i('Berhasil memperlihatkan password');
    await tester.pump(const Duration(seconds: 1));

    // Menekan loggin button
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    // Button ok alert kesalahan
    await tester.tap(find.byKey(const Key('buttonOkAlert')));
    await tester.pumpAndSettle();
    logger.i('Peringatan ok kesalahan berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // memasukan text ke dalam namaIbuKandung
    await tester.tap(find.byKey(const Key('namaPengguna')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('namaPengguna')), '');
    await tester.pumpAndSettle();
    logger.i('Textfield namaPengguna berhasil di kosongkan');
    await tester.enterText(find.byKey(const Key('namaPengguna')), 'iwanaf');
    await tester.pumpAndSettle();
    logger.i('Textfield namaPengguna berhasil di isi');
    await tester.pump(const Duration(seconds: 1));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(seconds: 1));

    // menekan login button
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));

  });
}