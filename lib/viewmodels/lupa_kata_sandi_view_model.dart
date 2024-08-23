
import 'package:febankflutter/models/lupa_kata_sandi.dart';
import 'package:flutter/material.dart';

class LupaKataSandiViewModel extends ChangeNotifier {
  final LupaKataSandiModel lupaKataSandiModel = LupaKataSandiModel();

  String get namaPengguna => lupaKataSandiModel.namaPengguna;
  String get tanggalLahir => lupaKataSandiModel.tanggalLahir;

  DateTime get firstDate => DateTime(DateTime.now().year - 60,1,1);
  DateTime get lastDate => DateTime(DateTime.now().year - 17,12,31);

  void updateNamaPengguna(String newNamaPengguna) {
    lupaKataSandiModel.namaPengguna = newNamaPengguna;
    updateButtonStatus();
    notifyListeners();
  }
  void updateTanggalLahir(String newTanggalLahir) {
    lupaKataSandiModel.tanggalLahir = newTanggalLahir;
    updateButtonStatus();
    notifyListeners();
  }

  void updateButtonStatus() {
    if(lupaKataSandiModel.namaPengguna.isNotEmpty && lupaKataSandiModel.tanggalLahir.isNotEmpty) {
      lupaKataSandiModel.isButtonEnabled = true;
    }else {
      lupaKataSandiModel.isButtonEnabled = false;
    }
  }
}