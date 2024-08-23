import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationMessageOverlayRegistrasi extends StatefulWidget {
  final LoginViewModel loginViewModel;

  const InformationMessageOverlayRegistrasi({super.key, required this.loginViewModel});

  @override
  State<InformationMessageOverlayRegistrasi> createState() => _InformationMessageOverlayRegistrasiState();
}

class _InformationMessageOverlayRegistrasiState extends State<InformationMessageOverlayRegistrasi> {
  String loremIpsumText1 = 'Lorem ipsum dolor sit amet';
  String loremIpsumText2 = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed euismod ultrices massa, et feugiat ipsum consequat 
id. Cras at turpis sem. Nullam molestie volutpat sapien, 
id feugiat orci iaculis nec. Sed auctor, erat in 
eleifend aliquet, nisl diam viverra velit, nec 
condimentum nisi magna non tellus. 
  ''';

  @override
  Widget build(BuildContext context) {
    return Visibility(
      key: const Key('registrasiOverlay'),
      visible: widget.loginViewModel.loginModel.informationMessageOverlayRegistrasi,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.loginViewModel.changeOverlayRegistrasi();
                });
              },
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.black.withOpacity(0.4)
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              color: LightAndDarkMode.cardColor7(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                            loremIpsumText1,
                            style: GoogleFonts.poppins(textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color:  LightAndDarkMode.teksLinked(context)
                            ),
                            )
                        ),
                      ),
                      TextButton(
                          key: const Key('iconClose'),
                          onPressed: () {
                            setState(() {
                              widget.loginViewModel.changeOverlayRegistrasi();
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/svg/icon_close.svg',
                            colorFilter: ColorFilter.mode(
                                LightAndDarkMode.teksLinked(context),
                                BlendMode.srcIn
                            ),
                          )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: SvgPicture.asset(
                      'assets/svg/line.svg',
                      colorFilter: ColorFilter.mode(
                          LightAndDarkMode.lineSvgColor(context),
                          BlendMode.srcIn
                      ),
                      width: MediaQuery.of(context).size.width * 0.95,
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  '$loremIpsumText1 ?',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: LightAndDarkMode.teksRead(context)
                                      )
                                  ),
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  loremIpsumText2,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: LightAndDarkMode.teksRead(context)
                                      )
                                  ),
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  '$loremIpsumText1 ?',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: LightAndDarkMode.teksRead(context)
                                      )
                                  ),
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  loremIpsumText2,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: LightAndDarkMode.teksRead(context)
                                      )
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}