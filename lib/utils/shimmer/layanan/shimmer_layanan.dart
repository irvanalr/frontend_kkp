import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLayanan extends StatelessWidget {
  const ShimmerLayanan({super.key});

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
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
