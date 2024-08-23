import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMutasi extends StatelessWidget {
  const ShimmerMutasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.blueGrey.withOpacity(0.9),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.09,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: MediaQuery.of(context).size.height * 0.09,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(10, (index) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.05,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: MediaQuery.of(context).size.height * 0.02,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
