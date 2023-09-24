import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/utils/utils.dart';
import 'package:dikitis/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
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
        Future.delayed(40.milliseconds, () {
          SharedMethod.systemBarColor(AppStyles.colors.transparent, AppStyles.colors.bgDark);
        });

        return Future<bool>.value(true);
      },
      child: Scaffold(
        backgroundColor: AppStyles.colors.bgDark,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0.wp).copyWith(top: 11.0.wp),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0.wp),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Divider(
                          height: 2,
                          color: AppStyles.colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text(
                            "Application",
                            style: AppStyles.textStyles.poppinsBold.copyWith(color: AppStyles.colors.white, fontSize: 6.0.wp),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Divider(
                          height: 2,
                          color: AppStyles.colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                //Versi
                ListItem(
                  isNavigate: true,
                  function: () {
                    Get.toNamed(AppRoutes.legalNote, arguments: AssetsPath.html.changelogs);
                  },
                  icon: Icons.adb_rounded,
                  text: "Ver 1.0.0 (Changelog)",
                ),

                //Credit
                ListItem(
                  function: () {
                    Get.toNamed(AppRoutes.creditPage);
                  },
                  icon: Icons.copyright_rounded,
                  text: "Credits",
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 5.0.wp),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Divider(
                          height: 2,
                          color: AppStyles.colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(
                            "Legal Note",
                            style: AppStyles.textStyles.poppinsBold.copyWith(color: AppStyles.colors.white, fontSize: 6.0.wp),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Divider(
                          height: 2,
                          color: AppStyles.colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                //Disclaimer
                ListItem(
                  function: () {
                    Get.toNamed(AppRoutes.legalNote, arguments: AssetsPath.html.disclaimer);
                  },
                  icon: Icons.campaign_outlined,
                  text: "Disclaimer",
                ),

                //Privacy Policy
                ListItem(
                  function: () {
                    Get.toNamed(AppRoutes.legalNote, arguments: AssetsPath.html.requiredPermission);
                  },
                  icon: Icons.perm_device_info,
                  text: "Required Permission",
                ),

                //Privacy Policy
                ListItem(
                  function: () {
                    Get.toNamed(AppRoutes.legalNote, arguments: AssetsPath.html.privacyPolicy);
                  },
                  icon: Icons.privacy_tip_outlined,
                  text: "Privacy Policy",
                ),

                //TOS
                ListItem(
                  function: () {
                    Get.toNamed(AppRoutes.legalNote, arguments: AssetsPath.html.termOfUser);
                  },
                  icon: Icons.toc,
                  text: "Term of Use",
                ),

                //Atributtion
                ListItem(
                  function: () {
                    Get.toNamed(
                      AppRoutes.attributionPage,
                    );
                  },
                  icon: Icons.drive_file_rename_outline_rounded,
                  text: "Open Source Software Attributions",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
