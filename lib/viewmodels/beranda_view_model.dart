import 'dart:convert';

import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/beranda_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BerandaViewModel {
  BerandaModel berandaModel;
  final LoginViewModel loginViewModel = LoginViewModel();
  ApiServices apiServices = ApiMain();
  Function() notifyListeners;
  final logger = Logger();
  final String lgnAtkn1 = dotenv.get('APITOKENSECRETKEY');
  final String lgnAtkn2 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');

  BerandaViewModel({required this.notifyListeners}) : berandaModel = BerandaModel();

  Future<void> berandaCardInformasiRekeningUtama() async {
    try {
      String getApiKey = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.rekeningUtama(getApiKey, token, namaPengguna);
      var responseBody = jsonDecode(response.body);

      if (responseBody['status'] == 1) {
        berandaModel.timestamp = responseBody['timestamp'];
        berandaModel.status = responseBody['status'];
        berandaModel.message = responseBody['message'];
        berandaModel.registration = responseBody['registration'];
        berandaModel.productName = responseBody['productName'];
        berandaModel.code = responseBody['code'];
        berandaModel.name = responseBody['name'];
        berandaModel.balance = responseBody['balance'];
        await loginViewModel.saveValue(berandaModel.code, 'Saving', 'CordovaCd0', 'value0');
      } else {
        berandaModel.timestamp = responseBody['timestamp'];
        berandaModel.status = responseBody['status'];
        berandaModel.message = responseBody['message'];
        Fluttertoast.showToast(
          msg: 'Maaf server kami sedang dalam kendala, mohon tutup aplikasi anda dan coba lagi di lain waktu!!!',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      logger.i(e);
    }
  }

  String formatValuetoRupiah(double? valueDouble) {
    if (valueDouble == null) {
      return '0';
    }
    try {
      List<String> parts = valueDouble.toString().split('.');
      var valueStr = parts[0].split('').reversed.join('');
      var valueFormatted = '';
      for (var i = 0; i < valueStr.length; i++) {
        if (i % 3 == 0 && i != 0) {
          valueFormatted += '.';
        }
        valueFormatted += valueStr[i];
      }
      valueFormatted = valueFormatted.split('').reversed.join('');
      if (parts.length > 1) {
        valueFormatted += ',${parts[1]}';
      }

      return valueFormatted;
    } catch (e) {
      return '0';
    }
  }
}
