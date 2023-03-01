import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:app/widget/WidgetCircleAvatar.dart';
import 'package:flutter/material.dart';

class WidgetReceivedMessages extends StatelessWidget {
  final int i;
  const WidgetReceivedMessages({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: marginSmallSmall, left: marginSmallSmall, top: 7.0),
      child: Row(
        children: <Widget>[
          WidgetCircleAvatar(
            imgUrl:
                "https://res.cloudinary.com/virtualcode7/image/upload/v1673230081/user_sspwdj.jpg",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Usuario",
                style: Theme.of(context).textTheme.caption,
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xfff9f9f9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.",
                  style: TextStyle(color: colorBlack),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Text(
            "10:01",
            style: TextStyle(color: colorBlackOpacity50),
          ),
        ],
      ),
    );
  }
}
