import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/rekening_card_simpanan_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RekeningCardSimpananViewModel {
  RekeningCardSimpananModel rekeningCardSimpananModel;
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

  RekeningCardSimpananViewModel({required this.notifyListeners}) : rekeningCardSimpananModel = RekeningCardSimpananModel();

  Future<void> listTabunganSimpanan() async {
    try {
      // Ambil nilai apiKeyToken dan token dari SharedPreferences
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.listTabunganSimpanan(apiKeyToken, token, namaPengguna);
      final responseBody = jsonDecode(response.body);
      if (responseBody['status'] == 1) {
        rekeningCardSimpananModel.timestamp = responseBody['timestamp'];
        rekeningCardSimpananModel.status = responseBody['status'];
        rekeningCardSimpananModel.message = responseBody['message'];
        rekeningCardSimpananModel.savings = (responseBody['savings'] as List).map((item) {
          return Saving(
            code: item['code'],
            name: item['name'],
            balance: item['balance'],
            productName: item['productName'],
          );
        }).toList();
        await saveSavingsToSharedPreferences(rekeningCardSimpananModel.savings);
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      logger.i(e);
    }
  }

  Future<void> saveSavingsToSharedPreferences(List<Saving> savings) async {
    try {
      for (int i = 0; i < savings.length; i++) {
        // Simpan JSON string ke SharedPreferences dengan kunci unik berdasarkan kode
        await loginViewModel.saveValue(savings[i].code, 'Saving', 'CordovaCd$i', 'value$i');
      }
    } catch (e) {
      logger.e('Error saving savings to SharedPreferences: $e');
      throw Exception('Failed to save savings to SharedPreferences');
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
