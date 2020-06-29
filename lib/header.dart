import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_profile/contants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
    this.child,
  }) : super(key: key);
  final Widget child;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
//          padding: EdgeInsets.only(top: KDefaultPadding * 0.5),
          margin: EdgeInsets.only(bottom: KDefaultPadding),
          // It will cover 20% of our total height
          height: size.height * 0.20,

          child: Container(
            padding: EdgeInsets.only(
              top: KDefaultPadding * 0.5,
              left: KDefaultPadding,
              right: KDefaultPadding,
              bottom: 36 + KDefaultPadding,
            ),
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: KPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Deepak Aggarwal',
                  style: Theme.of(context).textTheme.headline.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Container(
//                  constraints: BoxConstraints(minHeight: 150, minWidth: 100),
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/logo.jpeg'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
