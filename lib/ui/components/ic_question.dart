import 'package:flutter/material.dart';
import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/components/ic_buttons.dart';
import 'package:iCovid/ui/components/ic_options_area.dart';

class ICQuestion extends StatelessWidget {
  const ICQuestion({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
          color: Colors.white,
          width: double.infinity,
          height: size.height * 0.67,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Do you smoke?",
                style: kheadline4,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 32),
              ICOptionsArea(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      child: ICSecondaryButton(
                    onPressed: () {},
                    text: "Back",
                  )),
                  Flexible(child: ICMainButton(onPressed: () {}, text: "Next")),
                ],
              ),
              SizedBox(height: 16),
            ]),
          )),
    );
  }
}
