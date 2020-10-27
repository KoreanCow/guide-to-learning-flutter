import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.country,
    this.price,
    this.title,
  }) : super(key: key);

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: kDefaultPadding)),
        // Padding(padding: EdgeInsets.symmetric(horizontal: kDefaultPadding)),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "$title\n",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: country,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300))
          ]),
        ),
        Spacer(),
        Text(
          "\$$price",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: kPrimaryColor),
        ),
        Padding(padding: EdgeInsets.only(right: kDefaultPadding)),
      ],
    );
  }
}
