import 'package:febankflutter/utils/shimmer/notifikasi/shimmer_notifikasi.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/notifikasi/responsive_notifikasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {

  Future<String> fakeAPI() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return 'Data Loaded';
  }

  @override
  Widget build(BuildContext context) {
    /// Status bar dan navigation bar warna
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    ResponsiveNotifikasi.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightAndDarkMode.primaryColor(context),
        title: Text(
          Strings.notifikasiTitle,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: ResponsiveNotifikasi.notifikasiStringTitleFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fakeAPI(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: ShimmerNotifikasi()
              );
            } else {
              return Center(
                child: Text(
                  "Tidak ada notifikasi",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: ResponsiveNotifikasi.notifikasiStringTidakAdaNotifikasiFontSize,
                          fontWeight: FontWeight.w600)),
                ),
              );
            }
          }
      )
    );
  }
}
