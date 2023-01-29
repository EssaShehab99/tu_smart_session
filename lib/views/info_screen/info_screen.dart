import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tu_smart_session/data/utils/utils.dart';
import 'package:tu_smart_session/views/shared/assets_variables.dart';
import 'package:tu_smart_session/views/shared/shared_components.dart';
import 'package:tu_smart_session/views/shared/shared_values.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        SharedComponents.appBar("About us"),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(SharedValues.padding),
          child: Column(
            children: [
              _buildMenuButton("About Taif University", () async {
                await Utils.launchUri(
                    "https://www.tu.edu.sa/Ar/%D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9%D8%A9/Pages/10007/%D9%86%D8%A8%D8%B0%D8%A9-%D8%B9%D9%86-%D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9%D8%A9");
              }),
              _buildMenuButton("Academic Calendar", () async {
                await Utils.launchUri(
                    "https://dar.tu.edu.sa/academic-calendar");
              }),
              _buildMenuButton("Electronic Services", () async {
                await Utils.launchUri("https://dar.tu.edu.sa/services");
              }),
            ],
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(AssetsVariable.facebook, () async {
              await Utils.launchUri(
                  "https://www.facebook.com/Taif-University-113898538651201/");
            }),
            _buildSocialButton(AssetsVariable.twitter, () async {
              await Utils.launchUri("https://twitter.com/TaifUniversity");
            }),
            _buildSocialButton(AssetsVariable.youtube, () async {
              await Utils.launchUri(
                  "https://www.youtube.com/user/TaifUniversity");
            }),
          ],
        )
      ],
    )));
  }

  Builder _buildMenuButton(String item, GestureTapCallback? onTap) {
    return Builder(builder: (context) {
      return Flexible(
          child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(SharedValues.padding),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 35,
                color: Theme.of(context).primaryColor,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: SharedValues.padding),
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.button,
                    ),
                  )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ));
    });
  }

  Widget _buildSocialButton(String item, GestureTapCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.all(SharedValues.padding * 2),
      child: CircleAvatar(
        child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTap,
            child: SvgPicture.asset(item)),
      ),
    );
  }
}
