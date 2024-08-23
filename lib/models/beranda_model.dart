class BerandaModel {
  String timestamp = '';
  int status = 0;
  String message = '';
  String registration = '';
  String productName = '';
  String code = '';
  String name = '';
  String balance = '0.00';

  List<String> berandaSvgList = [
    'assets/png/transfer/antar-rekening.png',
    'assets/png/transfer/antar-koperasi.png',
    'assets/png/bayar/paket-data.png',
    'assets/png/bayar/tagihan-pln.png',
  ];
  List<String> berandaTextList = [
    'Antar\nRekening',
    'Antar\nKoperasi',
    'Paket\ndata',
    'Tagihan\nPLN',
  ];
  List<String> berandaBanner = [
    'assets/png/haji1.png',
    'assets/png/haji1.png',
    'assets/png/haji1.png',
  ];
}