import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sama/controller/add_new_teacher_controller.dart';
import 'package:sama/core/constants/app_colors.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/shared/custom_disconnect_contaniar.dart';

class ImageWithTitleInsideDetailsTeacher extends StatelessWidget {
  const ImageWithTitleInsideDetailsTeacher({
    super.key,
    this.width,
    this.height,
  });

  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Photo *",
          style: AppFontStyle.styleBold18(context),
        ),
        SizedBox(
          height: 16 * getScaleFactor(context),
        ),
        SizedBox(
          width: width,
          height: height,
          child: AspectRatio(
            aspectRatio: 1,
            child:
                GetBuilder<AddNewTeacherControllerImp>(builder: (controller) {
              return GestureDetector(
                onTap: controller.pickImage,
                onDoubleTap: controller.removeImage,
                child: DropTarget(
                  onDragDone: controller.dropImage,
                  child: controller.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            File(controller.image!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : CustomPaint(
                          painter: DashedRectPainter(
                            color: AppColors.darkGray,
                            dashSpace: 7,
                            dashWidth: 10,
                            strokeWidth: 1,
                            cornerRadius: 5,
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Drag and drop or\nclick here to\nselect file',
                                style: AppFontStyle.styleRegular14(context)
                                    .copyWith(color: AppColors.darkGray),
                              ),
                            ),
                          ),
                        ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
