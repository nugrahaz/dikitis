part of 'widgets.dart';

class NoConnectionDialog extends StatefulWidget {
  final Color? colorStatusBar;
  final Color? colorNavigationBar;

  const NoConnectionDialog({
    Key? key,
    this.colorStatusBar = Colors.transparent,
    this.colorNavigationBar = Colors.transparent,
  }) : super(key: key);

  @override
  State<NoConnectionDialog> createState() => _NoConnectionDialogState();
}

class _NoConnectionDialogState extends State<NoConnectionDialog> {
  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(widget.colorStatusBar!, widget.colorNavigationBar!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppStyles.colors.bgDark.withOpacity(0.1),
                AppStyles.colors.bgDark.withOpacity(0.2),
                AppStyles.colors.bgDark.withOpacity(0.3),
                AppStyles.colors.bgDark.withOpacity(0.45),
                AppStyles.colors.bgDark.withOpacity(0.6),
                AppStyles.colors.bgDark,
              ],
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(color: AppStyles.colors.white, borderRadius: const BorderRadius.all(Radius.circular(16))),
              margin: EdgeInsets.symmetric(horizontal: 12.5.wp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(1.0.wp),
                      padding: EdgeInsets.all(1.0.wp),
                      decoration: BoxDecoration(color: AppStyles.colors.bgDark, borderRadius: const BorderRadius.all(Radius.circular(16))),
                      child: Lottie.asset(AssetsPath.lotties.noConnection,
                          fit: BoxFit.cover, addRepaintBoundary: false, filterQuality: FilterQuality.low),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6.0.wp, bottom: 7.0.wp, right: 6.0.wp, left: 6.0.wp),
                    child: Text(
                      "Mohon cek kembali koneksi internet Anda",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: AppStyles.colors.bgDark.withOpacity(0.8), fontSize: 4.2.wp, letterSpacing: 0.8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
