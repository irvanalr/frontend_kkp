class RekeningCardSimpananBerjangkaModel {
  String timeStamp = '';
  int status = 404;
  String message = '';
  List<Deposits> deposits = [];
}

class Deposits {
  String code;
  String productName;
  String name;
  String bilyet;
  String begin;
  String end;
  String value;
  int aro;

  Deposits({
    required this.code,
    required this.productName,
    required this.name,
    required this.bilyet,
    required this.begin,
    required this.end,
    required this.value,
    required this.aro,
  });
}