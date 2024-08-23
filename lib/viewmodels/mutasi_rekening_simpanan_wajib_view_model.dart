import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/mutasi_rekening_simpanan_wajib_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MutasiRekeningSimpananWajibViewModel {
  final MutasiRekeningSimpananWajibModel mutasiRekeningSimpananWajibModel;
  ApiServices apiServices = ApiMain();
  final LoginViewModel loginViewModel = LoginViewModel();
  final logger = Logger();
  Function() notifyListeners;
  final String lgnAtkn1 = dotenv.get('APITOKENSECRETKEY');
  final String lgnAtkn2 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');

  MutasiRekeningSimpananWajibViewModel({required this.notifyListeners})
      : mutasiRekeningSimpananWajibModel =
  MutasiRekeningSimpananWajibModel() {
    // Inisialisasi format tanggal untuk bahasa Indonesia
    initializeDateFormatting('id_ID', null).then((_) {
      // Panggil metode listTransaksiTabungan setelah inisialisasi selesai
      getFutureForTransaksi();
    });
  }

  void updateTransaksi(String newHari) {
    mutasiRekeningSimpananWajibModel.transaksi = newHari;
    notifyListeners();
  }

  void updateSelectedTransaksi(String newHari) {
    mutasiRekeningSimpananWajibModel.selectedTransaksi = newHari;
    notifyListeners();
  }

  void updateRadioButton(String newRadio) {
    mutasiRekeningSimpananWajibModel.selectedRadio = newRadio;
    notifyListeners();
  }

  bool containsDate(String text) {
    final dateRegex = RegExp(r'\d{1,2}-\d{1,2}-\d{4}');
    return dateRegex.hasMatch(text);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: mutasiRekeningSimpananWajibModel.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != mutasiRekeningSimpananWajibModel.selectedDate) {
      mutasiRekeningSimpananWajibModel.selectedDate = picked;
      mutasiRekeningSimpananWajibModel.dateNow = picked;
      updateSelectedTransaksiWithDate();
      notifyListeners();
    }
  }

  void updateSelectedTransaksiWithDate() {
    if (mutasiRekeningSimpananWajibModel.selectedDropdownItem != null &&
        mutasiRekeningSimpananWajibModel.selectedDate != null) {
      String combinedValue =
          '${mutasiRekeningSimpananWajibModel.selectedDropdownItem}\n${mutasiRekeningSimpananWajibModel.selectedDate!.day}-${mutasiRekeningSimpananWajibModel.selectedDate!.month}-${mutasiRekeningSimpananWajibModel.selectedDate!.year}';
      updateSelectedTransaksi(combinedValue);
    }
  }

  Future<void> getTransaksi(Function(String, String, String, String) apiMethod) async {
    try {
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String code = await loginViewModel.getValue('CordovaCd2', 'value2');
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiMethod(apiKeyToken, token, code, namaPengguna);
      final responseBody = jsonDecode(response.body);
      // logger.i('Transaksi Biasa berhasil di eksekusi');

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

        mutasiRekeningSimpananWajibModel.transactions = transactions;
        mutasiRekeningSimpananWajibModel.timestamp = responseBody['timestamp'];
        mutasiRekeningSimpananWajibModel.status = responseBody['status'];
        mutasiRekeningSimpananWajibModel.message = responseBody['message'];
        mutasiRekeningSimpananWajibModel.code = code;
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
      String code = await loginViewModel.getValue('CordovaCd2', 'value2');
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);
      String selectedDate =
          "${mutasiRekeningSimpananWajibModel.dateNow.year}-${mutasiRekeningSimpananWajibModel.dateNow.month.toString().padLeft(2, '0')}-${mutasiRekeningSimpananWajibModel.dateNow.day.toString().padLeft(2, '0')}";

      final response = await apiMethod(apiKeyToken, token, code, selectedDate, namaPengguna);
      final responseBody = jsonDecode(response.body);
      // logger.i('Transaksi tanggal berhasil di eksekusi');
      // logger.i('tanggal = $selectedDate');
      // logger.i(responseBody);

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

        mutasiRekeningSimpananWajibModel.transactions = transactions;
        mutasiRekeningSimpananWajibModel.timestamp = responseBody['timestamp'];
        mutasiRekeningSimpananWajibModel.status = responseBody['status'];
        mutasiRekeningSimpananWajibModel.message = responseBody['message'];
        mutasiRekeningSimpananWajibModel.code = code;
      } else {
        // Kosongkan data yang sebelumnya terisi
        mutasiRekeningSimpananWajibModel.transactions = [];
        mutasiRekeningSimpananWajibModel.timestamp = '';
        mutasiRekeningSimpananWajibModel.status = null;
        mutasiRekeningSimpananWajibModel.message = "Data Tidak di temukan";
        mutasiRekeningSimpananWajibModel.code = '';
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
    mutasiRekeningSimpananWajibModel.transaksi = '';
    mutasiRekeningSimpananWajibModel.selectedTransaksi = '';
    mutasiRekeningSimpananWajibModel.selectedRadio = '';
    mutasiRekeningSimpananWajibModel.dropdownItems = [];
    mutasiRekeningSimpananWajibModel.selectedDropdownItem = null;
    mutasiRekeningSimpananWajibModel.selectedDate = null;
    mutasiRekeningSimpananWajibModel.dateNow = DateTime.now();
    mutasiRekeningSimpananWajibModel.transactions = [
      Transactions(
          date: '',
          code: '',
          description: '',
          direction: '',
          value1: '',
          endValue1: '')
    ];
  }

  Future<void> getFutureForTransaksi() async {
    String selectedDate =
        "${mutasiRekeningSimpananWajibModel.dateNow.day}-${mutasiRekeningSimpananWajibModel.dateNow.month}-${mutasiRekeningSimpananWajibModel.dateNow.year}";
    // logger.i(selectedDate);
    // logger.i(mutasiRekeningSimpananWajibModel.transaksi);
    if (mutasiRekeningSimpananWajibModel.transaksi == '5 Transaksi terakhir') {
      await list5TransaksiTabungan();
    } else if (mutasiRekeningSimpananWajibModel.transaksi == '10 Transaksi terakhir') {
      await list10TransaksiTabungan();
    } else if (mutasiRekeningSimpananWajibModel.transaksi == '20 Transaksi terakhir') {
      await list20TransaksiTabungan();
    } else if (mutasiRekeningSimpananWajibModel.transaksi == '5 Transaksi\n$selectedDate') {
      await list5TransaksiTabunganTanggal();
    } else if (mutasiRekeningSimpananWajibModel.transaksi == '10 Transaksi\n$selectedDate') {
      await list10TransaksiTabunganTanggal();
    } else if (mutasiRekeningSimpananWajibModel.transaksi == '20 Transaksi\n$selectedDate') {
      await list20TransaksiTabunganTanggal();
    }
  }

  Future<void> informasiRekening() async {
    try {
      String apiKeyToken = await loginViewModel.getValue(lgnAtkn1, lgnAtkn2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String code = await loginViewModel.getValue('CordovaCd2', 'value2');
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
        mutasiRekeningSimpananWajibModel.savings = [saving];
        mutasiRekeningSimpananWajibModel.timestampInformasiRekening = responseBody['timestamp'];
        mutasiRekeningSimpananWajibModel.statusInformasiRekening = responseBody['status'];
        mutasiRekeningSimpananWajibModel.messageInformasiRekening = responseBody['message'];
        // logger.i('informasiRekening saving name : ${mutasiRekeningSimpananWajibModel.savings[0].name}');
        // logger.i('informasiRekening saving productScheme : ${mutasiRekeningSimpananWajibModel.savings[0].productScheme}');
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