import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/mutasi_beranda_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MutasiBerandaViewModel {
  final MutasiBerandaModel mutasiBerandaModel;
  final LoginViewModel loginViewModel = LoginViewModel();
  ApiServices apiServices = ApiMain();
  final logger = Logger();
  Function() notifyListeners;
  final String lgnAtkn1 = dotenv.get('APITOKENSECRETKEY');
  final String lgnAtkn2 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');

  MutasiBerandaViewModel({required this.notifyListeners})
      : mutasiBerandaModel =
  MutasiBerandaModel() {
    // Inisialisasi format tanggal untuk bahasa Indonesia
    initializeDateFormatting('id_ID', null).then((_) {
      // Panggil metode listTransaksiTabungan setelah inisialisasi selesai
      getFutureForMutasi();
    });
  }

  void updateTransaksi(String newHari) {
    mutasiBerandaModel.transaksi = newHari;
    notifyListeners();
  }

  void updateSelectedTransaksi(String newHari) {
    mutasiBerandaModel.selectedTransaksi = newHari;
    notifyListeners();
  }

  void updateRadioButton(String newRadio) {
    mutasiBerandaModel.selectedRadio = newRadio;
    notifyListeners();
  }

  bool containsDate(String text) {
    final dateRegex = RegExp(r'\d{1,2}-\d{1,2}-\d{4}');
    return dateRegex.hasMatch(text);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: mutasiBerandaModel.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != mutasiBerandaModel.selectedDate) {
      mutasiBerandaModel.selectedDate = picked;
      mutasiBerandaModel.dateNow = picked;
      updateSelectedTransaksiWithDate();
      notifyListeners();
    }
  }

  void updateSelectedTransaksiWithDate() {
    if (mutasiBerandaModel.selectedDropdownItem != null &&
        mutasiBerandaModel.selectedDate != null) {
      String combinedValue =
          '${mutasiBerandaModel.selectedDropdownItem}\n${mutasiBerandaModel.selectedDate!.day}-${mutasiBerandaModel.selectedDate!.month}-${mutasiBerandaModel.selectedDate!.year}';
      updateSelectedTransaksi(combinedValue);
    }
  }
  Future<void> getTransaksi(Function(String, String, String, String) apiMethod) async {
    try {
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String code = await loginViewModel.getValue('CordovaCd0', 'value0');
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);
      // logger.i(code);

      final response = await apiMethod(apiKeyToken, token, code, namaPengguna);

      final responseBody = jsonDecode(response.body);
      // logger.i('Transaksi Biasa berhasil di eksekusi');

      if (responseBody['status'] == 1) {
        List<Transactions> transactions = (responseBody['transactions'] as List)
            .map((transaction) {
          DateTime date = DateFormat("yyyy-MM-dd").parse(transaction['date']);
          String formattedDate = DateFormat("EEEE, dd-MM-yyyy", 'id_ID').format(date);

          return Transactions(
            date: formattedDate,
            code: transaction['code'],
            description: transaction['description'],
            direction: transaction['direction'],
            value1: transaction['value1'],
            endValue1: transaction['endValue1'],
          );
        }).toList();

        mutasiBerandaModel.transactions = transactions;
        mutasiBerandaModel.timestamp = responseBody['timestamp'];
        mutasiBerandaModel.status = responseBody['status'];
        mutasiBerandaModel.message = responseBody['message'];
        mutasiBerandaModel.code = code;
      }
    } catch (e) {
      logger.i(e);
      Fluttertoast.showToast(
          msg:
          "Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


  Future<void> getTransaksiWithDate(Function(String, String, String, String, String) apiMethod) async {
    try {
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String code = await loginViewModel.getValue('CordovaCd0', 'value0');
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);
      String selectedDate =
          "${mutasiBerandaModel.dateNow.year}-${mutasiBerandaModel.dateNow.month.toString().padLeft(2, '0')}-${mutasiBerandaModel.dateNow.day.toString().padLeft(2, '0')}";
      final response = await apiMethod(apiKeyToken, token, code, selectedDate, namaPengguna);

      final responseBody = jsonDecode(response.body);
      // logger.i('Transaksi tanggal berhasil di eksekusi');
      // logger.i('tanggal = $selectedDate');

      if (responseBody['status'] == 1) {
        List<Transactions> transactions = (responseBody['transactions'] as List)
            .map((transaction) {
          DateTime date =
          DateFormat("yyyy-MM-dd").parse(transaction['date']);
          String formattedDate =
          DateFormat("EEEE, dd-MM-yyyy", 'id_ID').format(date);

          return Transactions(
            date: formattedDate,
            code: transaction['code'],
            description: transaction['description'],
            direction: transaction['direction'],
            value1: transaction['value1'],
            endValue1: transaction['endValue1'],
          );
        }).toList();

        mutasiBerandaModel.transactions = transactions;
        mutasiBerandaModel.timestamp = responseBody['timestamp'];
        mutasiBerandaModel.status = responseBody['status'];
        mutasiBerandaModel.message = responseBody['message'];
        mutasiBerandaModel.code = code;

        // debug
        // logger.i('transactions date = ${mutasiBerandaModel.transactions[0].date}');
        // logger.i('transactions code = ${mutasiBerandaModel.transactions[0].code}');
        // logger.i('transactions description = ${mutasiBerandaModel.transactions[0].description}');
        // logger.i('transactions direction = ${mutasiBerandaModel.transactions[0].direction}');
        // logger.i('transactions value1 = ${mutasiBerandaModel.transactions[0].value1}');
        // logger.i('transactions endValue1 = ${mutasiBerandaModel.transactions[0].endValue1}');
        // logger.i('timestamp = ${mutasiBerandaModel.timestamp}');
        // logger.i('status = ${mutasiBerandaModel.status}');
        // logger.i('message = ${mutasiBerandaModel.message}');
        // logger.i('name = ${mutasiBerandaModel.name}');
        // logger.i('code = ${mutasiBerandaModel.code}');
      } else {
        // Kosongkan data yang sebelumnya terisi
        mutasiBerandaModel.transactions = [];
        mutasiBerandaModel.timestamp = '';
        mutasiBerandaModel.status = null;
        mutasiBerandaModel.message = "Data Tidak di temukan";
        mutasiBerandaModel.code = '';
      }
    } catch (e) {
      logger.i(e);
      Fluttertoast.showToast(
          msg:
          "Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<void> list5TransaksiTabungan() async {
    await getTransaksi(apiServices.list5transaksiTabungan);
  }

  Future<void> list10TransaksiTabungan() async {
    await getTransaksi(apiServices.list10transaksiTabungan);
  }

  Future<void> list20TransaksiTabungan() async {
    await getTransaksi(apiServices.list20transaksiTabungan);
  }

  Future<void> list5TransaksiTabunganTanggal() async {
    await getTransaksiWithDate(apiServices.list5transaksiTabunganWithDate);
  }

  Future<void> list10TransaksiTabunganTanggal() async {
    await getTransaksiWithDate(apiServices.list10transaksiTabunganWithDate);
  }

  Future<void> list20TransaksiTabunganTanggal() async {
    await getTransaksiWithDate(apiServices.list20transaksiTabunganWithDate);
  }

  void clearMutasiBerandaModel() {
    mutasiBerandaModel.transaksi = '';
    mutasiBerandaModel.selectedTransaksi = '';
    mutasiBerandaModel.selectedRadio = '';
    mutasiBerandaModel.dropdownItems = [];
    mutasiBerandaModel.selectedDropdownItem = null;
    mutasiBerandaModel.selectedDate = null;
    mutasiBerandaModel.dateNow = DateTime.now();
    mutasiBerandaModel.transactions = [
      Transactions(
          date: '',
          code: '',
          description: '',
          direction: '',
          value1: '',
          endValue1: '')
    ];
  }

  Future<void> getFutureForMutasi() async {
    String selectedDate =
        "${mutasiBerandaModel.dateNow.day}-${mutasiBerandaModel.dateNow.month}-${mutasiBerandaModel.dateNow.year}";
    if (mutasiBerandaModel.transaksi == '5 Transaksi terakhir') {
      await list5TransaksiTabungan();
    } else if (mutasiBerandaModel.transaksi == '10 Transaksi terakhir') {
      await list10TransaksiTabungan();
    } else if (mutasiBerandaModel.transaksi == '20 Transaksi terakhir') {
      await list20TransaksiTabungan();
    } else if (mutasiBerandaModel.transaksi == '5 Transaksi\n$selectedDate') {
      await list5TransaksiTabunganTanggal();
    } else if (mutasiBerandaModel.transaksi == '10 Transaksi\n$selectedDate') {
      await list10TransaksiTabunganTanggal();
    } else if (mutasiBerandaModel.transaksi == '20 Transaksi\n$selectedDate') {
      await list20TransaksiTabunganTanggal();
    }
  }

  Future<void> informasiRekening() async {
    try {
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String code = await loginViewModel.getValue('CordovaCd0', 'value0');
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.informasiRekeningSimpanan(apiKeyToken, token, code, namaPengguna);
      final responseBody = jsonDecode(response.body);
      // logger.i(responseBody);

      if(responseBody['status'] == 1) {
        final savingMap = responseBody['saving'] as Map<String, dynamic>;
        final saving = Saving(
            companyCode: savingMap['companyCode'],
            company: savingMap['company'],
            branchCode: savingMap['branchCode'],
            branch: savingMap['branch'],
            code: savingMap['code'],
            registration: savingMap['registration'],
            productName: savingMap['productName'],
            productScheme: savingMap['productScheme'],
            name: savingMap['name']
        );
        mutasiBerandaModel.savings = [saving];
        mutasiBerandaModel.timestampInformasiRekening = responseBody['timestamp'];
        mutasiBerandaModel.statusInformasiRekening = responseBody['status'];
        mutasiBerandaModel.messageInformasiRekening = responseBody['message'];
        // logger.i('informasiRekening saving name : ${mutasiBerandaModel.savings[0].name}');
        // logger.i('informasiRekening saving productScheme : ${mutasiBerandaModel.savings[0].productScheme}');
      } else {
        throw Exception('Informasi rekening failed to load');
      }

    } catch(e) {
      logger.i(e);
      Fluttertoast.showToast(
          msg:
          "Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
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