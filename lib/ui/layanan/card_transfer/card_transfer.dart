import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/responsive/layanan/responsive_layanan.dart';
import 'package:febankflutter/viewmodels/layanan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTransfer extends StatefulWidget {
  const CardTransfer({super.key});

  @override
  State<CardTransfer> createState() => _CardTransferState();
}

class _CardTransferState extends State<CardTransfer> {
  final LayananViewModel layananViewModel = LayananViewModel();

  String getMessageForIndex(int index) {
    switch (index) {
      case 0:
        return 'Antar Rekening masih dalam pengembangan';
      case 1:
        return 'Antar Koperasi masih dalam pengembangan';
      case 2:
        return 'Infaq masih dalam pengembangan';
      case 3:
        return 'Waqaf PLN masih dalam pengembangan';
      default:
        return 'Icon $index masih dalam pengembangan';
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLayanan.init(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              width: ResponsiveLayanan.layananCardBayarWidth,
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
                  'Transfer/Pindah buku',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: ResponsiveLayanan.layananCardBayarStringPindahBukuFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              width: ResponsiveLayanan.layananCardBayarWidth,
              color: LightAndDarkMode.cardColor7(context),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LightAndDarkMode.cardColor1(context),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: layananViewModel.layananModel.cardTransferPngAsset.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pemberitahuan'),
                                content: Text(
                                    getMessageForIndex(index),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              layananViewModel.layananModel.cardTransferPngAsset[index],
                              scale: ResponsiveLayanan.layananCardBayarImageAssetWidth,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                layananViewModel.layananModel.cardTransferTextList[index],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: ResponsiveLayanan.layananCardBayarStringTextListFontSize,
                                      fontWeight: FontWeight.normal,
                                      color: LightAndDarkMode.teksRead2(context),
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}