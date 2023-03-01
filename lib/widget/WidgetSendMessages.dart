import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:flutter/material.dart';

class WidgetSendMessages extends StatelessWidget {
  final int i;
  const WidgetSendMessages({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: marginSmallSmall, left: marginSmallSmall, top: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "11:10",
            style: TextStyle(color: colorBlackOpacity50),
          ),
          SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño.",
              style: TextStyle(color: colorBlack),
            ),
          ),
        ],
      ),
    );
  }
}
