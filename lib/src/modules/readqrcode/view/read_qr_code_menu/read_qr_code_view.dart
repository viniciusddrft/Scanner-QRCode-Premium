import 'package:flutter/material.dart';
import 'package:scannerqrcode_premium/src/modules/readqrcode/controller/read_qr_code_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode_premium/src/shared/themes/text_themes.dart';

class ReadQRCodePage extends StatefulWidget {
  const ReadQRCodePage({Key? key}) : super(key: key);
  @override
  _ReadQRCodePageState createState() => _ReadQRCodePageState();
}

class _ReadQRCodePageState extends State<ReadQRCodePage> {
  void popupError() {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text('Error  :/'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/logo.png',
          height: 220.sp,
          width: 220.sp,
        ),
        Text(
          'Scanner QRCode Premium',
          style: AppTextThemes.nameApp,
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async => ReadQrCodeController.scanCamera(context),
              child: SizedBox(
                height: 40.h,
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .readQRCodeTextButtonReadCamera,
                      style: AppTextThemes.readQrcodeButtons,
                    ),
                    Icon(
                      Icons.camera_alt,
                      size: 24.sp,
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async =>
                  ReadQrCodeController.scanFile(context, popupError),
              child: SizedBox(
                height: 40.h,
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .readQRCodeTextButtonReadGallery,
                      style: AppTextThemes.readQrcodeButtons,
                    ),
                    Icon(
                      Icons.photo,
                      size: 24.sp,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
