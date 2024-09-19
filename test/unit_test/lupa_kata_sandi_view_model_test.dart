
import 'package:febankflutter/viewmodels/lupa_kata_sandi_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  final logger = Logger();

  group('lupaKataSandiViewModel method updateNamaPengguna', () {
    test('updateNamaPengguna', () {
      logger.i('Menjalankan updateNamaPengguna');

      // atur (arrange)
      final lupaKataSandiViewModel = LupaKataSandiViewModel();
      logger.i('Berhasil membuat instance lupaKataSandiViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel namaPengguna berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.namaPengguna}');
      lupaKataSandiViewModel.updateNamaPengguna('irvan');
      logger.i('Berhasil menjalankan function updateNamaPengguna dengan parameter irvan');

      // tegaskan (assert)
      expect(lupaKataSandiViewModel.lupaKataSandiModel.namaPengguna, 'irvan');
      logger.i('Seharusnya variabel namaPengguna berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.namaPengguna}');
      logger.i('Berhasil memverifikasi data');

    });
  });

  group('lupaKataSandiViewModel method updateTanggalLahir', () {
    test('updateTanggalLahir', () {
      logger.i('Menjalankan updateTangalLahir');

      // atur (arrange)
      final lupaKataSandiViewModel = LupaKataSandiViewModel();
      logger.i('Berhasil membuat instance lupaKataSandiViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel tanggalLahir berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.tanggalLahir}');
      lupaKataSandiViewModel.updateTanggalLahir('25-01-2024');
      logger.i('Berhasil menjalankan function updateTanggalLahir dengan parameter 25-01-2024');

      // tegaskan (assert)
      expect(lupaKataSandiViewModel.lupaKataSandiModel.tanggalLahir, '25-01-2024');
      logger.i('Seharusnya variabel tanggalLahir berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.tanggalLahir}');
      logger.i('Berhasil memverifikasi data');

    });
  });

  group('lupaKataSandiViewModel method updateButtonStatus', () {
    test('updateButtonStatus jika hanya namaPengguna yang di isikan', () {
      logger.i('Menjalankan updateButtonStatus jika hanya namaPengguna yang di isikan');

      // atur (arrange)
      final lupaKataSandiViewModel = LupaKataSandiViewModel();
      logger.i('Berhasil membuat instance lupaKataSandiViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled}');
      lupaKataSandiViewModel.updateNamaPengguna('irvan');
      logger.i('Berhasil menjalankan function updateNamaPengguna dengan parameter irvan');

      // tegaskan (assert)
      expect(lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled, false);
      logger.i('Jika hanya namaPengguna yang di isikan, maka isButtonEnabled berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled}');
    });

    test('updateButtonStatus jika hanya tanggalLahir yang di isikan', () {
      logger.i('Menjalankan updateButtonStatus jika hanya tanggalLahir yang di isikan');

      // atur (arrange)
      final lupaKataSandiViewModel = LupaKataSandiViewModel();
      logger.i('Berhasil membuat instance lupaKataSandiViewModel');

      // aksi (act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled}');
      lupaKataSandiViewModel.updateTanggalLahir('25-01-2024');
      logger.i('Berhasil menjalankan function updateTanggalLahir dengan parameter 25-01-2024');

      // tegaskan (assert)
      expect(lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled, false);
      logger.i('Jika hannya tanggalLahir yang di isikan, maka isButtonEnabled berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled}');

    });

    test('updateButtonStatus jika namaPengguna dan tanggalLahir di isikan', () {
      logger.i('Menjalankan updateButtonStatus jika namaPengguna dan tanggalLahir di isikan');

      // atur (arrange)
      final lupaKataSandiViewModel = LupaKataSandiViewModel();
      logger.i('Berhasil membuat instance lupaKataSandiViewModel');

      // aksi(act)
      logger.i('Seharusnya variabel isButtonEnabled : ${lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled}');
      lupaKataSandiViewModel.updateNamaPengguna('irvan');
      logger.i('Berhasil menjalankan function updateNamaPengguna dengan parameter irvan');
      lupaKataSandiViewModel.updateTanggalLahir('25-01-2024');
      logger.i('Berhasil menjalankan function updateTanggalLahir dengan parameter 25-01-2024');

      // tegaskan (assert)
      expect(lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled, true);
      logger.i('Jika namaPengguna dan tanggallahir di isikan maka isButtonEnabled berisikan : ${lupaKataSandiViewModel.lupaKataSandiModel.isButtonEnabled}');

    });
  });
}