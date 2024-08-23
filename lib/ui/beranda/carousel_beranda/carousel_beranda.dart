import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:febankflutter/utils/responsive/beranda/responsive_beranda.dart';
import 'package:febankflutter/viewmodels/beranda_view_model.dart';
import 'package:flutter/material.dart';

class CarouselBeranda extends StatelessWidget {
  final BerandaViewModel viewModel;

  const CarouselBeranda({super.key, required this.viewModel});
  @override
  Widget build(BuildContext context) {
    ResponsiveBeranda.init(context);
    return Container(
        width: ResponsiveBeranda.cardCarouselWidth,
        height: ResponsiveBeranda.cardCarouselHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
              Radius.circular(20)
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: ResponsiveBeranda.cardCarouselWidth,
              height: ResponsiveBeranda.cardCarouselHeight,
              child: AnotherCarousel(
                images: viewModel.berandaModel.berandaBanner.asMap().entries.map((entry) {
                  // int index = entry.key;
                  String imagePath = entry.value;
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pemberitahuan'),
                            content: const Text('Banner iklan masih dalam tahap pengembangan'),
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
                    child: Image.asset(imagePath, fit: BoxFit.fill),
                  );
                }).toList(),
                autoplay: true,
              ),
            ),
          ),
        ),
      );
  }
}