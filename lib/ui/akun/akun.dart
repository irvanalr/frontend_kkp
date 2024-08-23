import 'package:febankflutter/ui/akun/ganti/card_ganti.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/akun/shimmer_akun.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/akun/bantuan/card_bantuan.dart';
import 'package:febankflutter/ui/akun/informasi/card_informasi.dart';
import 'package:febankflutter/ui/akun/pengaturan/card_pengaturan.dart';
import 'package:febankflutter/utils/responsive/akun/responsive_akun.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/viewmodels/akun_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  late final AkunViewModel akunViewModel;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    akunViewModel = AkunViewModel();
  }

  Future<void> fakeApi() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    logger.i('Data sudah di-load');
  }

  @override
  Widget build(BuildContext context) {
    /// Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    ResponsiveAkun.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightAndDarkMode.primaryColor(context),
        title: Text(
          Strings.akunTitle,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: ResponsiveAkun.akunStringTitleFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 1500), () => akunViewModel.informasiDataPengguna()),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerAkun();
            } else if (snapshot.hasError) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, RoutePaths.akunProfile);
                          },
                          child: SizedBox(
                            width: ResponsiveAkun.akunSizedBoxedCircleShapeWidth,
                            height: ResponsiveAkun.akunSizedBoxedCircleShapeHeight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                    akunViewModel.akunModel.users[0].name.substring(0, 2),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: ResponsiveAkun.akunStringInitialNameFontSize,
                                          color: const Color(0xFF2B7ECA),
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, RoutePaths.akunProfile);
                        },
                        child: Column(
                          children: [
                            Text(
                              akunViewModel.akunModel.users[0].name,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveAkun.akunStringAllTextAfterShapeFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                            Text(
                              'Terdaftar: ${akunViewModel.akunModel.users[0].registration}',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveAkun.akunStringAllTextAfterShapeFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                            Text(
                              akunViewModel.akunModel.users[0].code,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveAkun.akunStringAllTextAfterShapeFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Column(
                        children: [
                          CardGanti(),
                          CardPengaturan(),
                          CardBantuan(),
                          CardInformasiAkun(),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, RoutePaths.akunProfile);
                          },
                          child: SizedBox(
                            width: ResponsiveAkun.akunSizedBoxedCircleShapeWidth,
                            height: ResponsiveAkun.akunSizedBoxedCircleShapeHeight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                    akunViewModel.akunModel.users[0].name.substring(0, 2),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: ResponsiveAkun.akunStringInitialNameFontSize,
                                          color: const Color(0xFF2B7ECA),
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, RoutePaths.akunProfile);
                        },
                        child: Column(
                          children: [
                            Text(
                              akunViewModel.akunModel.users[0].name,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveAkun.akunStringAllTextAfterShapeFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                            Text(
                              'Terdaftar: ${akunViewModel.akunModel.users[0].registration}',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveAkun.akunStringAllTextAfterShapeFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                            Text(
                              akunViewModel.akunModel.users[0].code,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: ResponsiveAkun.akunStringAllTextAfterShapeFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: LightAndDarkMode.teksRead2(context)
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Column(
                        children: [
                          CardGanti(),
                          CardPengaturan(),
                          CardBantuan(),
                          CardInformasiAkun(),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          }
      )
    );
  }
}
