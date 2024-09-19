
import 'package:febankflutter/viewmodels/lupa_nama_pengguna_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  final logger = Logger();

  group('lupaNamaPenggunaViewModel method updateNomorKtp', () {
    test('updateNomorKtp', () {
      logger.i('Menjalankan updateNomorKtp');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel nomorKtp berisikan : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.nomorKtp}');
      lupaNamaPenggunaViewModel.updateNomorKtp('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorKtp dengan parameter 1234567891012131');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.nomorKtp, '1234567891012131');
      logger.i('Seharusnya variabel nomorKtp berisikan : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.nomorKtp}');

    });
  });

  group('lupaNamaPenggunaViewModel method updateNamaIbuKandung', () {
    test('updateNamaIbuKandung', () {
      logger.i('Menjalankan updateNamaIbuKandung');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel namaIbuKandung berisikan : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.namaIbuKandung}');
      lupaNamaPenggunaViewModel.updateNamaIbuKandung('Jane');
      logger.i('Berhasil menjalankan function updateNamaIbuKandung dengan parameter Jane');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.namaIbuKandung, 'Jane');
      logger.i('Seharusnya variabel namaIbuKandung berisikan : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.namaIbuKandung}');

    });
  });

  group('lupaNamaPenggunaViewModel method updateNomorRekening', () {
    test('updateNomorRekening', () {
      logger.i('Menjalankan updateNomorRekening');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel nomorRekening berisikan : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.nomorRekening}');
      lupaNamaPenggunaViewModel.updateNomorRekening('1312101987654321');
      logger.i('Berhasil menjalankan function updateNomorRekening dengan parameter 1312101987654321');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.nomorRekening, '1312101987654321');
      logger.i('Seharusnya variabel nomorRekening berisikan : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.nomorRekening}');

    });
  });

  group('lupaNamaPenggunaViewModel method updateButtonStatus', () {
    test('updateButtonStatus jika hanya mengisikan nomorKtp', () {
      logger.i('Menjalankan updateButtonStatus jika hanya mengisikan nomorKtp');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNomorKtp('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorKtp dengan parameter 1234567891012131');

      // tegaskan (asert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika hanya mengisikan namaIbuKandung', () {
      logger.i('Menjalankan updateButtonStatus jika hanya mengisikan namaIbuKandung');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNamaIbuKandung('jane');
      logger.i('Berhasil menjalankan function updateNamaIbuKandung dengan parameter jane');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika hanya mengisikan nomorRekening', () {
      logger.i('Menjalankan updateButtonStatus jika hanya mengisikan nomorRekening');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNomorRekening('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorRekening dengan parameter 1234567891012131');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika mengisikan nomorKtp dan namaIbuKandung', () {
      logger.i('Menjalankan updateButtonStatus jika mengisikan nomorKtp dan namaIbuKandung');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNomorKtp('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorKtp dengan parameter 1234567891012131');
      lupaNamaPenggunaViewModel.updateNamaIbuKandung('jane');
      logger.i('Berhasil menjalankan function updateNamaIbuKandung dengan parameter jane');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika mengisikan namaIbuKandung dan nomorRekening', () {
      logger.i('Menjalankan updateButtonStatus jika mengisikan namaIbuKandung dan nomorRekening');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNamaIbuKandung('jane');
      logger.i('Berhasil menjalankan function updateNamaIbuKandung dengan parameter jane');
      lupaNamaPenggunaViewModel.updateNomorRekening('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorRekening dengan parameter 1234567891012131');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika mengisikan nomorKtp dan nomorRekening', () {
      logger.i('Menjalankan updateButtonStatus jika mengisikan nomorKtp dan nomorRekening');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNomorKtp('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorKtp dengan parameter 1234567891012131');
      lupaNamaPenggunaViewModel.updateNomorRekening('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorRekening dengan parameter 1234567891012131');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, false);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika mengisikan nomorKtp, namaIbuKandung dan nomorRekening', () {
      logger.i('Menjalankan updateButtonStatus jika mengisikan nomorKtp namaIbuKandung dan nomorRekening');

      // atur (arrange)
      final lupaNamaPenggunaViewModel =  LupaNamaPenggunaViewModel();
      logger.i('Berhasil membuat instance lupaNamaPenggunaViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
      lupaNamaPenggunaViewModel.updateNomorKtp('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorKtp dengan parameter 1234567891012131');
      lupaNamaPenggunaViewModel.updateNamaIbuKandung('jane');
      logger.i('Berhasil menjalankan function updateNamaIbuKandung dengan parameter jane');
      lupaNamaPenggunaViewModel.updateNomorRekening('1234567891012131');
      logger.i('Berhasil menjalankan function updateNomorRekening dengan parameter 1234567891012131');

      // tegaskan (assert)
      expect(lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled, true);
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaNamaPenggunaViewModel.lupaNamaPenggunaModel.isButtonEnabled}');
    });
  });
}