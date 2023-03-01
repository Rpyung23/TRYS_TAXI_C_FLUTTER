import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageJobs extends StatefulWidget {
  const PageJobs({super.key});

  @override
  State<PageJobs> createState() => _PageJobsState();
}

class _PageJobsState extends State<PageJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: colorBlack,
            )),
      ),
      body: Container(
        child: ListView(
          children: [
            _getCardJobs(),
            _getCardJobs(),
            _getCardJobs(),
            _getCardJobs(),
            _getCardJobs()
          ],
        ),
      ),
    );
  }

  _getCardSinJobs() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: marginSmall, left: marginSmall),
      child: Column(
        children: [
          Lottie.asset(
            'assets/empity.json',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: marginSmallSmall,
          ),
          Text(
            "Actualmente no existen carreras disponibles.",
            style: TextStyle(fontSize: textBigMedium),
          )
        ],
      ),
    );
  }

  _getCardJobs() {
    return Container(
      padding: EdgeInsets.all(marginSmallSmall),
      margin: EdgeInsets.only(
          top: marginSmallSmall,
          right: marginSmallSmall,
          left: marginSmallSmall),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/user.jpeg",
                      fit: BoxFit.cover,
                    ),
                    height: 70,
                    width: 65,
                    clipBehavior: Clip.antiAlias,
                  ),
                  SizedBox(
                    width: marginSmallSmall,
                  ),
                  Text(
                    "Esther Berry",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorBlack,
                        fontSize: textBigMedium,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\$25.00",
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: textBigMedium,
                          fontWeight: FontWeight.bold)),
                  Text("2.2 KM",
                      style: TextStyle(
                          fontSize: textMedium,
                          color: colorBlackOpacity50,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          SizedBox(
            height: marginSmallSmall,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recoger",
                style: TextStyle(
                    color: colorBlackOpacity50,
                    fontSize: textMedium,
                    fontWeight: FontWeight.bold),
              ),
              Text("Ignacio Flores y Gaspar de Escalona",
                  maxLines: 2,
                  style: TextStyle(
                      color: colorBlackOpacity90,
                      fontSize: textBigMedium,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: marginSmallSmall,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Entregar",
                style: TextStyle(
                    color: colorBlackOpacity50,
                    fontSize: textMedium,
                    fontWeight: FontWeight.bold),
              ),
              Text("Terminal Terrestre - Riobamba",
                  maxLines: 2,
                  style: TextStyle(
                      color: colorBlackOpacity90,
                      fontSize: textBigMedium,
                      fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: marginSmallSmall,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "ACEPTAR",
              style: TextStyle(
                  fontSize: textMedium,
                  fontWeight: FontWeight.w700,
                  color: colorBlackOpacity90),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: colorPrimary,
                minimumSize: Size(MediaQuery.of(context).size.width, 50)),
          )
        ],
      ),
    );
  }
}
