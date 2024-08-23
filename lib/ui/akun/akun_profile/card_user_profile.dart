import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/akun_profile/responsive_akun_profile.dart';
import 'package:febankflutter/viewmodels/akun_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CardUserProfile extends StatefulWidget {
  final AkunViewModel akunViewModel;
  const CardUserProfile({
    super.key,
    required this.akunViewModel
  });

  @override
  State<CardUserProfile> createState() => _CardUserProfileState();
}

class _CardUserProfileState extends State<CardUserProfile> {

  @override
  Widget build(BuildContext context) {
    ResponsiveAkunProfile.init(context);
    return Center(
      child: Column(
        children: [
          Container(
            width: ResponsiveAkunProfile.akunProfileCardUserContainerDanSizedBoxWidth,
            decoration: BoxDecoration(
              color: LightAndDarkMode.primaryColor(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      'assets/svg/akun_profile/profile.svg',
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.akunViewModel.akunModel.users[0].name,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunNameFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Terdaftar: ${widget.akunViewModel.akunModel.users[0].registration}',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ResponsiveAkunProfile.akunProfileCardUserStringTerdaftarFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        widget.akunViewModel.akunModel.users[0].code,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunNumberFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
          ),

          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              color: LightAndDarkMode.cardColor7(context),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: LightAndDarkMode.cardColor5(context),
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
                                msg: 'Feature email masih dalam pengembangan',
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
                                  'assets/svg/akun_profile/email.svg',
                                  colorFilter: ColorFilter.mode(
                                      LightAndDarkMode.teksRead2(context),
                                      BlendMode.srcIn
                                  ),
                                ),
                              ),
                              Text(
                                widget.akunViewModel.akunModel.users[0].email,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunStringEmailFontSize,
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
                          onTap: (){
                            Fluttertoast.showToast(
                                msg: 'Feature telephone masih dalam pengembangan',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white
                            );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 17, left:  2),
                                child: SvgPicture.asset(
                                  'assets/svg/akun_profile/phone.svg',
                                  colorFilter: ColorFilter.mode(
                                      LightAndDarkMode.teksRead2(context),
                                      BlendMode.srcIn
                                  ),
                                ),
                              ),
                              Text(
                                widget.akunViewModel.akunModel.users[0].handphone,
                                style: GoogleFonts.poppins(textStyle: TextStyle(
                                    fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunStringPhoneNumberFontSize,
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left:  5),
                              child: SvgPicture.asset(
                                'assets/svg/akun_profile/date.svg',
                                colorFilter: ColorFilter.mode(
                                    LightAndDarkMode.teksRead2(context),
                                    BlendMode.srcIn
                                ),
                              ),
                            ),
                            Text(
                              widget.akunViewModel.akunModel.users[0].dob,
                              style: GoogleFonts.poppins(textStyle: TextStyle(
                                  fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunStringPhoneNumberFontSize,
                                  fontWeight:
                                  FontWeight.normal,
                                  color: LightAndDarkMode.teksRead2(context)
                              )
                              ),
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        GestureDetector(
                          onTap: (){
                            Fluttertoast.showToast(
                                msg: 'Feature map masih dalam pengembangan',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white
                            );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20, left: 2),
                                child: SvgPicture.asset(
                                  'assets/svg/akun_profile/map_point.svg',
                                  colorFilter: ColorFilter.mode(
                                      LightAndDarkMode.teksRead2(context),
                                      BlendMode.srcIn
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.akunViewModel.akunModel.users[0].address,
                                    style: GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunStringAkunMapFontSize,
                                        fontWeight:
                                        FontWeight.normal,
                                        color: LightAndDarkMode.teksRead2(context)
                                    )
                                    ),
                                  ),
                                  Text(
                                    '${widget.akunViewModel.akunModel.users[0].city} - ${widget.akunViewModel.akunModel.users[0].postCode}',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: ResponsiveAkunProfile.akunProfileCardUserStringAkunStringAkunMapFontSize,
                                        fontWeight:
                                        FontWeight.normal,
                                        color: LightAndDarkMode.teksRead2(context)
                                    )
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
