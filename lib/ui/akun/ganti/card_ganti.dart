import 'package:febankflutter/ui/akun/ganti/fingerprint/finger_print_login.dart';
import 'package:febankflutter/viewmodels/akun_biometric_finger_print_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:febankflutter/utils/responsive/akun/responsive_akun.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:logger/logger.dart';

class CardGanti extends StatefulWidget {
  const CardGanti({super.key});

  @override
  State<CardGanti> createState() => _CardGantiState();
}

class _CardGantiState extends State<CardGanti> {
  final LoginViewModel loginViewModel = LoginViewModel();
  final AkunBiometricFingerPrintViewModel akunBiometricFingerPrintViewModel = AkunBiometricFingerPrintViewModel();
  final logger = Logger();
  final String lgnKts1 = dotenv.get('LOGINKATASANDISECRETKEY');
  final String lgnKts2 = dotenv.get('LOGINKATASANDISHAREDPREFERENCES');

  @override
  void initState() {
    super.initState();
    akunBiometricFingerPrintViewModel.checkForFingerprintSensor(context);

    loginViewModel.getValue(lgnKts1, lgnKts2)
        .then((kataSandi) {
      setState(() {
        akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.kataSandi = kataSandi;
        if(akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.kataSandi.isNotEmpty) {
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.fingerprintEnabled = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, RoutePaths.akunGantiPassword);
          },
          child: Container(
            width: ResponsiveAkun.cardAkunContainerWidth,
            decoration: BoxDecoration(
              color: LightAndDarkMode.primaryColor(context),
              border: const Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
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
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.akunGantiKataSandi,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: ResponsiveAkun.cardAkunStringAllFontSize,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),

        Visibility(
          visible: akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.hasFingerprintSensor,
          child: GestureDetector(
            onTap: () {
              // akunBiometricFingerPrintViewModel.toggleFingerprintAuthentication(context);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => const FingerPrintLogin()),
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
                  ),
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
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.akunFingerPrint,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ResponsiveAkun.cardAkunStringAllFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Switch(
                      value: akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.fingerprintEnabled,
                      activeColor: LightAndDarkMode.cardColor8(context),
                      onChanged: (value) {
                        akunBiometricFingerPrintViewModel.toggleFingerprintAuthentication(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                msg: "Ganti rekening wallet masih dalam pengembangan",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
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
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.akunGantiRekeningWallet,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ResponsiveAkun.cardAkunStringAllFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
