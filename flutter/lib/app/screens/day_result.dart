import 'package:aoc2023/src/days/base_day.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayResultDisplayFuture extends StatelessWidget {
  const DayResultDisplayFuture(this.partTitle, this.result);
  final String partTitle;
  final Future<DayResult> result;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<DayResult>(
        future: result,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data!;

              return DayResultDisplay(
                partTitle: partTitle,
                data: data,
              );
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class DayResultDisplay extends StatelessWidget {
  const DayResultDisplay({
    super.key,
    required this.partTitle,
    required this.data,
  });

  final String partTitle;
  final DayResult data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const lightGreen = Color.fromARGB(255, 10, 250, 10);
    final titleStyle = textTheme.titleLarge!.copyWith(
      fontFamily: GoogleFonts.courierPrime().fontFamily,
      color: lightGreen,
    );
    final resultStyle = textTheme.headlineMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.robotoSlab().fontFamily,
      color: const Color.fromARGB(255, 250, 250, 10),
    );

    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 10, 50, 10),
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 10, 50, 10),
              border: Border.all(
                width: 2.0,
                color: lightGreen.withAlpha(70),
                //strokeAlign: StrokeAlign.inside,
              ),
            ),
            width: 275,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(partTitle, style: titleStyle),
                Text(
                  '⏱ ${data.computeTime}ms',
                  style: titleStyle,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            data.result,
            style: resultStyle,
          ),
        ),
      ],
    );
  }
}
