part of "utils.dart";

extension PercentSized on double {
  double get hp => (Get.height * ((this) / 100));

  double get wp => (Get.width * ((this) / 100));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension BoolParsing on String {
  bool parseBool() {
    if ((this).toLowerCase() == 'true') {
      return true;
    } else if ((this).toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }
}

extension StringExt on String {
  String get capitalizeFirst => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}

extension DateTimeFormatter on DateTime {
  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);
}
