import 'package:febankflutter/ui/lupa_nama_pengguna_atau_katasandi/lupa_kata_sandi/custom_textfield_kata_sandi.dart';
import 'package:febankflutter/utils/shimmer/lupa_nama_pengguna_atau_katasandi/lupa_kata_sandi/shimmer_lupa_katasandi.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/lupa_nama_penguna_dan_kata_sandi/responsive_lupa_kata_sandi.dart';
import 'package:febankflutter/viewmodels/lupa_kata_sandi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class KataSandi extends StatefulWidget {
  const KataSandi({super.key});
  
  @override
  State<KataSandi> createState() => _KataSandiState();
}

class _KataSandiState extends State<KataSandi> {
  late TextEditingController namaPenggunaController;
  late TextEditingController tanggalLahirController;
  late LupaKataSandiViewModel lupaKataSandiViewModel;
  final namaPenggunaFocus = FocusNode();
  final tanggalLahirFocus = FocusNode();
  Future<String>? _future;

  Future<String> fakeAPI() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return 'Data Loaded';
  }

  @override 
  void initState() {
    super.initState();

    lupaKataSandiViewModel = LupaKataSandiViewModel();

    namaPenggunaController = TextEditingController(text: lupaKataSandiViewModel.namaPengguna)
    ..addListener(() {
      lupaKataSandiViewModel.updateNamaPengguna(namaPenggunaController.text);
    });

    tanggalLahirController = TextEditingController(text: lupaKataSandiViewModel.tanggalLahir)
    ..addListener(() {
      lupaKataSandiViewModel.updateTanggalLahir(tanggalLahirController.text);
    });

    _future = fakeAPI();
  }

  @override
  void dispose() {
    namaPenggunaController.dispose();
    tanggalLahirController.dispose();
    namaPenggunaFocus.dispose();
    tanggalLahirFocus.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    /// Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    ResponsiveLupaKataSandi.init(context);
    return PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            Navigator.of(context).pop();
            namaPenggunaController.text = '';
            tanggalLahirController.text = '';
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
                  key: const Key("panahKembaliKeLupaNamaPenggunAtauKataSandi"),
                  onPressed: () {
                    // Mengarahkan ke LupaNamaPenggunAtauPassword dan menghapus LupaNamaPengguna dari tumpukan
                    Navigator.of(context).pop();
                    namaPenggunaController.text = '';
                    tanggalLahirController.text = '';
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.white,
                  )),
              title: Text(
                Strings.lupaKataSandiTitle,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ResponsiveLupaKataSandi.lupaKataSandiTitleFontSize,
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
                  return const ShimmerLupaKataSandi();
                }else{
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10),
                          child: Text(
                            Strings.lupaNamaPenggunaDataAkun,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveLupaKataSandi.lupaKataSandiStringDataAkunFontSize,
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
                                    fontSize: ResponsiveLupaKataSandi.lupaKataSandiStringPastikanDataFontSize,
                                    fontWeight: FontWeight.normal,
                                    color: LightAndDarkMode.teksRead(context)
                                )
                            ),
                          ),
                        ),
                        CustomTextFieldKataSandi(
                            viewModel: lupaKataSandiViewModel,
                            namaPenggunaController: namaPenggunaController,
                            tanggalLahirController: tanggalLahirController,
                            namaPenggunaFocus: namaPenggunaFocus,
                            tanggalLahirFocus: tanggalLahirFocus,
                            keyNamaPengguna: const Key('textFieldNamaPengguna'),
                            keyTanggalLahir: const Key('textFieldTanggalLahir'),
                            keyButtonLanjutkanLupaKataSandi: const Key('buttonLanjutkanLupaKataSandi'),
                            keyAlertOk: const Key('buttonOkAlert'),
                        )
                      ],
                    ),
                  );
                }
              }
          )
        ),
      )
    );
  }
}