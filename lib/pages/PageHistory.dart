import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:app/utils/icons.dart';
import 'package:app/widget/WidgetCardJobNormal.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PageHistory extends StatelessWidget {
  const PageHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: IconBack),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: marginSmallSmall,
            ),
            _getCalendarHistory(),
            _getResumido(),
            _getJobsHistory()
          ],
        ),
      ),
    );
  }

  _getJobsHistory() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        WidgetCardJobNormal(),
        WidgetCardJobNormal(),
        WidgetCardJobNormal(),
        WidgetCardJobNormal(),
        WidgetCardJobNormal(),
      ],
    );
  }

  _getCalendarHistory() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      height: 90,
      child: AnimatedHorizontalCalendar(
          tableCalenderIcon: IconCalendarWhite,
          date: DateTime.now(),
          unSelectedBoxShadow: BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
          selectedBoxShadow: BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
          textColor: colorBlackOpacity50,
          backgroundColor: Colors.white,
          tableCalenderThemeData: ThemeData.light().copyWith(
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          selectedColor: colorSecondary,
          onDateSelected: (date) {}),
    );
  }

  _getResumido() {
    return Container(
      margin: EdgeInsets.only(right: marginSmallSmall, left: marginSmallSmall),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: _getTotalJobs()),
          SizedBox(
            width: marginSmallSmall,
          ),
          Expanded(child: _getDinero()),
        ],
      ),
    );
  }

  _getTotalJobs() {
    return Container(
      padding: EdgeInsets.all(marginSmallSmall),
      decoration: BoxDecoration(
          color: colorPrimary, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Iconsax.car,
            size: 35,
            color: colorBlack,
          ),
          SizedBox(
            width: marginSmallSmall,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Trabajos",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: textMediumSmall,
                    color: colorBlackOpacity50,
                    fontWeight: FontWeight.w700),
              ),
              Text("10",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: colorBlack,
                      fontSize: textBigMedium,
                      fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }

  _getDinero() {
    return Container(
      padding: EdgeInsets.all(marginSmallSmall),
      decoration: BoxDecoration(
          color: colorSecondary, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Iconsax.dollar_circle,
            size: 35,
            color: colorBlack,
          ),
          SizedBox(
            width: marginSmallSmall,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ganancias",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: textMediumSmall,
                    color: colorBlackOpacity50,
                    fontWeight: FontWeight.w700),
              ),
              Text("\$ 30.25",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: colorBlack,
                      fontSize: textBigMedium,
                      fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
