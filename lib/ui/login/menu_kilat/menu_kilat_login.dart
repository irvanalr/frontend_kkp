import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/login/responsive_login.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuKilatLogin extends StatefulWidget {
  final LoginViewModel viewModel;
  final Function(int) onItemTapped;

  const MenuKilatLogin({super.key, required this.viewModel, required this.onItemTapped});

  @override
  State<MenuKilatLogin> createState() => _MenuKilatLoginState();
}

class _MenuKilatLoginState extends State<MenuKilatLogin> {

  String getMessageForIndex(int index) {
    switch (index) {
      case 1:
        return 'Antar Koperasi masih dalam pengembangan';
      case 2:
        return 'Paket Data masih dalam pengembangan';
      case 3:
        return 'Tagihan PLN masih dalam pengembangan';
      default:
        return 'Icon $index masih dalam pengembangan';
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLogin.init(context);
    return Visibility(
      key: const Key('menuKilatKey'),
      visible: widget.viewModel.loginModel.isButtonGantiAkunEnabled,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              direction: Axis.horizontal,
              children: List<Widget>.generate(
                  widget.viewModel.loginModel.loginPngAsset.length, (index) {
                return GestureDetector(
                    onTap: () {
                      if(index == 0) {
                        widget.onItemTapped(index);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            /// debugging alert
                            return AlertDialog(
                              title: const Text('Informasi'),
                              content: Text(
                                  getMessageForIndex(index),
                              ),
                              actions: [
                                TextButton(
                                  key: const Key('alertOkPengembangan'),
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              widget.viewModel.loginModel.loginPngAsset[index],
                              scale: ResponsiveLogin.menuKilatImageSizeWidth,
                            ),
                          ),
                          Text(
                            widget.viewModel.loginModel.loginTextList[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveLogin.menuKilatTextStringListFontSize,
                                    fontWeight: FontWeight.normal,
                                    color: LightAndDarkMode.teksRead2(context)
                                )
                            ),
                          ),
                        ],
                      ),
                    )
                );
              }),
            ),
          ],
        ),
      )
    );
  }
}