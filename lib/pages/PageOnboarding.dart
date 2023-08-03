import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class PageOnboarding extends StatelessWidget {
  const PageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        totalPage: 3,
        finishButtonText: 'EMPEZEMOS',
        onFinish: () {
          Navigator.of(context).pushNamed("home");
        },
        skipTextButton: Text(
          'Saltar',
          style: TextStyle(color: colorGrey, fontWeight: FontWeight.bold),
        ),
        headerBackgroundColor: Color.fromARGB(255, 231, 58, 58),
        background: _getBackgroundOnboarding(context),
        speed: 1.8,
        pageBodies: [
          Container(),
          Container(),
          Container(),
        ]);
  }

  _getTextBody(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: textBig,
              fontWeight: FontWeight.w500,
              color: colorBlack),
        ),
        Text(subtitle,
            style: TextStyle(fontSize: textMedium, color: colorBlack))
      ],
    );
  }

  _getBackgroundOnboarding(BuildContext context) {
    return [
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/onboarding/acceptjob.png",
                alignment: Alignment.center,
              ),
              height: MediaQuery.of(context).size.height * 0.65,
            ),
            _getTextBody('Aceptar un Trabajo', 'Loren Lorem Lorem'),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/onboarding/trackingrealtime.png",
                alignment: Alignment.center,
              ),
              height: MediaQuery.of(context).size.height * 0.65,
            ),
            _getTextBody('Seguimiento en Tiempo Real', 'Loren Lorem Lorem'),
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/onboarding/earnmoney.png",
                alignment: Alignment.center,
              ),
              height: MediaQuery.of(context).size.height * 0.65,
            ),
            _getTextBody('Ganar Dinero', 'Loren Lorem Lorem'),
          ],
        ),
      ),
    ];
  }
}
