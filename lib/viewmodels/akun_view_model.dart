import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/akun_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AkunViewModel extends ChangeNotifier {
  final AkunModel akunModel;
  final LoginViewModel loginViewModel = LoginViewModel();
  ApiServices apiServices = ApiMain();
  final logger = Logger();
  final String lgnAtkn1 = dotenv.get('APITOKENSECRETKEY');
  final String lgnAtkn2 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');

  AkunViewModel() : akunModel = AkunModel();

  Future<void> informasiDataPengguna() async {
    try {
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.informasiUsers(apiKeyToken, token, namaPengguna);
      var responseBody = jsonDecode(response.body);

      if(responseBody['status'] == 1) {
        akunModel.timestamp = responseBody['timestamp'];
        akunModel.status = responseBody['status'];
        akunModel.message = responseBody['message'];

        var userData = responseBody['user'];
        User user = User(
          companyCode: userData['companyCode'],
          company: userData['company'],
          branch: userData['branch'],
          code: userData['code'],
          name: userData['name'],
          registration: userData['registration'],
          handphone: userData['handphone'],
          email: userData['email'],
          gender: userData['gender'],
          dob: userData['dob'],
          address: userData['address'],
          city: userData['city'],
          postCode: userData['postcode'],
        );

        akunModel.users = [user];
        notifyListeners();
      } else {
        akunModel.timestamp = responseBody['timestamp'];
        akunModel.status = responseBody['status'];
        akunModel.message = responseBody['message'];
        Fluttertoast.showToast(
          msg: "Maaf server kami sedang dalam kendala, mohon tutup aplikasi anda dan coba lagi di lain waktu!!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      logger.i(e);
    }
  }
}
