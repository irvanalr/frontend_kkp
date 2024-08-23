import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/layanan/shimmer_layanan.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/layanan/card_bayar/card_bayar.dart';
import 'package:febankflutter/ui/layanan/card_transfer/card_transfer.dart';
import 'package:febankflutter/utils/responsive/layanan/responsive_layanan.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Layanan extends StatefulWidget {
  const Layanan({super.key});

  @override
  State<Layanan> createState() => _LayananState();
}

class _LayananState extends State<Layanan> {
  final LoginViewModel loginViewModel = LoginViewModel();

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
    ResponsiveLayanan.init(context);
    return PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.navigationBarCustome,
              arguments: loginViewModel.loginModel,
            );
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: LightAndDarkMode.primaryColor(context),
              leading: IconButton(
                  key: const Key('arrowKembaliKeBeranda'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context,
                        RoutePaths.navigationBarCustome,
                        arguments: loginViewModel.loginModel
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 22,
                  )),
              title: Text(
                Strings.layananTitle,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: ResponsiveLayanan.layananTittleFontSize,
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
                      child: ShimmerLayanan(),
                    );
                  }else{
                    return const SingleChildScrollView(
                      child: Column(
                        children: [
                          CardTransfer(),
                          CardBayar()
                        ],
                      ),
                    );
                  }
                }
            )
        )
    );
  }
}
