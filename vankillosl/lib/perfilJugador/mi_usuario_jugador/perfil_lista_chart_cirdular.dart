import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vankillosl/models/usuario_model_list_circular.dart';

class CircleProgressChart extends StatefulWidget {
  const CircleProgressChart({super.key});

  @override
  State<CircleProgressChart> createState() => _CircleProgressChartState();
}

class _CircleProgressChartState extends State<CircleProgressChart> {
  final List<UserModelData> userModelData = UserModelDataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 15),
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: userModelData.length,
          itemBuilder: (context, index) {
            final userModelDataList = userModelData[index];
            return Container(
              margin: EdgeInsets.all(8),
              width: 85,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: userModelDataList.percent / 100,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${userModelDataList.percent}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    userModelDataList.analiticaTipo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${userModelDataList.numero}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
