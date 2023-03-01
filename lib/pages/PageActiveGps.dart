import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

class PagePermisosLocation extends StatelessWidget {
  const PagePermisosLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_rounded,
              color: colorBlack,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(altoSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getBody(context),
            ElevatedButton(
              onPressed: () async {
                bool isLocation = await Geolocator.isLocationServiceEnabled();
                if (!isLocation) {
                  Geolocator.openLocationSettings();
                } else {
                  print("GPS IS ACTIVE");
                }
              },
              child: Text(
                "USAR MI UBICACION",
                style: TextStyle(
                    fontSize: textMedium, fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorBlack,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            )
          ],
        ),
      ),
    ));
  }

  _getBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/location.json',
          width: 250,
          height: 250,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: marginSmall,
        ),
        Text(
          "Habilita Tu Ubicación",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: textBig),
        ),
        SizedBox(
          height: marginSmallSmall,
        ),
        Text(
            "Elija su ubicación actual para comenzar a encontrar la solicitud a su alrededor.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: textMedium)),
      ],
    );
  }
}
