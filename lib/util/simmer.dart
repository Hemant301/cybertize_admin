import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommityMembrDitelSimer extends StatelessWidget {
  const CommityMembrDitelSimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
            baseColor:
                const Color.fromARGB(255, 198, 193, 194).withOpacity(0.3),
            highlightColor:
                const Color.fromARGB(255, 190, 185, 186).withOpacity(0.1),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  20,
                  (index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 152, 145, 145),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ))),
      ],
    );
  }
}
