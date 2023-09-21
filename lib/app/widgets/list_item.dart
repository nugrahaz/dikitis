part of 'widgets.dart';

class ListItem extends StatefulWidget {
  final IconData icon;
  final bool isNavigate;
  final String text;
  final Function()? function;

  const ListItem({Key? key, this.icon = Icons.error, this.text = "", this.function, this.isNavigate = true}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        // height: 16.0.wp,
        margin: EdgeInsets.only(
          bottom: 5.0.wp,
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 4.0.wp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppStyles.colors.white,
        ),
        child: Row(
          children: <Widget>[
            (widget.icon != Icons.minimize_rounded)
                ? Icon(
                    widget.icon,
                    size: 7.0.wp,
                    color: AppStyles.colors.bgDark,
                  )
                : const SizedBox(),
            (widget.icon != Icons.minimize_rounded) ? SizedBox(width: 4.0.wp) : const SizedBox(),
            Expanded(
                child: Text(
              widget.text,
              style: AppStyles.textStyles.poppinsMedium.copyWith(
                fontWeight: FontWeight.w900,
                color: AppStyles.colors.bgDark.withOpacity(0.9),
                fontSize: 3.5.wp,
              ),
            )),
            (widget.isNavigate)
                ? Icon(
                    Icons.chevron_right_sharp,
                    size: 6.0.wp,
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 2.0.wp),
                    child: Icon(
                      Icons.circle_rounded,
                      size: 1.5.wp,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
