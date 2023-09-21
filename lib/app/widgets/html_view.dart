part of 'widgets.dart';

class HTMLViewer extends StatelessWidget {
  final String path;
  final Color textColor;

  const HTMLViewer({Key? key, required this.path, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        //privacy_policy or disclaimer
        future: loadAsset(context, path),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(right: 4.2.wp, left: 4.0.wp, top: 2.0.wp, bottom: 8.0.wp),
              child: Html(
                onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, _) {
                  Get.toNamed(AppRoutes.aboutPage);
                },
                data: snapshot.data.toString(),
                style: {
                  "img": Style(width: Width(50.0.wp), alignment: Alignment.center),
                  "div": Style(
                    color: textColor,
                    fontFamily: "poppins_medium",
                    fontSize: FontSize(3.2.wp),
                    letterSpacing: 0.5,
                    padding: EdgeInsets.zero,
                  ),
                  "h1": Style(
                    color: textColor,
                    fontFamily: "poppins_medium",
                    fontSize: FontSize(5.5.wp),
                    letterSpacing: 0.5,
                    padding: EdgeInsets.only(top: 2.5.wp, bottom: 0),
                  ),
                  "h2": Style(
                      color: textColor,
                      fontFamily: "poppins_medium",
                      fontSize: FontSize(4.3.wp),
                      letterSpacing: 0.5,
                      padding: EdgeInsets.only(top: 2.5.wp)),
                  "h3": Style(
                      color: textColor,
                      fontFamily: "poppins_medium",
                      fontSize: FontSize(3.6.wp),
                      letterSpacing: 0.5,
                      padding: EdgeInsets.only(top: 1.25.wp)),
                  "h4": Style(
                      color: textColor.withOpacity(0.95),
                      fontFamily: "poppins_medium",
                      fontSize: FontSize(3.5.wp),
                      wordSpacing: 0.5,
                      letterSpacing: 0.5),
                  "p": Style(color: textColor, fontFamily: "poppins_medium", textAlign: TextAlign.justify, wordSpacing: 0.25, letterSpacing: 0.25),
                  "mark": Style(
                    fontFamily: "poppins_medium",
                    textAlign: TextAlign.justify,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0.25,
                    letterSpacing: 0.25,
                  ),
                  "ol": Style(color: textColor, fontFamily: "poppins_medium"),
                  "ul": Style(color: textColor, fontFamily: "poppins_medium"),
                  "li": Style(color: textColor, fontFamily: "poppins_medium"),
                  "hr": Style(color: textColor, padding: EdgeInsets.zero),
                },
              ),
            );
          } else {
            return SizedBox(
              height: 14.0.wp,
              child: Center(
                child: SpinKitWave(
                  color: textColor,
                  size: 6.0.wp,
                ),
              ),
            );
          }
        });
  }

  Future<String> loadAsset(BuildContext context, String textAsset) async {
    String text = await rootBundle.loadString(textAsset);
    return text;
  }
}
