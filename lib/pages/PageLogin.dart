import 'package:app/models/UpperCaseTextFormatter.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/dimens.dart';
import 'package:app/utils/icons.dart';
import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  PageLogin({super.key});

  String oStringPhone = "";

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/loginbck.png',
            repeat: ImageRepeat.noRepeat,
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          _getBodyLogin(context),
        ],
      ),
    );
  }

  _getBodyLogin(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.all(marginSmall),
      margin: EdgeInsets.only(
          right: marginSmallSmall,
          left: marginSmallSmall,
          top: MediaQuery.of(context).size.height * 0.28),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TextStyle(fontSize: textBig, color: colorBlack),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Iniciar ',
                      style: TextStyle(
                          fontSize: textBig,
                          color: colorBlack,
                          fontWeight: FontWeight.w800)),
                  TextSpan(
                      text: 'Sesión',
                      style: TextStyle(fontSize: textBig, color: colorBlack)),
                ],
              ),
            ),
            SizedBox(
              height: marginSmall,
            ),
            TextField(
              maxLines: 1,
              keyboardType: TextInputType.text,
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              autocorrect: false,
              cursorColor: colorPrimary,
              maxLength: 8,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    widget.oStringPhone = value;
                  });
                }
              },
              decoration: InputDecoration(
                  counterText: "",
                  hintText: "Ingrese su placa vehicular",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: colorGrey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorGrey)),
                  prefixIcon: IconPlacaVehicular,
                  suffixIcon: widget.oStringPhone.isEmpty
                      ? null
                      : Icon(
                          Icons.cancel_rounded,
                          color: colorBlackOpacity30,
                        ),
                  suffixIconColor: colorBlackOpacity30),
            ),
            SizedBox(
              height: marginSmallSmall,
            ),
            TextField(
              maxLines: 1,
              keyboardType: TextInputType.text,
              autocorrect: false,
              obscureText: true,
              cursorColor: colorPrimary,
              onChanged: (value) {},
              decoration: InputDecoration(
                  prefixIcon: IconPassword,
                  suffixIcon: IconShowPassword,
                  hintText: "Ingrese su contraseña",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: colorGrey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorGrey))),
            ),
            SizedBox(
              height: marginMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("home");
              },
              child: Text(
                "CONTINUAR",
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
    );
  }
}
