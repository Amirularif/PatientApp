import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SleepSummary extends StatefulWidget {
  final String title;
  final String description;

  const SleepSummary({
    Key? key,
    required this.title,
    required this.description
  }) : super(key: key);

  @override
  State<SleepSummary> createState() => _SleepSummaryState();
}

class _SleepSummaryState extends State<SleepSummary> {
  @override
  Widget build(BuildContext context) {
    double sleephours;
    sleephours = 10.5;
    double graphpercent = ((sleephours * 100)/24)/100;
    //bar tu akan fill up according to the percentage ratio of heartbeat. aku set max dia 215
    String sleeptext = sleephours.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 320,
        height: 120,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            //circle graph
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 7,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: graphpercent,
                  progressColor: Colors.lightBlueAccent,
                  center:
                  Text(
                    sleeptext,
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

                    if (sleephours < 6)
                      Text(
                        'You slept for less than 6 hours\nlast night. Please consult your\ndoctor if this persists.',
                        style: TextStyle(
                          color: Colors.black87,),
                      )

                    else if (sleephours >= 6 && sleephours <= 8)
                      Text(
                        'You met the required number\nof sleeping hours last night.',
                        style: TextStyle(
                          color: Colors.black87,),
                      )

                      else if (sleephours > 8)
                          Text(
                            'You slept too much last night.\nPlease consult your doctor if\nthis persists.',
                            style: TextStyle(
                              color: Colors.black87,),
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
