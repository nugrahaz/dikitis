part of 'widgets.dart';

class CustomTextField extends StatefulWidget {
  final bool? visibility;
  final bool? enabled;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final IconData? iconSuffix;

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool? useSuffixIcon;
  final Function()? function;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final double? borderRadius;
  final List<TextInputFormatter>? filteringTextInputFormatter;
  final TextCapitalization? textCapitalization;
  final Color? colorHint;
  final Color? colorIcon;

  const CustomTextField({
    Key? key,
    @required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.visibility = false,
    this.useSuffixIcon = false,
    this.function,
    this.height,
    required this.currentNode,
    required this.nextNode,
    this.borderRadius = 12,
    this.filteringTextInputFormatter,
    this.textCapitalization,
    this.enabled = true,
    this.iconSuffix = Icons.edit,
    this.colorHint,
    this.colorIcon = Colors.cyan,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    if (widget.nextNode != null) {
      _focusNode = widget.nextNode;
    } else {
      _focusNode = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.height == null) ? 19.0.wp : widget.height,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.0.wp),
        padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
        decoration: BoxDecoration(
          color: AppStyles.colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            enabled: widget.enabled,
            autocorrect: false,
            enableSuggestions: widget.visibility != true ? true : false,
            enableIMEPersonalizedLearning: widget.visibility != true ? true : false,
            enableInteractiveSelection: widget.visibility != true ? true : false,
            textAlignVertical: widget.useSuffixIcon! ? TextAlignVertical.center : TextAlignVertical.top,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            inputFormatters: widget.filteringTextInputFormatter ?? [],
            style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                color: AppStyles.colors.bgDark.withOpacity(0.9),
                fontFamily: "poppins_medium",
                fontWeight: FontWeight.w300,
                letterSpacing: 0.1,
                wordSpacing: 0.2,
                fontSize: 3.8.wp),
            obscureText: widget.visibility!,
            focusNode: widget.currentNode,
            onFieldSubmitted: (term) {
              SharedMethod.fieldFocusChange(context, widget.currentNode!, _focusNode!);
            },
            controller: widget.controller,
            onChanged: widget.onChanged,
            textInputAction: (widget.nextNode == null) ? TextInputAction.done : TextInputAction.next,
            cursorColor: AppStyles.colors.cyan,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(color: widget.colorHint),
              icon: Icon(
                widget.icon,
                color: AppStyles.colors.cyan,
              ),
              suffixIcon: (widget.useSuffixIcon == true)
                  ? GestureDetector(
                      onTap: widget.function,
                      child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.0.wp),
                          child: Icon(
                            (widget.iconSuffix != null)
                                ? widget.iconSuffix
                                : (widget.visibility == true)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                            color: widget.colorIcon,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
