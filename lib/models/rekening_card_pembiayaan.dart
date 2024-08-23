class RekeningCardPembiayaanModel {
  String timeStamp = '';
  int status = 404;
  String message = '';
  List<Loans> loans = [];
}

class Loans {
  String code;
  String name;
  String contract;
  String principal;
  String margin;
  int rate;
  int tenor;
  String contractDate;
  String productName;
  int tenorType;
  String tenorName;

  Loans({
    required this.code,
    required this.name,
    required this.contract,
    required this.principal,
    required this.margin,
    required this.rate,
    required this.tenor,
    required this.contractDate,
    required this.productName,
    required this.tenorType,
    required this.tenorName
  });
}