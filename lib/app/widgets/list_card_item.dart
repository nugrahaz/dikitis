part of 'widgets.dart';

// dipakai di homescreen

class ListCardItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;
  final Function()? function;

  const ListCardItem({Key? key, this.function, this.title = "", this.description = "", @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 2.5.wp,
        ),
        decoration: BoxDecoration(
          color: AppStyles.colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(4.0.wp),
            bottomLeft: Radius.circular(4.0.wp),
            topLeft: Radius.circular(4.0.wp),
            topRight: Radius.circular(4.0.wp),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(right: 4.0.wp, left: 2.25.wp, top: description == "" ? 3.0.wp : 0, bottom: description == "" ? 3.0.wp : 0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Hero(
                  tag: imagePath!,
                  child: Image.asset(
                    imagePath!,
                    height: 20.0.wp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0.wp,
                    bottom: 5.0.wp,
                    right: description == "" ? 4.5.wp : 2.5.wp,
                    left: description == "" ? 2.5.wp : 0.5.wp,
                  ),
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppStyles.colors.bgDark,
                    width: 1,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: AppStyles.colors.transparent,
                          padding: EdgeInsets.only(bottom: description == "" ? 0 : 2.0.wp),
                          child: Text(
                            title!,
                            textAlign: TextAlign.start,
                            maxLines: description == "" ? 3 : 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.textStyles.poppinsBold.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: description == "" ? 4.2.wp : 3.9.wp,
                              letterSpacing: 0.5,
                              color: AppStyles.colors.bgDark.withOpacity(0.85),
                            ),
                          ),
                        ),
                        description == ""
                            ? const SizedBox()
                            : SizedBox(
                                child: Text(
                                  description!,
                                  maxLines: 4,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "poppins_semi_bold",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 2.9.wp,
                                    height: 1.3,
                                    letterSpacing: 0.3,
                                    color: AppStyles.colors.bgDark.withOpacity(0.85),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
