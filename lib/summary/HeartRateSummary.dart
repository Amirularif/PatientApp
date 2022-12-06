import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HeartRateSummary extends StatefulWidget {
  final String title;

  const HeartRateSummary({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HeartRateSummary> createState() => _HeartRateSummaryState();
}

class _HeartRateSummaryState extends State<HeartRateSummary> {
  @override
  Widget build(BuildContext context) {
    int heartbpm;
    double graphpercent;
    heartbpm = 79;
    graphpercent = ((heartbpm * 100)/215)/100;
    //bar tu akan fill up according to the percentage ratio of heartbeat. aku set max dia 215
    String bpmtext = heartbpm.toString();

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
                  progressColor: Colors.redAccent,
                  center:
                  Text(
                    bpmtext,
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

                    if (heartbpm < 80)
                      Text(
                        'Your average heart rate is\nlower than normal. Please\nconsult with your doctor.',
                        style: TextStyle(
                          color: Colors.black87,),
                      )

                    else if (heartbpm >= 80 && heartbpm <= 120)
                      Text(
                      'Your average heart rate is\nnormal.',
                      style: TextStyle(
                      color: Colors.black87,),
                      )

                    else if (heartbpm > 120 && heartbpm <= 175)
                        Text(
                          'Your average heart rate is\na bit higher than normal. Please\nconsult with your doctor.',
                          style: TextStyle(
                            color: Colors.black87,),
                        )

                      else if (heartbpm > 175)
                          Text(
                            'Your average heart rate is\nvery high. Please consult with\n your doctor.',
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
