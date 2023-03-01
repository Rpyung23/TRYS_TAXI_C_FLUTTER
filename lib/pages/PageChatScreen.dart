import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:app/utils/icons.dart';
import 'package:app/widget/WidgetCircleAvatar.dart';
import 'package:app/widget/WidgetReceivedMessages.dart';
import 'package:app/widget/WidgetSendMessages.dart';
import 'package:flutter/material.dart';

class PageChatScreen extends StatefulWidget {
  @override
  _PageChatScreenState createState() => _PageChatScreenState();
}

class _PageChatScreenState extends State<PageChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: IconBack),
        title: Text(
          "Cybdom Tech",
          overflow: TextOverflow.clip,
          style: TextStyle(color: colorBlack, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: IconMessagePhone,
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: [
                Expanded(child: _getChatList()),
                Container(
                  margin: EdgeInsets.all(marginSmallSmall),
                  alignment: Alignment.center,
                  height: 72,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(
                        height: marginSmallSmall,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 5,
                                      color: colorBlackOpacity20)
                                ],
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: marginSmallSmall,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: "Escribir...",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  IconButton(
                                    icon: IconMessageCamera,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          CircleAvatar(
                            child: IconMessageSend,
                            backgroundColor: colorPrimary,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _getChatList() {
    return ListView(
      children: [
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2),
        WidgetReceivedMessages(
          i: 1,
        ),
        WidgetSendMessages(i: 2)
      ],
    );
  }
}
