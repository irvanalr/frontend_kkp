import 'package:febankflutter/ui/lupa_nama_pengguna_atau_katasandi/custom_radio_button.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/lupa_nama_pengguna_atau_katasandi/shimmer_lupa_nama_penggun_dan_katasandi.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/lupa_nama_penguna_dan_kata_sandi/responsive_lupa_nama_pengguna_dan_kata_sandi.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class LupaNamaPenggunaAtauKataSandi extends StatefulWidget {
  const LupaNamaPenggunaAtauKataSandi({super.key});

  @override
  State<LupaNamaPenggunaAtauKataSandi> createState() => _LupaNamaPenggunaAtauKataSandiState();
}

class _LupaNamaPenggunaAtauKataSandiState extends State<LupaNamaPenggunaAtauKataSandi> {
  late LoginViewModel loginViewModel;

  Future<String> fakeAPI() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return 'Data Loaded';
  }

  @override
  void initState() {
    super.initState();
    loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    /// Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    String text = Strings.loginLupaNamaPenggunaAtauKataSandiString
        .replaceAll('\n', '')
        .replaceAll('?', '')
        .replaceAll('Lupa', 'Pilih');

    ResponsiveLupaNamaPenggunaDanKataSandi.init(context);
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.login,
            arguments: loginViewModel,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LightAndDarkMode.primaryColor(context),
          leading: IconButton(
              key: const Key('panahKembaliKeLogin'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutePaths.login, arguments: loginViewModel);
              },
              icon: const Icon(
                size: 22,
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            Strings.loginLupaNamaPenggunaAtauKataSandiString,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.lupaNamaPenggunaDanKataSandiTitleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white
              )
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: fakeAPI(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerLupaNamaPenggunaDanKataSandi();
              }else{
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Text(
                          text,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.lupaNamaPenggunaDanKataSandiStringHeadFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: LightAndDarkMode.teksRead2(context)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Text('$text sesuai dengan\nkebutuhan anda',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveLupaNamaPenggunaDanKataSandi.lupaNamaPenggunaDanKataSandiStringSubJudulFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: LightAndDarkMode.teksRead(context)
                                )
                            )
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveLupaNamaPenggunaDanKataSandi.lupaNamaPenggunaDanKataSandiSizedBoxHeight,
                      ),
                      const Center(
                        child: CustomRadioButton(
                          radioButtonNamaPengguna: Key('radioButtonNamaPengguna'),
                          radioButtonInkWellNamaPengguna: Key('radioButtonInkWellNamaPengguna'),
                          radioButtonKataSandi: Key('radioButtonKataSandi'),
                          radioButtonInkWellKataSandi: Key('radioButtonInkWellKataSandi'),
                          buttonLanjutkan: Key('buttonLanjutkanLupaNamaPenggunAtauKataSandi'),
                        ),
                      )
                    ],
                  ),
                );
              }
            }
        )
      ),
    );
  }
}
