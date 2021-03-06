import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../settings/settings_qrcode/controller/settings_create_qrcode.dart';
import '../create_qr_code/controller/create_qr_code_controller.dart';

class CreateQRCodeResult extends StatefulWidget {
  final String dataQRCode;

  const CreateQRCodeResult({required this.dataQRCode, super.key});

  @override
  State<CreateQRCodeResult> createState() => _CreateQRCodeResultState();
}

class _CreateQRCodeResultState extends State<CreateQRCodeResult> {
  final ScreenshotController screenshotController = ScreenshotController();
  late final CreateQrCodeController _createQrCodeController;

  @override
  void initState() {
    _createQrCodeController = CreateQrCodeController(
      context,
      screenshotController: screenshotController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.createResultQRCodeAppBarTitle),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotController,
              child: QrImage(
                padding: EdgeInsets.all(
                  size.height * 0.013,
                ),
                version: QrVersions.auto,
                data: widget.dataQRCode,
                size: size.height * 0.25,
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
              padding: EdgeInsets.only(
                left: size.width * 0.09,
                right: size.width * 0.09,
                top: size.height * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: _createQrCodeController.saveImageQR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.045,
                          width: size.width * 0.25,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .createResultQrCodeButtonSave,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.save,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: _createQrCodeController.shareImageQr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.045,
                          width: size.width * 0.25,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .createResultQrCodeButtonShare,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.share,
                          size: 24,
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
