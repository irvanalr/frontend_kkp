import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNotifikasi extends StatelessWidget {
  const ShimmerNotifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.blueGrey.withOpacity(0.9),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          child: Column(
            children: List.generate(11, (index) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.02,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    )
                  ],
                )
            ),
          ),
        ),
      )
    );
  }
}
