import 'package:flutter/material.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code/components/base_for_form/base_for_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyFormContact extends BaseForm {
  BodyFormContact({Key? key}) : super(key: key);

  @override
  _BodyFormContactState createState() => _BodyFormContactState();
}

class _BodyFormContactState extends State<BodyFormContact> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerNumber =
      TextEditingController();

  @override
  void dispose() {
    _textEditingControllerName.dispose();
    _textEditingControllerNumber.dispose();
    super.dispose();
  }

  String _filterToCreateQrcodeContact() =>
      'MECARD:N:' +
      _textEditingControllerName.text +
      ';TEL:' +
      _textEditingControllerNumber.text +
      ';;';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.getKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
            child: TextFormField(
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'createQRCodeContactNameValidatorError'.tr();
                }
              },
              controller: _textEditingControllerName,
              decoration: InputDecoration(
                labelText: 'createQRCodeContactNameLabelDecorate'.tr() + ' ...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 30.w, right: 30.w),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'createQRCodeContactPhoneValidatorError'.tr();
                }
              },
              controller: _textEditingControllerNumber,
              decoration: InputDecoration(
                labelText:
                    'createQRCodeContactPhoneLabelDecorate'.tr() + ' ...',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: widget.makeButtoncreateQRCode(
                context: context, filter: _filterToCreateQrcodeContact),
          )
        ],
      ),
    );
  }
}