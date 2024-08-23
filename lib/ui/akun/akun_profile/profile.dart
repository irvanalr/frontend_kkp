import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/akun/akun_profile/shimmer_akun_profile.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/akun/akun_profile/card_user_profile.dart';
import 'package:febankflutter/utils/responsive/akun_profile/responsive_akun_profile.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/viewmodels/akun_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class AkunProfile extends StatefulWidget {
  const AkunProfile({super.key});

  @override
  State<AkunProfile> createState() => _AkunProfileState();
}

class _AkunProfileState extends State<AkunProfile> {
  late final AkunViewModel akunViewModel;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    akunViewModel = AkunViewModel();
  }

  // Future<void> fakeApi() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   logger.i('Data sudah di-load');
  // }

  @override
  Widget build(BuildContext context) {
    ResponsiveAkunProfile.init(context);
    return PopScope<Object?>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            Navigator.pushReplacementNamed(context, RoutePaths.navigationBarCustome);
          }
        },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              key: const Key('arrowKembaliKeNavigationBottomBar'),
              onPressed: () {
                Navigator.pushReplacementNamed(context,RoutePaths.navigationBarCustome);
              },
              icon: const Icon(
                size: 22,
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            Strings.akunProfileTitle,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: ResponsiveAkunProfile.akunProfileTittleFontSize,
                    fontWeight:
                    FontWeight.w600,
                    color: Colors.white
                )
            ),
          ),
          centerTitle: true,
          backgroundColor: LightAndDarkMode.primaryColor(context),
        ),
        body: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 1500), () => akunViewModel.informasiDataPengguna()),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: ShimmerAkunProfile(),
                );
              } else {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Image.asset(
                            'assets/png/bmtdigi.png',
                            scale: 4.5,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 30)),
                        CardUserProfile(akunViewModel: akunViewModel,),
                        // const Padding(padding: EdgeInsets.only(top: 30)),
                        // const CardUserPengaturan(),
                      ],
                    ),
                  ),
                );
              }
            }
        )
      )
    );
  }
}
