import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/helpers/responsiver.dart';

class ICCard extends StatelessWidget {
  final String infectionScore;
  final String complicationScore;

  const ICCard({Key key, this.infectionScore, this.complicationScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsiver responsiver = Responsiver(context: context);

    bool isInfection = infectionScore != null ? true : false;
    int score =
        isInfection ? int.parse(infectionScore) : int.parse(complicationScore);

    String riskLevel() {
      if (score < 30) return "low risk";
      if (score < 70) return "mid risk";
      if (score > 69) return "high risk";
      return '';
    }

    return Container(
        width: responsiver.cardWidth,
        height: responsiver.cardHeight,
        decoration: BoxDecoration(
            color: riskLevel() == "low risk"
                ? kSuccess
                : riskLevel() == "mid risk"
                    ? kWarning
                    : kError,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: responsiver.resultsMainBodyPadding,
          child: Column(
            children: [
              Row(children: [
                Image.asset(isInfection
                    ? 'assets/images/virus.png'
                    : 'assets/images/stethoscope.png'),
                SizedBox(width: 8),
                Text(isInfection ? "INFECTION SCORE" : "COMPLICATION SCORE",
                    style:
                        kheadline6.copyWith(fontSize: 12, color: Colors.white)),
              ]),
              SizedBox(
                height: responsiver.smallestVertical,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(score.toString(),
                      style: kheadline6.copyWith(
                          fontSize: 50, color: Colors.white)),
                  SizedBox(
                    width: responsiver.smallHorizontal,
                  ),
                  Flexible(
                    child: Text(
                        "You are at ${riskLevel()} of COVID-19 ${isInfection ? "infection" : "complication"}. If you are feeling unwell, you still see a doctor",
                        style: kOverlineTextStyle.copyWith(
                            fontSize: 10, color: Colors.white)),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
