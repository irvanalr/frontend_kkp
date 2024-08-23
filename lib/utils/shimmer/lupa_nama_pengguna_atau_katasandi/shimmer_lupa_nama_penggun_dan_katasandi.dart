import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLupaNamaPenggunaDanKataSandi extends StatelessWidget {
  const ShimmerLupaNamaPenggunaDanKataSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.blueGrey.withOpacity(0.9),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  )
              ),

              Positioned(
                  top: MediaQuery.of(context).size.height * 0.125,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.14,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.14,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
