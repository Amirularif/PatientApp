import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivitySummary extends StatefulWidget {
  final String title;
  const ActivitySummary({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ActivitySummary> createState() => _ActivitySummaryState();
}

class _ActivitySummaryState extends State<ActivitySummary> {
  @override
  Widget build(BuildContext context) {
    int stepcount;
    stepcount = 300000;

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
                Icon(
                  Icons.directions_walk,
                  size: 50,
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
                      'You have walked\n$stepcount steps yesterday',
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
