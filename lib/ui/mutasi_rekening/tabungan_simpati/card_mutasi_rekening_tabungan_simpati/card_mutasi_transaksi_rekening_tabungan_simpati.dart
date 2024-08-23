import 'package:febankflutter/utils/responsive/mutasi_rekening/responsive_mutasi_rekening_tabungan_simpati.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/mutasi_rekening_tabungan_simpati_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:febankflutter/models/mutasi_rekening_tabungan_simpati_model.dart';

class CardMutasiTransaksiRekeningTabunganSimpati extends StatefulWidget {
  final MutasiRekeningTabunganSimpatiViewModel mutasiRekeningTabunganSimpatiViewModel;
  const CardMutasiTransaksiRekeningTabunganSimpati({super.key, required this.mutasiRekeningTabunganSimpatiViewModel});

  @override
  State<CardMutasiTransaksiRekeningTabunganSimpati> createState() => _CardMutasiTransaksiRekeningTabunganSimpatiState();
}

class _CardMutasiTransaksiRekeningTabunganSimpatiState extends State<CardMutasiTransaksiRekeningTabunganSimpati> {

  @override
  Widget build(BuildContext context) {
    ResponsiveMutasiRekeningTabunganSimpati.init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: widget.mutasiRekeningTabunganSimpatiViewModel.mutasiRekeningTabunganSimpatiModel.transactions.isEmpty
            ? Center(
          child: Text(
            "Data transaksi kosong !!!",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize,
                fontWeight: FontWeight.w600,
                color: LightAndDarkMode.teksRead2(context),
              ),
            ),
          ),
        )
            : ListView.builder(
          itemCount: widget.mutasiRekeningTabunganSimpatiViewModel.mutasiRekeningTabunganSimpatiModel.transactions.length,
          itemBuilder: (context, index) {
            Transactions transaction = widget.mutasiRekeningTabunganSimpatiViewModel.mutasiRekeningTabunganSimpatiModel.transactions[index];
            return Container(
              width: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiContainerWidth,
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
                                fontSize: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiStringHeadKeyFontSize,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1B3E5F),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Rp ${widget.mutasiRekeningTabunganSimpatiViewModel.formatValuetoRupiah(double.parse(transaction.endValue1))}',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiStringHeadTotalSaldoFontSize,
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
                              fontSize: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize,
                              fontWeight: FontWeight.normal,
                              color: LightAndDarkMode.teksRead(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'Rp ${widget.mutasiRekeningTabunganSimpatiViewModel.formatValuetoRupiah(double.parse(transaction.value1))}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiStringPengeluaranAtauPemasukanFontSize,
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
                                  fontSize: ResponsiveMutasiRekeningTabunganSimpati.cardMutasiRekeningTabunganSimpatiStringJenisTransferDanNomerTransferFontSize,
                                  fontWeight: FontWeight.normal,
                                  color: LightAndDarkMode.teksRead(context),
                                ),
                              ),
                            ),
                          ),
                        )
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
