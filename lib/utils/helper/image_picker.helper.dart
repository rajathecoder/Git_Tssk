import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/style.util.dart';

class CustomImagePicker {
  CustomImagePicker._();
  static Future<XFile?> pickImage({required BuildContext context, bool? cameraOnly}) async {
    XFile? file;
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }

    if(cameraOnly == true) {
      final picker = ImagePicker();
      XFile? pImage = await picker.pickImage(
          source: ImageSource.camera, imageQuality: 70);
      file = pImage;
      return file;
    }
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 110.sp,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.sp, top: 8.sp),
                      child: Text('Choose',
                          style: Style.textStyles.primary(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.sp, top: 20.sp, bottom: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              XFile? pImage = await picker.pickImage(
                                  source: ImageSource.camera, imageQuality: 70);
                              Navigator.pop(ctx);
                              file = pImage;
                            },
                            child: Image.asset(
                              'assets/images/camera.png',
                              scale: 10,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              XFile? pImage = await picker.pickImage(
                                  source: ImageSource.camera, imageQuality: 70);
                              Navigator.pop(ctx);
                              file = pImage;
                            },
                            child: Text('Camera',
                                style: Style.textStyles.primary(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9.sp,
                                )),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          if(cameraOnly != true)
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pImage = await picker.pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 70);
                              Navigator.pop(ctx);
                              file = pImage;
                            },
                            child: Image.asset(
                              'assets/images/gallery.png',
                              scale: 10,
                            ),
                          ),
                           if(cameraOnly != true)
                          SizedBox(
                            width: 2.w,
                          ),
                           if(cameraOnly != true)
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pImage = await picker.pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 70);
                              Navigator.pop(ctx);
                              file = pImage;
                            },
                            child: Text(
                              'Gallery',
                              style: Style.textStyles.primary(
                                fontWeight: FontWeight.w500,
                                fontSize: 9.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });

    return file;
  }
}
