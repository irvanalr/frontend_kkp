import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/akun_profile/responsive_akun_profile.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CardUserPengaturan extends StatefulWidget {
  const CardUserPengaturan({super.key});

  @override
  State<CardUserPengaturan> createState() => _CardUserPengaturanState();
}

class _CardUserPengaturanState extends State<CardUserPengaturan> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: ResponsiveAkunProfile.akunProfileCardPengaturanContainerDanSizedBoxWidth,
            decoration: BoxDecoration(
              color: LightAndDarkMode.primaryColor(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10),
                child: Text(
                  Strings.akunPengaturan,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveAkunProfile.akunProfileCardPengaturanStringPengaturanFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
          ),

          SizedBox(
            width: ResponsiveAkunProfile.akunProfileCardPengaturanContainerDanSizedBoxWidth,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: LightAndDarkMode.teksRead2(context),
                      width: 1,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20, bottom: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: 'Feature Ganti Password masih dalam pengembangan',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 5),
                              child: SvgPicture.asset(
                                'assets/svg/akun_profile/password_changed.svg',
                                colorFilter: ColorFilter.mode(
                                    LightAndDarkMode.teksRead2(context),
                                    BlendMode.srcIn
                                ),
                              ),
                            ),
                            Text(
                              Strings.akunGantiKataSandi,
                              style: GoogleFonts.poppins(textStyle: TextStyle(
                                  fontSize: ResponsiveAkunProfile.akunProfileCardPengaturanStringGantiPasswordFontSize,
                                  fontWeight:
                                  FontWeight.normal,
                                  color: LightAndDarkMode.teksRead2(context)
                              )
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: 'Feature Ganti Rekening wallet masih dalam pengembangan',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left:  5),
                              child: SvgPicture.asset(
                                'assets/svg/akun_profile/wallet.svg',
                                colorFilter: ColorFilter.mode(
                                    LightAndDarkMode.teksRead2(context),
                                    BlendMode.srcIn
                                ),
                              ),
                            ),
                            Text(
                              Strings.akunGantiRekeningWallet,
                              style: GoogleFonts.poppins(textStyle: TextStyle(
                                  fontSize: ResponsiveAkunProfile.akunProfileCardPengaturanStringGantiRekeningWalletFontSize,
                                  fontWeight:
                                  FontWeight.normal,
                                  color: LightAndDarkMode.teksRead2(context)
                              )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
