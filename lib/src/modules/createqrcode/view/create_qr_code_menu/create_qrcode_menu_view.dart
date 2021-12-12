import 'package:flutter/material.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/controller/create_qr_code_menu/create_qrcode_menu_controller.dart';
import 'package:scannerqrcode_premium/src/modules/createqrcode/view/create_qr_code_menu/components/create_qrcode_menu_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateQRCodeMenu extends StatelessWidget {
  const CreateQRCodeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: MenuItens.allOptionsQRCodeCreate(context).length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 22.sp,
        ),
        itemBuilder: (context, index) => CreateQRCodeItemMenu(
          typeQRCode: MenuItens.allOptionsQRCodeCreate(context)[index]
              ['typeQRCode'],
          icon: MenuItens.allOptionsQRCodeCreate(context)[index]['icon'],
          text: MenuItens.allOptionsQRCodeCreate(context)[index]['text'],
          color: MenuItens.allOptionsQRCodeCreate(context)[index]['color'],
        ),
      ),
    );
  }
}
