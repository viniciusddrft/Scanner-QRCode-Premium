import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/controller/create_qr_code/create_qr_code_controller.dart';
import 'package:scannerqrcode_premium/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:screenshot/screenshot.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateQRCodeResult extends StatefulWidget {
  final String dataQRCode;

  const CreateQRCodeResult({required this.dataQRCode, Key? key})
      : super(key: key);

  @override
  _CreateQRCodeResultState createState() => _CreateQRCodeResultState();
}

class _CreateQRCodeResultState extends State<CreateQRCodeResult> {
  final ScreenshotController _screenshotController = ScreenshotController();

  void _popupQRCodeSave() {
    Future.delayed(
        const Duration(milliseconds: 500), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('createResultQrPopupSave'.tr() + ' !'),
      ),
    );
  }

  void _popupError() {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('createResultQrPopupError'.tr() + ' :/'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
        title: Text('createResultQRCodeAppBarTitle'.tr()),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: _screenshotController,
              child: QrImage(
                padding: EdgeInsets.all(10.sp),
                version: QrVersions.auto,
                data: widget.dataQRCode,
                size: 220.sp,
                backgroundColor: SettingsCreateQRCode.colorQRBackground.value,
                eyeStyle: QrEyeStyle(
                    color: SettingsCreateQRCode.colorQRCodeEye.value,
                    eyeShape: SettingsCreateQRCode.shapeQRCodeEye.value),
                dataModuleStyle: QrDataModuleStyle(
                    color: SettingsCreateQRCode.colorQRCode.value,
                    dataModuleShape: SettingsCreateQRCode.shapeQRCode.value),
                embeddedImage: SettingsCreateQRCode.logoPath.value != null
                    ? FileImage(
                        File(SettingsCreateQRCode.logoPath.value as String),
                      )
                    : null,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async =>
                        await CreateQrCodeController.isTheImageQRSaved(
                                _screenshotController)
                            ? _popupQRCodeSave()
                            : _popupError(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 95.w,
                          child: Center(
                            child: Text(
                              'createResultQrCodeButtonSave'.tr(),
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.save,
                          size: 24.sp,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => CreateQrCodeController.shareImageQr(
                        _screenshotController),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 95.w,
                          child: Center(
                            child: Text(
                              'createResultQrCodeButtonShare'.tr(),
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.share,
                          size: 24.sp,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
