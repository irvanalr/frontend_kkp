import 'package:febankflutter/ui/lupa_nama_pengguna_atau_katasandi/lupa_nama_pengguna/custom_texfield_nama_pengguna.dart';
import 'package:febankflutter/utils/shimmer/lupa_nama_pengguna_atau_katasandi/lupa_nama_pengguna/shimmer_lupa_nama_pengguna.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/lupa_nama_penguna_dan_kata_sandi/responsive_lupa_nama_pengguna.dart';
import 'package:febankflutter/viewmodels/lupa_nama_pengguna_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class NamaPengguna extends StatefulWidget {
  const NamaPengguna({super.key});

  @override 
  State<NamaPengguna> createState() => _NamaPenggunaState();
}

class _NamaPenggunaState extends State<NamaPengguna> {
  late TextEditingController nomorKtpController;
  late TextEditingController namaIbuKandungController;
  late TextEditingController nomorRekeningController;
  late LupaNamaPenggunaViewModel lupaNamaPenggunaViewModel;
  final nomorKtpFocus = FocusNode();
  final namaIbuKandungFocus = FocusNode();
  final nomorRekeningFocus = FocusNode();
  Future<String>? _future;

  Future<String> fakeAPI() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return 'Data Loaded';
  }

  @override
  void initState() {
    super.initState();

    lupaNamaPenggunaViewModel = LupaNamaPenggunaViewModel();

    nomorKtpController = TextEditingController(text: lupaNamaPenggunaViewModel.nomorKtp)
    ..addListener(() {
      lupaNamaPenggunaViewModel.updateNomorKtp(nomorKtpController.text);
    });

    namaIbuKandungController = TextEditingController(text: lupaNamaPenggunaViewModel.namaIbuKandung)
    ..addListener(() {
      lupaNamaPenggunaViewModel.updateNamaIbuKandung(namaIbuKandungController.text);
    });

    nomorRekeningController = TextEditingController(text: lupaNamaPenggunaViewModel.nomorRekening)
    ..addListener(() {
      lupaNamaPenggunaViewModel.updateNomorRekening(nomorRekeningController.text);
    });

    _future = fakeAPI();
  }

  @override
  void dispose() {
    super.dispose();
    nomorKtpController.dispose();
    namaIbuKandungController.dispose();
    nomorRekeningController.dispose();
    nomorKtpFocus.dispose();
    namaIbuKandungFocus.dispose();
    nomorRekeningFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLupaNamaPengguna.init(context);
    return PopScope<Object?>(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            Navigator.of(context).pop();
            nomorKtpController.text = '';
            namaIbuKandungController.text = '';
            nomorRekeningController.text = '';
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: LightAndDarkMode.primaryColor(context),
              leading: IconButton(
                  key: const Key('panahKembaliKeLupaNamaPenggunAtauKataSandi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    nomorKtpController.text = '';
                    namaIbuKandungController.text = '';
                    nomorRekeningController.text = '';
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.white,
                  )),
              title: Text(
                Strings.lupaNamaPenggunaTitle,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaNamaPengguna.lupaNamaPenggunaTitleFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  )
                ),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const ShimmerLupaNamaPengguna();
                  }else if(snapshot.hasError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                        Fluttertoast.showToast(
                            msg:"Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                      return Container();
                  }else{
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 10,),
                            child: Text(
                              Strings.lupaNamaPenggunaDataAkun,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveLupaNamaPengguna.lupaNamaPenggunaStringDataAkunFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 10),
                            child: Text(
                              Strings.lupaNamaPenggunaPastikanData,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveLupaNamaPengguna.lupaNamaPenggunaStringPastikanDataFontSize,
                                      fontWeight: FontWeight.normal,
                                      color: LightAndDarkMode.teksRead(context))),
                            ),
                          ),
                          CustomTextFieldNamaPengguna(
                            viewModel: lupaNamaPenggunaViewModel,
                            nomorKtpController: nomorKtpController,
                            namaIbuKandungController: namaIbuKandungController,
                            nomorRekeningController: nomorRekeningController,
                            nomorKtpFocus: nomorKtpFocus,
                            namaIbuKandungFocus: namaIbuKandungFocus,
                            nomorRekeningFocus: nomorRekeningFocus,
                            keyNomorKtp: const Key('textFieldNomorKtp'),
                            keyNamaIbuKandung: const Key('textFieldNamaIbuKandung'),
                            keyNomorRekeningBank: const Key('textFieldNomorRekeningBank'),
                            keyButtonLupaNamaPenggunaLanjutkan: const Key('buttonLanjutkanLupaNamaPengguna'),
                            keyAlertOk: const Key('buttonOkAlert'),
                          )
                        ],
                      ),
                    );
                  }
                }
            )

          ),
        ));
  }
}