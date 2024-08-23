import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:febankflutter/main.dart' as app;
import 'package:logger/logger.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final logger = Logger();

  testWidgets("Radio Button test lupa namaPengguna atau KataSandi", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Menunggu splash screen selesai ditampilkan selama 3 detik
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    logger.i('SplashScreen berhasil di tampilkan');

    // Pergi ke halaman lupa nama pengguna dan kata sandi
    await tester.tap(find.byKey(const Key('lupaNamaPenggunaAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Link ancor String lupa nama pengguna atau kata sandi berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // RadioButton kata sandi
    await tester.tap(find.byKey(const Key('radioButtonKataSandi')));
    await tester.pumpAndSettle();
    logger.i('RadioButton kata sandi berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // RadioButton nama Pengguna
    await tester.tap(find.byKey(const Key('radioButtonNamaPengguna')));
    await tester.pumpAndSettle();
    logger.i('RadioButton nama pengguna berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // InkWell radioButton Kata sandi
    await tester.tap(find.byKey(const Key('radioButtonInkWellKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Inkwell radioButton kata sandi berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // InkWell radioButton nama pengguna
    await tester.tap(find.byKey(const Key('radioButtonInkWellNamaPengguna')));
    await tester.pumpAndSettle();
    logger.i('Inkwell radioButton nama pengguna berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));
  });

  testWidgets("Lupa namaPengguna test", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Menunggu splash screen selesai ditampilkan selama 3 detik
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    logger.i('SplashScreen berhasil di tampilkan');

    // Pergi ke halaman lupa nama pengguna dan kata sandi
    await tester.tap(find.byKey(const Key('lupaNamaPenggunaAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Link ancor String lupa nama pengguna atau kata sandi berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // Button lanjutkan lupaNamaPenggunaAtauKataSandi
    await tester.tap(find.byKey(const Key('buttonLanjutkanLupaNamaPenggunAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Button lanjutkan lupa nama pengguna atau kata sandi berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // memasukan text ke dalam nomorKtp
    await tester.enterText(find.byKey(const Key('textFieldNomorKtp')), '1231231231231231');
    await tester.pumpAndSettle();
    logger.i('TextField nomor ktp berhasil isi');
    await tester.pump(const Duration(milliseconds: 1700));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(milliseconds: 1700));

    // memasukan text ke dalam namaIbuKandung
    await tester.enterText(find.byKey(const Key('textFieldNamaIbuKandung')), 'jane salamah');
    await tester.pumpAndSettle();
    logger.i('TextField nama ibu kandung berhasil isi');
    await tester.pump(const Duration(milliseconds: 1700));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(milliseconds: 1700));

    // memasukan text ke dalam nomerRekening
    await tester.enterText(find.byKey(const Key('textFieldNomorRekeningBank')), '123123123123123');
    await tester.pumpAndSettle();
    logger.i('Textfield nomor rekening bank berhasil di isi');
    await tester.pump(const Duration(milliseconds: 1700));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(milliseconds: 1700));

    // Button lanjutkan lupaNamaPengguna
    await tester.tap(find.byKey(const Key('buttonLanjutkanLupaNamaPengguna')));
    await tester.pumpAndSettle();
    logger.i('Button lanjutkan lupa nama pengguna berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // Button ok alert kesalahan
    await tester.tap(find.byKey(const Key('buttonOkAlert')));
    await tester.pumpAndSettle();
    logger.i('Peringatan ok kesalahan berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // memasukan text ke dalam namaIbuKandung
    await tester.tap(find.byKey(const Key('textFieldNamaIbuKandung')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('textFieldNamaIbuKandung')), '');
    await tester.pumpAndSettle();
    logger.i('Textfield nama ibu kandung berhasil di kosongkan');
    await tester.enterText(find.byKey(const Key('textFieldNamaIbuKandung')), 'jane');
    await tester.pumpAndSettle();
    logger.i('Textfield nama ibu kandung berhasil di isi');
    await tester.pump(const Duration(milliseconds: 1700));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(milliseconds: 1700));

    // Button lanjutkan lupaNamaPengguna
    await tester.tap(find.byKey(const Key('buttonLanjutkanLupaNamaPengguna')));
    await tester.pumpAndSettle();
    logger.i('Button lanjutkan lupa nama pengguna berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // Button ok alert sukses
    await tester.tap(find.byKey(const Key('buttonOkAlert')));
    await tester.pumpAndSettle();
    logger.i('Peringatan ok sukses berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // panah kembali ke panahLupaNamaPenggunaAtauKataSandi
    await tester.tap(find.byKey(const Key('panahKembaliKeLupaNamaPenggunAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Panah kembali lupa nama pengguna berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // Panah kembali ke login
    await tester.tap(find.byKey(const Key('panahKembaliKeLogin')));
    await tester.pumpAndSettle();
    logger.i('panah kembali login berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

  });

  testWidgets("lupa kata sandi test", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Menunggu splash screen selesai ditampilkan selama 3 detik
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    logger.i('SplashScreen berhasil di tampilkan');

    // Pergi ke halaman lupa nama pengguna dan kata sandi
    await tester.tap(find.byKey(const Key('lupaNamaPenggunaAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Link ancor String lupa nama pengguna atau kata sandi berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // RadioButton kata sandi
    await tester.tap(find.byKey(const Key('radioButtonKataSandi')));
    await tester.pumpAndSettle();
    logger.i('RadioButton kata sandi berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // Button lanjutkan lupa nama pengguna atau kata sandi
    await tester.tap(find.byKey(const Key('buttonLanjutkanLupaNamaPenggunAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Button lanjutkan lupa nama pengguna atau kata sandi berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // memasukan text ke dalam namaPengguna
    await tester.enterText(find.byKey(const Key('textFieldNamaPengguna')), 'abcs');
    await tester.pumpAndSettle();
    logger.i('Textfield nomor rekening bank berhasil di isi');
    await tester.pump(const Duration(seconds: 1));

    // test tap container yang akan menutup keyboard
    await tester.tapAt(const Offset(300, 100));
    await tester.pumpAndSettle();
    logger.i('Berhasil menutup keyboard');
    await tester.pump(const Duration(seconds: 1));

    // menekan textField tanggal lahir untuk memilih tanggal
    await tester.tap(find.byKey(const Key('textFieldTanggalLahir')));
    await tester.pumpAndSettle();
    logger.i('TextField tanggal lahir berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // menekan textField untuk memilih tanggal lahir
    await tester.tapAt(const Offset(200, 410));
    await tester.pumpAndSettle();
    logger.i('TextField tanggal lahir berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // menekan ok setelah memilih tanggal
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    logger.i('ok pemilihan berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // Button lanjutkan lupaNamaPengguna
    await tester.tap(find.byKey(const Key('buttonLanjutkanLupaKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Button lanjutkan lupa kata sandi berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // Button ok alert kesalahan
    await tester.tap(find.byKey(const Key('buttonOkAlert')));
    await tester.pumpAndSettle();
    logger.i('Peringatan ok kesalahan berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // memasukan text ke dalam namaIbuKandung
    await tester.tap(find.byKey(const Key('textFieldNamaPengguna')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('textFieldNamaPengguna')), '');
    await tester.pumpAndSettle();
    logger.i('Textfield namaPengguna berhasil di kosongkan');
    await tester.enterText(find.byKey(const Key('textFieldNamaPengguna')), 'abc');
    await tester.pumpAndSettle();
    logger.i('Textfield namaPengguna berhasil di isi');
    await tester.pump(const Duration(milliseconds: 1700));

    // Button lanjutkan lupaNamaPengguna
    await tester.tap(find.byKey(const Key('buttonLanjutkanLupaKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Button lanjutkan lupa kata sandi berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // Button ok alert sukses
    await tester.tap(find.byKey(const Key('buttonOkAlert')));
    await tester.pumpAndSettle();
    logger.i('Peringatan ok sukses berhasil di click');
    await tester.pump(const Duration(seconds: 1));

    // panah kembali ke panahLupaNamaPenggunaAtauKataSandi
    await tester.tap(find.byKey(const Key('panahKembaliKeLupaNamaPenggunAtauKataSandi')));
    await tester.pumpAndSettle();
    logger.i('Panah kembali lupa nama pengguna berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));

    // Panah kembali ke login
    await tester.tap(find.byKey(const Key('panahKembaliKeLogin')));
    await tester.pumpAndSettle();
    logger.i('panah kembali login berhasil di click');
    await tester.pump(const Duration(milliseconds: 1700));
  });
}