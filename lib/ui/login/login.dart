import 'dart:async';
import 'package:febankflutter/models/beranda_model.dart';
import 'package:febankflutter/ui/login/information_registrasi_overlay/information_registrasi_overlay.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/shimmer/login/shimmer_login.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/ui/login/carousel_login/carousel_login.dart';
import 'package:febankflutter/ui/login/costume_textfield_login.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/ui/login/menu_kilat/menu_kilat_login.dart';
import 'package:febankflutter/utils/responsive/login/responsive_login.dart';
import 'package:febankflutter/viewmodels/akun_biometric_finger_print_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final logger = Logger();
  Future<String>? _future;
  final LoginViewModel loginViewModel = LoginViewModel();
  final BerandaModel berandaModel = BerandaModel();
  final AkunBiometricFingerPrintViewModel akunBiometricFingerPrintViewModel = AkunBiometricFingerPrintViewModel();
  final String api1 = dotenv.get('APITOKENISSUER');
  final String api2 = dotenv.get('APITOKENSECRETKEY');
  final String api3 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');
  final String lgnKts1 = dotenv.get('LOGINKATASANDISECRETKEY');
  final String lgnKts2 = dotenv.get('LOGINKATASANDISHAREDPREFERENCES');
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    loginViewModel.clearData();

    usernameController =
      TextEditingController(text: loginViewModel.namaPengguna)
        ..addListener(() {
        loginViewModel.updateNamaPengguna(usernameController.text);
      });

    passwordController =
      TextEditingController(text: loginViewModel.kataSandi)
        ..addListener(() {
        loginViewModel.updateKataSandi(passwordController.text);
      });

    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      loginViewModel.getValue(lgnTkn1, lgnTkn2).then((token) {
        if (mounted) {
          setState(() {
            loginViewModel.loginModel.isButtonGantiAkunEnabled =
                token.isNotEmpty;
            loginViewModel.loginModel.token = token;
          });
        }
      });
    });

    // loginViewModel.getValue(lgnTkn1, lgnTkn2).then((tkn) {
    //   if (mounted) {
    //     setState(() {
    //       loginViewModel.loginModel.isButtonGantiAkunEnabled = tkn.isNotEmpty;
    //       loginViewModel.loginModel.token = tkn;
    //     });
    //   }
    // });

    loginViewModel.getValue(lgnNmp1, lgnNmp2)
     .then((npng) {
      setState(() {
        loginViewModel.loginModel.namaPengguna = npng;
      });
    });

    loginViewModel.getValue(lgnKts1, lgnKts2)
        .then((kts) {
      setState(() {
        akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.kataSandi = kts;
        if(akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.kataSandi.isNotEmpty) {
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.fingerprintEnabled = true;
        }
      });
    });

    loginViewModel.getTokenApiKey().then((result) async {
      Map<String, dynamic> responseBody = result['responseBody'];
      int statusCode = result['statusCode'];

      if(statusCode == 200) {
        loginViewModel.apiKeyModel.timeStamp = responseBody['timestamp'];
        loginViewModel.apiKeyModel.status = responseBody['status'];
        loginViewModel.apiKeyModel.message = responseBody['message'];
        loginViewModel.apiKeyModel.token = responseBody['token'];
        await loginViewModel.saveValue(loginViewModel.apiKeyModel.token, api1, api2, api3);
      } else {
        loginViewModel.apiKeyModel.timeStamp = responseBody['timestamp'];
        loginViewModel.apiKeyModel.status = responseBody['status'];
        loginViewModel.apiKeyModel.message = responseBody['message'];
        if(loginViewModel.apiKeyModel.message == 'SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!'){
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    Strings.loginInformasiString,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    loginViewModel.apiKeyModel.message,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: LightAndDarkMode.teksRead2(context))),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        }else {
          throw Exception('Error selain SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!');
        }
      }
    }).catchError((error) {
      logger.i('Error during authentication: $error');
      if(mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              key: const Key('AlertGetApiKey'),
              title: const Center(
                child:Text(
                  Strings.loginPerhatianAlertGetApiKeyString,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: const Text(
                Strings.loginPerhatianBodyAlertGetApiKeyString,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    Strings.loginPerhatianButtonOkString,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    usernameController.dispose();
    passwordController.dispose();
    loginViewModel.clearData();
  }

  // Future<String> fakeAPI() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   return 'Data Loaded';
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: LightAndDarkMode.primaryColor(context),
      systemNavigationBarColor: LightAndDarkMode.bottomNavBar(context),
    ));
    ResponsiveLogin.init(context);
    return GestureDetector(
      key: const Key('gestureDetectorPertama'),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LightAndDarkMode.primaryColor(context),
          leading: Image.asset(
            'assets/png/bmtdigi.png',
            scale: 12,
          ),
          title: Text(
            Strings.loginAssalamualaikumString,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: ResponsiveLogin.loginStringAssalamualaikumFontSize,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          key: const Key('futureBuilderKey'),
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                key: Key('centerShimmerLogin'),
                  child: ShimmerLogin()
              );
            } else if (snapshot.hasError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Fluttertoast.showToast(
                    msg:
                    "Maaf server kami sedang dalam kendala, mohon tutup applikasi anda dan coba lagi di lain waktu!!!",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
              return SingleChildScrollView(
                key: const Key('singleChildScrollViewPertama'),
                child: buildLoginContent(),
              );
            } else {
              return SingleChildScrollView(
                key: const Key('singleChildScrollViewKedua'),
                child: buildLoginContent(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildLoginContent() {
    return Stack(
      key: const Key('stackPertama'),
      children: [
        Column(
          key: const Key('columnPertama'),
          children: [
            SizedBox(
              key: const Key('sizedBoxPertama'),
              height: ResponsiveLogin.loginBaseResolutionSizedBoxHeight,
              child: Stack(
                key: const Key('stackKedua'),
                children: [
                  Container(
                    key: const Key('containerPertama'),
                    width: ResponsiveLogin.loginShapeContainerWidth,
                    height: ResponsiveLogin.loginShapeContainerHeight,
                    decoration: BoxDecoration(
                      color: LightAndDarkMode.primaryColor(context),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Padding(
                    key: const Key('paddingPertama'),
                    padding: EdgeInsets.only(
                      top: ResponsiveLogin.loginCarouselPositionedTop,
                      left: ResponsiveLogin.loginCarouselPositionedLeft,
                    ),
                    child: SizedBox(
                      key: const Key('sizedBoxKedua'),
                      width: ResponsiveLogin.loginShapeCarouselWidth,
                      height: ResponsiveLogin.loginShapeCarouselHeight,
                      child: CarouselLogin(images: loginViewModel.loginModel.bannerLogin),
                    ),
                  ),
                  Padding(
                    key: const Key('paddingKedua'),
                    padding: EdgeInsets.only(
                      top: ResponsiveLogin.loginPositionedTopMenuKilat,
                    ),
                    child: SizedBox(
                      key: const Key('sizedBoxKetiga'),
                      width: ResponsiveLogin.loginSizedBoxMenuKilatWidth,
                      child: MenuKilatLogin(
                        viewModel: loginViewModel,
                        onItemTapped: (index) {
                          if (index == 0) {
                            setState(() {
                              loginViewModel.changeOverlayRegistrasi();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    key: const Key('positionedPertama'),
                    bottom: 0,
                    left: ResponsiveLogin.loginPositionedLeftCostomeTextFieldLogin,
                    child: Column(
                      key: const Key('columnKedua'),
                      children: [
                        CostumeTextFieldLogin(
                          loginViewModel: loginViewModel,
                          berandaModel: berandaModel,
                          namaPenggunaController: usernameController,
                          kataSandiController: passwordController,
                          keyLoginButton: const Key('loginButton'),
                          keyUsernameField: const Key('namaPengguna'),
                          keyPasswordField: const Key('kataSandi'),
                          keyIconEye: const Key('buttonIconEye'),
                          keyGantiAkunButton: const Key('gantiAkunButton'),
                          keyAlertOkKoneksiTerputus: const Key('buttonOkAlertKoneksiTerputus'),
                          keyAlertOkNamaPenggunaDanKataSandiSalah: const Key('buttonOkAlertNamaPenggunaDanKataSandiSalah'),
                          keyAlertOkGagalLogout: const Key('buttonOkAlertGagalLogout'),
                          keyCostumeTextFieldLogin: const Key('costumeTextFieldLoginKey'),
                          akunBiometricFingerPrintViewModel: akunBiometricFingerPrintViewModel,
                        ),
                        GestureDetector(
                          key: const Key('gestureDetectorKedua'),
                          onTap: () {
                            if(mounted) {
                              Navigator.pushReplacementNamed(
                                  context,
                                  RoutePaths.lupaNamaPenggunaAtauKataSandi
                              ).then((_) {
                                usernameController.text = '';
                                passwordController.text = '';
                              });
                            }
                          },
                          child: Text(
                            Strings.loginLupaNamaPenggunaAtauKataSandiString,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: LightAndDarkMode.teksLinked(context),
                                  fontSize: ResponsiveLogin.loginStringLupaNamaPenggunaDanKataSandiFontSize,
                                  fontWeight: FontWeight.w600,
                                )),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        InformationMessageOverlayRegistrasi(loginViewModel: loginViewModel)
      ],
    );
  }
}