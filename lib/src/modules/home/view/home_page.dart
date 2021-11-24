import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code_menu/create_qrcode_menu_view.dart';
import 'package:scannerqrcode_premium/src/modules/home/controller/home_controller.dart';
import 'package:scannerqrcode_premium/src/modules/readqrcode/view/read_qr_code_menu/read_qr_code_view.dart';
import 'package:scannerqrcode_premium/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode_premium/src/modules/settings/view/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SettingsCreateQRCode.getPreferencesColors();
    SettingsCreateQRCode.getPreferenceShape();
    SettingsCreateQRCode.getPreferencesLogo();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    HomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 35.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'homeToolTipView1'.tr(),
                onPressed: () => _pageController.animateToPage(0,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.decelerate),
                icon: ValueListenableBuilder(
                  valueListenable: HomeController.qrcodeButton,
                  builder: (BuildContext context, value, Widget? child) => Icon(
                      Icons.qr_code,
                      color: HomeController.qrcodeButton.value),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                tooltip: 'homeToolTipView2'.tr(),
                onPressed: () => _pageController.animateToPage(1,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.decelerate),
                icon: ValueListenableBuilder(
                  valueListenable: HomeController.createButton,
                  builder: (BuildContext context, value, Widget? child) => Icon(
                      Icons.border_color,
                      color: HomeController.createButton.value),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                tooltip: 'homeToolTipView3'.tr(),
                onPressed: () => _pageController.animateToPage(2,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.decelerate),
                icon: ValueListenableBuilder(
                  valueListenable: HomeController.settingsButton,
                  builder: (BuildContext context, value, Widget? child) => Icon(
                      Icons.settings,
                      color: HomeController.settingsButton.value),
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (valueControllerPage) =>
            HomeController.appBarControlleIconsColors(valueControllerPage),
        children: [
          const ReadQRCodePage(),
          const CreateQRCodeMenu(),
          SettingsPage(locale: context.locale)
        ],
      ),
    );
  }
}