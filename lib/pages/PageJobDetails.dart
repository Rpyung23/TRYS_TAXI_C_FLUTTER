import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class PageJobDetails extends StatelessWidget {
  const PageJobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        elevation: 1,
        leading: IconButton(onPressed: () {}, icon: IconBack),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(right: marginSmallSmall, left: marginSmallSmall),
          child: _getTicket(context),
        ),
      ),
    );
  }

  _getTicket(BuildContext context) {
    return TicketWidget(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(marginSmall + 5),
      margin: EdgeInsets.all(0),
      height: 550,
      isCornerRounded: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
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
                            fontWeight: FontWeight.w600),
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
                              fontWeight: FontWeight.w600)),
                      Text("2.2 KM",
                          style: TextStyle(
                              fontSize: textMedium,
                              color: colorBlackOpacity50,
                              fontWeight: FontWeight.w600))
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
                    "RECOGER",
                    style: TextStyle(
                        color: colorBlackOpacity50,
                        fontSize: textMedium,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("Ignacio Flores y Gaspar de Escalona",
                      maxLines: 2,
                      style: TextStyle(
                          color: colorBlackOpacity90,
                          fontSize: textBigMedium,
                          fontWeight: FontWeight.w600))
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
                    "ENTREGAR",
                    style: TextStyle(
                        color: colorBlackOpacity50,
                        fontSize: textMedium,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("Terminal Terrestre Centro de Riobamba",
                      maxLines: 2,
                      style: TextStyle(
                          color: colorBlackOpacity90,
                          fontSize: textBigMedium,
                          fontWeight: FontWeight.w600))
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
                    "NOTAS",
                    style: TextStyle(
                        color: colorBlackOpacity50,
                        fontSize: textMedium,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                      "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.",
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: colorBlackOpacity90,
                          fontSize: textBigMedium,
                          fontWeight: FontWeight.w600))
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
                    "TARIFA DE VIAJE",
                    style: TextStyle(
                        color: colorBlackOpacity50,
                        fontSize: textMedium,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: Text("SubTotal",
                              maxLines: 4,
                              style: TextStyle(
                                  color: colorBlackOpacity90,
                                  fontSize: textBigMedium,
                                  fontWeight: FontWeight.w600))),
                      Expanded(
                          child: Text("\$ 15.00",
                              maxLines: 4,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: colorBlackOpacity90,
                                  fontSize: textBigMedium,
                                  fontWeight: FontWeight.w600)))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: Text("Descuento",
                              maxLines: 4,
                              style: TextStyle(
                                  color: colorBlackOpacity90,
                                  fontSize: textBigMedium,
                                  fontWeight: FontWeight.w600))),
                      Expanded(
                          child: Text("\$ 0.00",
                              maxLines: 4,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: colorBlackOpacity90,
                                  fontSize: textBigMedium,
                                  fontWeight: FontWeight.w600)))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: Text("Monto de pago",
                              maxLines: 4,
                              style: TextStyle(
                                  color: colorBlackOpacity90,
                                  fontSize: textBigMedium,
                                  fontWeight: FontWeight.w600))),
                      Expanded(
                          child: Text("\$ 15.00",
                              maxLines: 4,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: colorBlackOpacity90,
                                  fontSize: textBigMedium,
                                  fontWeight: FontWeight.w600)))
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
