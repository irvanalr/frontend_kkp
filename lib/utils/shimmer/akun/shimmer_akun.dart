import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAkun extends StatelessWidget {
  const ShimmerAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.blueGrey.withOpacity(0.9),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.grey.withOpacity(0.5)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.grey.withOpacity(0.5)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.5),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.grey.withOpacity(0.5)
                ),
              ),
              ...List.generate(9, (index) =>
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.045,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}
