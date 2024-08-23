import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/akun/responsive_akun.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInformasiAkun extends StatelessWidget {
  const CardInformasiAkun({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveAkun.init(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
                msg: "Info Kurs masih dalam pengembangan",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Container(
            width: ResponsiveAkun.cardAkunContainerWidth,
            decoration: BoxDecoration(
              color: LightAndDarkMode.primaryColor(context),
              border: const Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 1,
                  )
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        Strings.akunInfoKurs,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: ResponsiveAkun.cardAkunStringAllFontSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.white
                            )
                        )
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                )
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(
                msg: "Lokasi ATM masih dalam pengembangan",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Container(
            width: ResponsiveAkun.cardAkunContainerWidth,
            decoration: BoxDecoration(
              color: LightAndDarkMode.primaryColor(context),
              border: const Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 1,
                  )
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        Strings.akunLokasiAtm,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: ResponsiveAkun.cardAkunStringAllFontSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.white
                            )
                        )
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                )
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: ResponsiveAkun.cardAkunPaddingBottomContainerLast),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Lokasi Kantor masih dalam pengembangan",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
            child: Container(
              width: ResponsiveAkun.cardAkunContainerWidth,
              decoration: BoxDecoration(
                color: LightAndDarkMode.primaryColor(context),
                border: const Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          Strings.akunLokasiKantor,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: ResponsiveAkun.cardAkunStringAllFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                              )
                          )
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
