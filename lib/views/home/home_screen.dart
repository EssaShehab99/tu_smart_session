import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tu_smart_session/data/providers/auth_provider.dart';
import '/views/advisor_screen/advisor_screen.dart';
import '/views/ask_cody_screen/ask_cody_screen.dart';
import '/views/map_screen/map_screen.dart';
import '/views/shared/assets_variables.dart';
import '/views/shared/button_widget.dart';
import '/views/shared/shared_components.dart';
import '/views/shared/shared_values.dart';
import '/views/wallet_screen/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //TODO: Uncomment
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedComponents.showOverlayLoading(context, ()async{
        await Provider.of<AuthProvider>(context,listen: false).getUserData();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SharedComponents.appBar("TU Smart Services",withUserOptions: true,),
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
                      text: "Campus Map",
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
                      text: "Ask Cody", image: AssetsVariable.bot),
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
                      text: "Academic Advisor Communication Session",
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
                        Center(child: Text(text, style: Theme.of(context).textTheme.button,textAlign: TextAlign.center,)),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
