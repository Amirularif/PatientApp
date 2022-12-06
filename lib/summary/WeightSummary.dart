import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WeightSummary extends StatefulWidget {
  final String title;
  final String description;
  const WeightSummary({
    Key? key,
    required this.title,
    required this.description
  }) : super(key: key);

  @override
  State<WeightSummary> createState() => _WeightSummaryState();
}

class _WeightSummaryState extends State<WeightSummary> {
  @override
  Widget build(BuildContext context) {
    double weight;
    weight = 55.67;
    String textweight = weight.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 320,
        height: 120,
        padding: EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            //icon
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 5,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 1.0,
                  progressColor: Colors.greenAccent,
                  center:
                  Text(
                    textweight,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),),
                ),


                SizedBox(
                  width: 20,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(
                      height: 10,
                    ),

                    //description
                    Text(
                      'Your weight was last recorded\non (date).',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
