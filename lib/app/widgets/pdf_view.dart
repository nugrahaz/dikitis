import 'package:delayed_widget/delayed_widget.dart';
import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFView extends StatelessWidget {
  final String path;

  const PDFView({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.colors.bgDark,
      body: SafeArea(
        child: Stack(
          children: [
            PdfViewer.openAsset(
              path,
              params: const PdfViewerParams(panEnabled: true, scaleEnabled: false), // show the page-2
            ),
            DelayedWidget(
              delayDuration: const Duration(milliseconds: 1200),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 7.5.wp),
                    padding: EdgeInsets.all(3.0.wp),
                    // height: 15.0.wp,
                    decoration: BoxDecoration(color: AppStyles.colors.bgDark.withOpacity(0.9), shape: BoxShape.circle),
                    child: Icon(
                      Icons.close_sharp,
                      color: AppStyles.colors.white,
                      size: 9.0.wp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
