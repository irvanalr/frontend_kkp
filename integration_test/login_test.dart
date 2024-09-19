
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

    // memasukan text abcdef ke dalam key usernameField
    await tester.enterText(find.byKey(const Key('namaPengguna')), 'abcdef');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    logger.i('Nama pengguna berhasil di isi');
    await tester.pump(const Duration(seconds: 2));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(seconds: 2));

    // memasukan text irvan123 ke dalam key passwordField
    await tester.enterText(find.byKey(const Key('kataSandi')), 'irvan123');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    logger.i('Kata sandi berhasil di isi');
    await tester.pump(const Duration(seconds: 2));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(seconds: 2));

    // test tap memperlihatkan password
    await tester.tap(find.byKey(const Key('buttonIconEye')));
    await tester.pumpAndSettle();
    logger.i('Berhasil memperlihatkan password');
    await tester.pump(const Duration(seconds: 2));

    // test tap menutup password
    await tester.tap(find.byKey(const Key('buttonIconEye')));
    await tester.pumpAndSettle();
    logger.i('Berhasil menyembunyikan password');
    await tester.pump(const Duration(seconds: 2));

    // test tap memperlihatkan password
    await tester.tap(find.byKey(const Key('buttonIconEye')));
    await tester.pumpAndSettle();
    logger.i('Berhasil memperlihatkan password');
    await tester.pump(const Duration(seconds: 2));

    // Menekan loggin button
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    // Button ok alert kesalahan
    await tester.tap(find.byKey(const Key('buttonOkAlertNamaPenggunaDanKataSandiSalah')));
    await tester.pumpAndSettle();
    logger.i('Peringatan ok kesalahan berhasil di click');
    await tester.pump(const Duration(seconds: 2));

    // memasukan text ke dalam namaPengguna
    await tester.tap(find.byKey(const Key('namaPengguna')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('namaPengguna')), '');
    await tester.pumpAndSettle();
    logger.i('Textfield namaPengguna berhasil di kosongkan');

    // memasukan text irvan ke dalam key usernameField
    await tester.enterText(find.byKey(const Key('namaPengguna')), 'irvan');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    logger.i('Nama pengguna berhasil di isi');
    await tester.pump(const Duration(seconds: 2));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(seconds: 2));

    // menekan login button
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));

    // Menekan Mutasi Selengkapnya
    await tester.pump(const Duration(seconds: 3));
    await tester.tap(find.text('Mutasi Selengkapnya'));
    await tester.pumpAndSettle();
    logger.i('Berhasil berpindah ke Mutasi Selengkapnya');
    await tester.pump(const Duration(seconds: 2));

    // Menekan 5 Transaksi terakhir
    await tester.tap(find.text('5 Transaksi terakhir'));
    await tester.pumpAndSettle();
    logger.i('Berhasil berpindah ke halaman rentang waktu');
    await tester.pump(const Duration(seconds: 2));

    // Menekan 10 Transaksi terakhir
    await tester.tap(find.text('10 Transaksi terakhir'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke 10 Transaksi terakhir');
    await tester.pump(const Duration(seconds: 2));

    // Menekan 20 Transaksi terakhir
    await tester.tap(find.text('20 Transaksi terakhir'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke 20 Transaksi terakhir');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.tap(find.text('Pilih keinginan'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke Pilih keinginan');
    await tester.pump(const Duration(seconds: 2));

    // Menekan 20 Transaksi terakhir
    await tester.tap(find.text('20 Transaksi terakhir'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke 20 Transaksi terakhir');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Button Terapkan
    await tester.tap(find.text('Terapkan'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan Button Terapkan');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Button Tabungan Simpati
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.text('Tabungan Simpati'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan Button Tabungan Simpati');
    await tester.pump(const Duration(seconds: 2));

    // Menekan tombol kembali di AppBar
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('kembali appbar')));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan tombol kembali di AppBar');
    await tester.pump(const Duration(seconds: 2));

    // Menekan 20 Transaksi terakhir
    await tester.tap(find.text('20 Transaksi terakhir'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke 20 Transaksi terakhir');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.tap(find.text('Pilih keinginan'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke Pilih keinginan');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.tap(find.text('Pilih Transaksi'), warnIfMissed: false);
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan radio button ke Pilih Transaksi');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('10 Transaksi'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan 10 Transaksi');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.tap(find.text('Pilih tanggal'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan Pilih tanggali');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan OK');
    await tester.pump(const Duration(seconds: 2));

    // Menekan Pilih keinginan
    await tester.tap(find.text('Terapkan'));
    await tester.pumpAndSettle();
    logger.i('Berhasil menekan Terapkan');
    await tester.pump(const Duration(seconds: 2));


  });
}