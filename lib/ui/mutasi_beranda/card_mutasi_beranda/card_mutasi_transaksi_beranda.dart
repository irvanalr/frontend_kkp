import 'package:febankflutter/models/mutasi_beranda_model.dart';
import 'package:febankflutter/utils/responsive/mutasi_beranda/responsive_transaksi.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_beranda_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMutasiTransaksiBeranda extends StatefulWidget {
  final MutasiBerandaViewModel mutasiBerandaViewModel;
  const CardMutasiTransaksiBeranda({super.key, required this.mutasiBerandaViewModel});

  @override
  State<CardMutasiTransaksiBeranda> createState() => _CardMutasiTransaksiBerandaState();
}

class _CardMutasiTransaksiBerandaState extends State<CardMutasiTransaksiBeranda> {

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiBeranda.init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: widget.mutasiBerandaViewModel.mutasiBerandaModel.transactions.isEmpty
            ? Center(
          child: Text(
            "Data transaksi kosong !!!",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: ResponsiveMutasiBeranda.cardMutasiBerandaStringHeadKeyFontSize,
                fontWeight: FontWeight.w600,
                color: LightAndDarkMode.teksRead2(context),
              ),
            ),
          ),
        )
            : ListView.builder(
          itemCount: widget.mutasiBerandaViewModel.mutasiBerandaModel.transactions.length,
          itemBuilder: (context, index) {
            Transactions transaction = widget.mutasiBerandaViewModel.mutasiBerandaModel.transactions[index];
            return Container(
              width: ResponsiveMutasiBeranda.cardMutasiBerandaContainerWidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF2B7ECA), width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction.date,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: ResponsiveMutasiBeranda.cardMutasiBerandaStringHeadKeyFontSize,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1B3E5F),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Rp ${widget.mutasiBerandaViewModel.formatValuetoRupiah(double.parse(transaction.endValue1))}',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: ResponsiveMutasiBeranda.cardMutasiBerandaStringHeadTotalSaldoFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B3E5F),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.code,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: ResponsiveMutasiBeranda.cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize,
                              fontWeight: FontWeight.normal,
                              color: LightAndDarkMode.teksRead(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'Rp ${widget.mutasiBerandaViewModel.formatValuetoRupiah(double.parse(transaction.value1))}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: ResponsiveMutasiBeranda.cardMutasiBerandaStringPengeluaranAtauPemasukanFontSize,
                                fontWeight: FontWeight.normal,
                                color: transaction.direction == "1" ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              transaction.description,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: ResponsiveMutasiBeranda.cardMutasiBerandaStringJenisTransferDanNomerTransferFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: LightAndDarkMode.teksRead(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
