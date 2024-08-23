import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_simpanan_wajib.dart';
import 'package:febankflutter/utils/shimmer/informasi_rekening/shimmer_informasi_rekening.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_simpanan_wajib_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class MutasiRekeningSimpananWajibRekening extends StatefulWidget {
  final MutasiRekeningSimpananWajibViewModel mutasiRekeningSimpananWajibViewModel;
  const MutasiRekeningSimpananWajibRekening({
    super.key,
    required this.mutasiRekeningSimpananWajibViewModel,
  });

  @override
  State<MutasiRekeningSimpananWajibRekening> createState() => _MutasiRekeningSimpananWajibRekeningState();
}

class _MutasiRekeningSimpananWajibRekeningState extends State<MutasiRekeningSimpananWajibRekening> {
  final logger = Logger();

  // Future<void> fakeApi() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   logger.i('Data sudah di-load');
  // }

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiRekeningSimpananWajib.init(context);
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LightAndDarkMode.primaryColor(context),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 21,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            Strings.rekeningInformasiRekening,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: ResponsiveMutasiRekeningSimpananWajib.mutasiRekeningSimpananWajibTitleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: buildCardRekening(),
      ),
    );
  }

  Widget buildCardRekening() {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 1500),
            () => widget.mutasiRekeningSimpananWajibViewModel.informasiRekening(),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerInformasiRekening();
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Fluttertoast.showToast(
              msg:
              "Maaf server kami sedang dalam kendala, mohon tutup aplikasi anda dan coba lagi di lain waktu!!!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          });
          return _buildInformasiRekeningCard();
        } else {
          return _buildInformasiRekeningCard();
        }
      },
    );
  }

  Widget _buildInformasiRekeningCard() {
    final savings = widget.mutasiRekeningSimpananWajibViewModel.mutasiRekeningSimpananWajibModel.savings;

    if (savings.isEmpty) {
      return Center(
        child: Text(
          'Data tidak tersedia',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: LightAndDarkMode.teksRead2(context),
            ),
          ),
        ),
      );
    }

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Image.asset(
              'assets/png/bmtdigi.png',
              scale: 4,
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: LightAndDarkMode.teksRead2(context), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: double.infinity,
                    color: LightAndDarkMode.teksRead2(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No. Rekening",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: LightAndDarkMode.teksRead2(context),
                            ),
                          ),
                        ),
                        Text(
                          "${savings[0].productName} ( ${savings[0].productScheme} )",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: LightAndDarkMode.teksRead2(context),
                            ),
                          ),
                        ),
                        Text(
                          'Terdaftar : ${savings[0].registration}',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: LightAndDarkMode.teksRead2(context),
                            ),
                          ),
                        ),
                        Text(
                          savings[0].name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: LightAndDarkMode.teksRead2(context),
                            ),
                          ),
                        ),
                        Text(
                          savings[0].code,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: LightAndDarkMode.teksRead2(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}