import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/views/advisor_screen/advisor_screen.dart';
import '/views/ask_cody_screen/ask_cody_screen.dart';
import '/views/map_screen/map_screen.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/wallet_screen/wallet_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SharedComponents.appBar("TU Smart Session",withUserOptions: true,),
          const SizedBox(height: SharedValues.padding*3),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: _buildButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapScreen()));
                      },
                      text: "Interactive Map",
                      image: AssetsVariable.map),
                ),
                Expanded(
                  child: _buildButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AskCodyScreen()));

                      },
                      text: "Cody Chatbot", image: AssetsVariable.bot),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: _buildButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdvisorScreen()));

                      },
                      text: "Academic Advisor",
                      image: AssetsVariable.support),
                ),
                Expanded(
                  child: _buildButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WalletScreen()));

                      },
                      text: "Digital Wallet", image: AssetsVariable.wallet),
                ),
              ],
            ),
          ),
          const SizedBox(height: SharedValues.padding*3),
        ],
      ),
    ));
  }

  Widget _buildButtonWidget(
      {required String image, required String text, VoidCallback? onPressed}) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(SharedValues.padding),
        child: ButtonWidget(
            withBorder: true,
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(SharedValues.padding),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: SvgPicture.asset(
                          height: 100,
                          width: 100,
                          fit: BoxFit.scaleDown,
                          image)),
                  Expanded(
                    child:
                        Text(text, style: Theme.of(context).textTheme.button),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
