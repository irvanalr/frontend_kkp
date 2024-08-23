import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:febankflutter/utils/responsive/login/responsive_login.dart';
import 'package:flutter/material.dart';

class CarouselLogin extends StatelessWidget {
  final List<String> images;

  const CarouselLogin({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    ResponsiveLogin.init(context);
    return Container(
        key: const Key('carouselLoginKey'),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(20)
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
              Radius.circular(20)
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: ResponsiveLogin.carouselLoginSizedBoxWidth,
              height: ResponsiveLogin.carouselLoginSizedBoxHeight,
              child: AnotherCarousel(
                images: images.asMap().entries.map((entry) {
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
