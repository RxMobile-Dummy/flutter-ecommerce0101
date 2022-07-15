


import 'package:flutter/material.dart';

/// This file defines the themes to be used in rest of the app.
/// Any user defined theme must always return the type [ThemeData]

/*
class Themes {
  /// Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: kColorAccent,
      primaryColorDark: const Color(0xff128fc4),
      primaryColorLight: const Color(0xff33a9da),
      disabledColor: const Color(0x66666680),
      dividerColor: const Color(0xFF666680),
      hintColor: const Color(0xff666666),
      focusColor: const Color(0xff000000),
      selectedRowColor: const Color(0xff28364C),
      backgroundColor: const Color(0xffF9F9F9),
      cardColor: Colors.white,
      errorColor: const Color(0xffE32727),
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: kColorAccent,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
      ),
      //dialogBackgroundColor: kAppAdviceTileBgColor,
      highlightColor: const Color(0xff8D9BAE),
      toggleableActiveColor: const Color(0xff58585A),
      canvasColor: Colors.transparent,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Color(0xff666666),
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.kTextCentury),
        subtitle1: TextStyle(
            color: kColorAccent,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.kTextCentury),
        subtitle2: TextStyle(
            color: Color(0xff333333),
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.kTextCentury),
        overline: TextStyle(
            color: Color(0xff999999),
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.kTextCentury),
        caption: TextStyle(
            color: kColorAccent,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.kTextCentury),
        bodyText2: TextStyle(
            color: Color(0xff666666),
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.kTextCentury),
        headline1: TextStyle(
          color: Color(0xffE32727),
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: Strings.kTextCentury,
        ),
        headline2: TextStyle(
          color: kColorAccent,
          fontSize: 26,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
          fontFamily: Strings.kTextCentury,
        ),
        headline3: TextStyle(
          color: kColorAccent,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: Strings.kTextCentury,
        ),
        headline4: TextStyle(
          color: Color(0xffE32727),
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          fontFamily: Strings.kTextCentury,
        ),
        headline5: TextStyle(
          color: Color(0xffE32727),
          fontSize: 26.0,
          fontWeight: FontWeight.w700,
          fontFamily: Strings.kTextCentury,
        ),
        button: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: Strings.kTextCentury,
          color: Colors.white,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: kColorAccent,
        unselectedLabelColor: Color(0xffA3A3A3),
        labelPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      colorScheme:  ColorScheme(
        brightness: Brightness.light,
        primary: kColorAccent,
        onPrimary: Color(0xffC4C4C4),
        primaryContainer: Color(0xFF061FFF),
        secondary: Color(0xff1b202d),
        // Gradient bg start
        onSecondary: Color(0xff1b2231),
        secondaryContainer: Color(0xff293656),
        // Gradient bg end
        surface: Color(0xffF2F3F5),
        onSurface: Color(0xff8290A0),
        background: Color(0xff000000),
        onBackground: Color(0xff111A27),
        error: Color(0xffD42E20),
        onError: Colors.red,
      ),
    );
  }

  /// Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.red,
      focusColor: const Color(0xff0B2512),
      brightness: Brightness.dark,
      primaryColor: const Color(0xff131721),
      primaryColorDark: Colors.white,
      primaryColorLight: const Color(0xff488A99),
      disabledColor: Colors.white,
      secondaryHeaderColor: const Color(0xffabbbd4),
      backgroundColor: const Color(0xff1A1F2E),
      hintColor: Colors.white,
      errorColor: const Color(0xff488A99),
      cardColor: const Color(0xff1A1D24),
      highlightColor: const Color(0xff181D2C),
      canvasColor: const Color(0xff2C3243),
      indicatorColor: const Color(0xff707070),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textTheme: TextTheme(
        headline1: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        headline2: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
        headline3: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        headline4: const TextStyle(
          color: Color(0xff2C3243),
          fontSize: 12.0,
        ),
        headline5: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline6: const TextStyle(fontSize: 20, color: Colors.white),
        bodyText1: const TextStyle(fontSize: 16.0),
        subtitle1: const TextStyle(color: Color(0xff80969B)),
        subtitle2: const TextStyle(color: Colors.white, fontSize: 18),
        button: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.6),
        ),
      ),
      dividerColor: Colors.white,
      toggleableActiveColor: const Color(0xff62A9B9),
      tabBarTheme: const TabBarTheme(
        labelColor: Color(0xffF6BA41),
        unselectedLabelColor: Color(0xffA3A3A3),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xff488A99),
        onPrimary: Color(0xff131721),
        primaryContainer: Color(0xFFF6BA41),
        //button bg color
        secondary: Color(0xFF9F9F9F),
        // text field label/border color
        surface: Color(0xff8E9BA9),
        background: Color(0xff7E7E7E),
        onSecondary: Color(0xff4285f4),
        onSurface: Color(0xff00acee),
        secondaryContainer: Color(0xff5C5C5C),
        // disabled button color
        error: Colors.red,
        onBackground: Color(0xff181D2C),
        onError: Colors.red,
      ),
    );
  }

  static getThemeData(ThemeColor? themeColor) {
    if (themeColor == ThemeColor.light) {
      return Themes.lightTheme;
    } else if (themeColor == ThemeColor.dark) {
      return Themes.darkTheme;
    } else {
      return Themes.lightTheme;
    }
  }

  /// Other Colours which are common in all modes will go here
  ///

  /// these colors are added for the testing purpose for design changes for luke
  /// we will remove this belo colors once we finalise the design & colors
  static const Color kAppBackgroundColor = Color(0xFF171717);
  static const Color kAppAdviceTileBgColor = Color(0xFF232227);
  static const Color kIconGray = Color(0xFFB9BCBE);
  static const Color kFontGray = Color(0xffE32727);
  static const Color kFontWhite = Colors.white;
  static const Color kCircleColor = Color(0xff1B9AD6);
  static const Color googleBgColor = Color(0xff4C8BF5);
  static const Color twitterBgColor = Color(0xff00ACEE);
  static const Color linkedInBgColor = Color(0xff0e76a8);
  static const Color instagramBgColor1 = Color(0xfffdf497);
  static const Color instagramBgColor2 = Color(0xfffd5949);
  static const Color instagramBgColor3 = Color(0xffd6249f);
  static const Color instagramBgColor4 = Color(0xff285AEB);
  static const Color bottomPlayerTextColor = Color(0xff111A27);
  static const Color lightDarkBlueColor = Color(0xff263348);
  static const Color bioColor = Color(0xffA6A6A6);
  static const Color borderColor = Color(0xff21242B);

  static const Color firstRatingBorderColor = Color(0xff66707E);
  static const Color forthRatingBorderColor = Color(0xffD5D7DA);
  static const Color thirdRatingBorderColor = Color(0xffBFC1C6);
  static const Color secondRatingBorderColor = Color(0xff9CA1AA);

  static getCalenderTheme() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xff488a99),
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(
          fontSize: 18.0,
        ),
      ),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    );
  }
}


enum ThemeColor { light, dark }
*/
