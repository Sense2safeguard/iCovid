import 'package:flutter/material.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/core/helpers/responsive_sized_widgets.dart';

class BottomRoundedHeader extends StatelessWidget {
  const BottomRoundedHeader({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(size),
      child: Container(
          height: size.height * 0.26,
          color: kBlue,
          child: Padding(
            padding: EdgeInsets.only(top: kBottomRoundedHeaderTopPadding(size)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/Virus_with_molecules.png"),
                SizedBox(width: size.width * 0.051),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("iCOVID",
                        style: kheadline4.copyWith(
                            color: kNeoAccent,
                            fontWeight: FontWeight.w800,
                            fontSize: 29)),
                    Text("Post Assessment",
                        style: kheadline3.copyWith(
                            color: Colors.white, fontSize: 18)),
                    Text("Just one more step!",
                        style: kBodyText2.copyWith(
                            color: Colors.white, fontSize: 18)),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  final Size size;

  HeaderClipper(this.size);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - size.height * 0.01);
    path.quadraticBezierTo(size.width / 2, size.height - (size.height * 0.3),
        size.width, size.height - (size.height * 0.01));
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
