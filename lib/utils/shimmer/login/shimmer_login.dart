import 'package:febankflutter/utils/responsive/login/responsive_login.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLogin extends StatelessWidget {
  const ShimmerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveLogin.init(context);
    return Shimmer.fromColors(
      key: const Key('shimmer login'),
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.blueGrey.withOpacity(0.9),
      child: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
            child:Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),

                Positioned(
                    bottom: 0,
                    left: ResponsiveLogin.loginPositionedLeftCostomeTextFieldLogin,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    )
                )
              ],
            )
        ),
      )
    );
  }
}
