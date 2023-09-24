import 'package:auto_size_text/auto_size_text.dart';
import 'package:dikitis/app/modules/attribution/views/component/custom_rect_tween.dart';
import 'package:dikitis/app/modules/attribution/views/component/hero_dialog_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class AttributionPage extends StatefulWidget {
  const AttributionPage({Key? key}) : super(key: key);

  @override
  AttributionPageState createState() => AttributionPageState();
}

class AttributionPageState extends State<AttributionPage> {
  List<Map<String, dynamic>> data = [];

  Future<List<Map<String, dynamic>>> getData() async {
    List<String> licenseData = [
      "assets/texts/license/auto_size_text.txt",
      "assets/texts/license/awesome_notifications.txt",
      "assets/texts/license/connectivity_plus.txt",
      "assets/texts/license/cupertino_icons.txt",
      "assets/texts/license/delayed_widget.txt",
      "assets/texts/license/dotted_border.txt",
      "assets/texts/license/double_back_to_close.txt",
      "assets/texts/license/extended_image.txt",
      "assets/texts/license/flutter_carousel_slider.txt",
      "assets/texts/license/flutter_image_compress.txt",
      "assets/texts/license/flutter_launcher_icons.txt",
      "assets/texts/license/flutter_lints.txt",
      "assets/texts/license/flutter_spinkit.txt",
      "assets/texts/license/get.txt",
      "assets/texts/license/get_storage.txt",
      "assets/texts/license/http.txt",
      "assets/texts/license/image_cropper.txt",
      "assets/texts/license/image_picker.txt",
      "assets/texts/license/intl.txt",
      "assets/texts/license/lottie.txt",
      "assets/texts/license/permission_handler.txt",
      "assets/texts/license/pin_code_fields.txt",
    ];

    List<String> urlData = [
      "assets/texts/url/auto_size_text.txt",
      "assets/texts/url/awesome_notifications.txt",
      "assets/texts/url/connectivity_plus.txt",
      "assets/texts/url/cupertino_icons.txt",
      "assets/texts/url/delayed_widget.txt",
      "assets/texts/url/dotted_border.txt",
      "assets/texts/url/double_back_to_close.txt",
      "assets/texts/url/extended_image.txt",
      "assets/texts/url/flutter_carousel_slider.txt",
      "assets/texts/url/flutter_image_compress.txt",
      "assets/texts/url/flutter_launcher_icons.txt",
      "assets/texts/url/flutter_lints.txt",
      "assets/texts/url/flutter_spinkit.txt",
      "assets/texts/url/get.txt",
      "assets/texts/url/get_storage.txt",
      "assets/texts/url/http.txt",
      "assets/texts/url/image_cropper.txt",
      "assets/texts/url/image_picker.txt",
      "assets/texts/url/intl.txt",
      "assets/texts/url/lottie.txt",
      "assets/texts/url/permission_handler.txt",
      "assets/texts/url/pin_code_fields.txt",
    ];

    for (var i = 0; i < licenseData.length; i++) {
      // print("license length : ${licenseData.length}");
      // print("i length : $i");

      String licenseText = await rootBundle.loadString(licenseData[i]);
      String urlText = await rootBundle.loadString(urlData[i]);
      String basename = basenameWithoutExtension(urlData[i]);
      data.add({"name": basename, "license": licenseText, "url": urlText});
    }

    return data;
  }

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(AppStyles.colors.bgDark, AppStyles.colors.bgDark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.colors.bgDark,
      body: WillPopScope(
        onWillPop: () {
          SharedMethod.systemBarColor(AppStyles.colors.bgDark, AppStyles.colors.bgDark);
          return Future<bool>.value(true);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10.0.wp, bottom: 2.0.wp),
          margin: EdgeInsets.symmetric(
            horizontal: 6.0.wp,
          ),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: FutureBuilder(
                future: getData(),
                builder: (context, projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.done) {
                    return RawScrollbar(
                      thumbColor: AppStyles.colors.transparent,
                      thumbVisibility: true,
                      thickness: 4,
                      child: ListView.builder(
                        itemCount: data.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CardList(data: data[index]);
                        },
                      ),
                    );
                  } else {
                    return SpinKitWave(
                      color: AppStyles.colors.white,
                      size: 6.0.wp,
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}

class CardList extends StatefulWidget {
  final Map<String, dynamic> data;

  const CardList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(child: PopupCard(information: widget.data)),
          ),
        );
      },
      child: Hero(
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin!, end: end!);
        },
        tag: widget.data["name"].toString(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0.wp),
          child: Material(
            color: AppStyles.colors.white,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: EdgeInsets.all(3.0.wp),
              margin: EdgeInsets.all(3.0.wp),
              child: Text(
                widget.data["name"].toString(),
                style: AppStyles.textStyles.poppinsBold.copyWith(fontSize: 3.5.wp, color: AppStyles.colors.bgDark.withOpacity(0.85)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PopupCard extends StatefulWidget {
  final Map<String, dynamic> information;

  const PopupCard({
    Key? key,
    required this.information,
  }) : super(key: key);

  @override
  State<PopupCard> createState() => _PopupCardState();
}

class _PopupCardState extends State<PopupCard> {
  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(AppStyles.colors.transparent, AppStyles.colors.bgDark);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        Future.delayed(185.milliseconds, () {
          SharedMethod.systemBarColor(AppStyles.colors.transparent, AppStyles.colors.bgDark);
        });

        return Future<bool>.value(true);
      },
      child: Hero(
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin!, end: end!);
        },
        tag: widget.information["name"].toString(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 4.0.wp),
          margin: EdgeInsets.only(top: 8.0.wp, bottom: 4.0.wp),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            color: AppStyles.colors.white,
            child: Container(
              padding: EdgeInsets.all(4.0.wp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0.wp,
                    ),
                    Text(
                      widget.information["license"].toString(),
                      style: AppStyles.textStyles.poppinsMedium
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 3.0.wp, color: AppStyles.colors.bgDark.withOpacity(0.9)),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0.wp, bottom: 2.0.wp),
                      padding: EdgeInsets.symmetric(vertical: 4.0.wp, horizontal: 4.0.wp),
                      decoration: BoxDecoration(
                        color: AppStyles.colors.bgDark.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: AutoSizeText(
                        widget.information["url"].toString(),
                        style: AppStyles.textStyles.poppinsBold.copyWith(
                          color: AppStyles.colors.white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
