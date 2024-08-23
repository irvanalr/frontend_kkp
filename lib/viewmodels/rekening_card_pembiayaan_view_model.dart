import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/rekening_card_pembiayaan.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RekeningCardPembiayaanViewModel {
  RekeningCardPembiayaanModel rekeningCardPembiayaanModel;
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

  RekeningCardPembiayaanViewModel({required this.notifyListeners})
    : rekeningCardPembiayaanModel = RekeningCardPembiayaanModel();

  Future<void> rekeningPembiayaan() async {
    try {
      // Ambil nilai apiKeyToken dan token dari SharedPreferences
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.listRekeningPembiayaan(apiKeyToken, token, namaPengguna);
      final responseBody = jsonDecode(response.body);

      if(responseBody['status'] == 1) {
        rekeningCardPembiayaanModel.timeStamp = responseBody['timestamp'];
        rekeningCardPembiayaanModel.status = responseBody['status'];
        rekeningCardPembiayaanModel.message = responseBody['message'];
        rekeningCardPembiayaanModel.loans = (responseBody['loans'] as List).map((item) {
          return Loans(
              code: item['code'],
              name: item['name'],
              contract: item['contract'],
              principal: item['principal'],
              margin: item['margin'],
              rate: item['rate'],
              tenor: item['tenor'],
              contractDate: formatDate(item['contractDate']),
              productName: item['productName'],
              tenorType: item['tenorType'],
              tenorName: item['tenorName']
          );
        }).toList();
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      logger.i(e);
    }
  }

  String formatDate(String date) {
    List<String> parts = date.split('-');
    if (parts.length == 3) {
      return '${parts[2]}-${parts[1]}-${parts[0]}';
    } else {
      return date; // Return the original date if it doesn't match the expected format
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