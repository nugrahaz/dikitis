part of '../constants.dart';

class AppStyles {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
  static final font = Font();

  //
  static final theme = _Theme();
  static final shadows = _Shadows();
}

class _Colors {
  final transparent = Colors.transparent;
  final bgDark = const Color.fromRGBO(44, 43, 63, 1); //2C2B3F
  final black = HexColor("#232232");

  //
  final turqoise = HexColor("#00b9bc");

  final cyan = Colors.cyan; //0,188,227 //0xFF26C6DA  //HexColor("#2C2B3F")

  final white = Colors.white.withOpacity(0.975);
  final grey = const Color(0xff475e69);
  final darkGrey = const Color(0xFF9E9E9E);
  final red = const Color(0xFFEF5350);
}

class Font {
  static const poppinsBold = 'poppins_bold';
  static const poppinsMedium = 'poppins_medium';
  static const poppinsSemiBold = 'poppins_semi_bold';
}

class _TextStyles {
  final poppinsMedium = const TextStyle(fontFamily: Font.poppinsMedium, wordSpacing: 1, letterSpacing: 1, fontWeight: FontWeight.bold);
  final poppinsSemiBold = const TextStyle(fontFamily: Font.poppinsSemiBold, wordSpacing: 1, letterSpacing: 1, fontWeight: FontWeight.bold);
  final poppinsBold = const TextStyle(fontFamily: Font.poppinsBold, fontWeight: FontWeight.bold);
}

class _Shadows {
  final softShadow = [
    const BoxShadow(
      blurRadius: 20,
      offset: Offset(0, 2),
    ),
  ];

  final hardShadow = [
    const BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 2),
    ),
    const BoxShadow(
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ];
}

class _Theme {
  final defaultTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.cyan,
    canvasColor: AppStyles.colors.transparent, //warna oveflow listview transparant
  );
}
