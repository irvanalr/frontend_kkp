import 'dart:convert';
import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/rekening_card_simpanan_berjangka_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RekeningCardSimpananBerjangkaViewModel {
  RekeningCardSimpananBerjangkaModel rekeningCardSimpananBerjangkaModel;
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

  RekeningCardSimpananBerjangkaViewModel({required this.notifyListeners})
      : rekeningCardSimpananBerjangkaModel = RekeningCardSimpananBerjangkaModel();

  Future<void> rekeningDeposito() async {
    try {
      // Ambil nilai apiKeyToken dan token dari SharedPreferences
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.listRekeningDepositSimpananBerjangka(apiKeyToken, token, namaPengguna);
      final responseBody = jsonDecode(response.body);
      // logger.i(responseBody);
      if (responseBody['status'] == 1) {
        rekeningCardSimpananBerjangkaModel.timeStamp = responseBody['timestamp'];
        rekeningCardSimpananBerjangkaModel.status = responseBody['status'];
        rekeningCardSimpananBerjangkaModel.message = responseBody['message'];
        rekeningCardSimpananBerjangkaModel.deposits = (responseBody['deposits'] as List).map((item) {
          return Deposits(
            code: item['code'],
            productName: item['productName'],
            name: item['name'],
            bilyet: item['bilyet'],
            begin: formatDate(item['begin']),
            end: formatDate(item['end']),
            value: item['value'],
            aro: item['aro'],
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
      /// tanggal-bulan-tahun
      return '${parts[2]}-${parts[1]}-${parts[0]}';
    } else {
      return date;
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
