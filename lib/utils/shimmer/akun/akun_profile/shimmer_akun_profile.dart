import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAkunProfile extends StatelessWidget {
  const ShimmerAkunProfile({super.key});

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
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.26,
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.33,
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
