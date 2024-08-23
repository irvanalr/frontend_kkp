import 'package:febankflutter/models/lupa_nama_pengguna_model.dart';
import 'package:flutter/material.dart';

class LupaNamaPenggunaViewModel extends ChangeNotifier {
  final LupaNamaPenggunaModel lupaNamaPenggunaModel = LupaNamaPenggunaModel();

  String get nomorKtp => lupaNamaPenggunaModel.nomorKtp;
  String get namaIbuKandung => lupaNamaPenggunaModel.namaIbuKandung;
  String get nomorRekening => lupaNamaPenggunaModel.nomorRekening;

  void updateNomorKtp(String newNomorKtp) {
    lupaNamaPenggunaModel.nomorKtp = newNomorKtp;
    updateButtonStatus();
    notifyListeners();
  }

  void updateNamaIbuKandung(String newNamaIbuKandung) {
    lupaNamaPenggunaModel.namaIbuKandung = newNamaIbuKandung;
    updateButtonStatus();
    notifyListeners();
  }

  void updateNomorRekening(String newNomorRekening) {
    lupaNamaPenggunaModel.nomorRekening = newNomorRekening;
    updateButtonStatus();
    notifyListeners();
  }

  void updateButtonStatus() {
    if(lupaNamaPenggunaModel.nomorKtp.length >= 16 && lupaNamaPenggunaModel.namaIbuKandung.isNotEmpty && lupaNamaPenggunaModel.nomorRekening.length >= 16) {
      lupaNamaPenggunaModel.isButtonEnabled = true;
    }else {
      lupaNamaPenggunaModel.isButtonEnabled = false;
    }
  }
}
