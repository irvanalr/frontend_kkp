class MutasiBerandaModel {
  // ui
  String transaksi = '5 Transaksi terakhir';
  String selectedTransaksi = '5 Transaksi terakhir';
  String selectedRadio = '';
  String code = '';
  List<String> dropdownItems = [
    '5 Transaksi',
    '10 Transaksi',
    '20 Transaksi'
  ];
  String? selectedDropdownItem;
  DateTime? selectedDate;
  DateTime dateNow = DateTime.now();

  // database
  String timestamp = '';
  int? status = 404;
  String message = '';
  List<Transactions> transactions = [];

  // informasiRekening
  String timestampInformasiRekening = '';
  int? statusInformasiRekening = 404;
  String messageInformasiRekening = '';
  List<Saving> savings = [];
}

class Transactions {
  String date;
  String code;
  String description;
  String direction;
  String value1;
  String endValue1;

  Transactions({
    required this.date,
    required this.code,
    required this.description,
    required this.direction,
    required this.value1,
    required this.endValue1
  });
}

class Saving {
  String companyCode;
  String company;
  String branchCode;
  String branch;
  String code;
  String registration;
  String productName;
  String productScheme;
  String name;

  Saving({
    required this.companyCode,
    required this.company,
    required this.branchCode,
    required this.branch,
    required this.code,
    required this.registration,
    required this.productName,
    required this.productScheme,
    required this.name
  });
}
