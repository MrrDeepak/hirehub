import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5B8CB9),
      surfaceTint: Color(0xff006a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9ef2e5),
      onPrimaryContainer: Color(0xff00201c),
      secondary: Color(0xff88511e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdcc3),
      onSecondaryContainer: Color(0xff2f1500),
      tertiary: Color(0xff006874),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9eeffd),
      onTertiaryContainer: Color(0xff001f24),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3f4947),
      outline: Color(0xff6f7977),
      outlineVariant: Color(0xffbec9c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xff82d5c9),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff00201c),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff005049),
      secondaryFixed: Color(0xffffdcc3),
      onSecondaryFixed: Color(0xff2f1500),
      secondaryFixedDim: Color(0xffffb77d),
      onSecondaryFixedVariant: Color(0xff6c3a06),
      tertiaryFixed: Color(0xff9eeffd),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xff82d3e0),
      onTertiaryFixedVariant: Color(0xff004f58),
      surfaceDim: Color(0xffd5dbd9),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe9efed),
      surfaceContainerHigh: Color(0xffe3eae7),
      surfaceContainerHighest: Color(0xffdde4e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff51D7E0),
      surfaceTint: Color(0xff006a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff288177),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff673603),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa36732),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004a53),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff25808c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3b4543),
      outline: Color(0xff57615f),
      outlineVariant: Color(0xff737d7a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xff82d5c9),
      primaryFixed: Color(0xff288177),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00685e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa36732),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff854f1c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff25808c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff006671),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbd9),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe9efed),
      surfaceContainerHigh: Color(0xffe3eae7),
      surfaceContainerHighest: Color(0xffdde4e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002823),
      surfaceTint: Color(0xff006a61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004c45),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff381a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff673603),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00272c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004a53),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1c2624),
      outline: Color(0xff3b4543),
      outlineVariant: Color(0xff3b4543),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3230),
      inversePrimary: Color(0xffa7fcee),
      primaryFixed: Color(0xff004c45),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00332e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff673603),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff482300),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004a53),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003238),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbd9),
      surfaceBright: Color(0xfff4fbf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f2),
      surfaceContainer: Color(0xffe9efed),
      surfaceContainerHigh: Color(0xffe3eae7),
      surfaceContainerHighest: Color(0xffdde4e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff82d5c9),
      surfaceTint: Color(0xff82d5c9),
      onPrimary: Color(0xff003732),
      primaryContainer: Color(0xff005049),
      onPrimaryContainer: Color(0xff9ef2e5),
      secondary: Color(0xffffb77d),
      onSecondary: Color(0xff4d2600),
      secondaryContainer: Color(0xff6c3a06),
      onSecondaryContainer: Color(0xffffdcc3),
      tertiary: Color(0xff82d3e0),
      onTertiary: Color(0xff00363d),
      tertiaryContainer: Color(0xff004f58),
      onTertiaryContainer: Color(0xff9eeffd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffdde4e1),
      onSurfaceVariant: Color(0xffbec9c6),
      outline: Color(0xff899390),
      outlineVariant: Color(0xff3f4947),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff006a61),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff00201c),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff005049),
      secondaryFixed: Color(0xffffdcc3),
      onSecondaryFixed: Color(0xff2f1500),
      secondaryFixedDim: Color(0xffffb77d),
      onSecondaryFixedVariant: Color(0xff6c3a06),
      tertiaryFixed: Color(0xff9eeffd),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xff82d3e0),
      onTertiaryFixedVariant: Color(0xff004f58),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff343a39),
      surfaceContainerLowest: Color(0xff090f0e),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff86dacd),
      surfaceTint: Color(0xff82d5c9),
      onPrimary: Color(0xff001a17),
      primaryContainer: Color(0xff4a9e93),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbd88),
      onSecondary: Color(0xff271000),
      secondaryContainer: Color(0xffc3824a),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff86d7e5),
      onTertiary: Color(0xff001a1d),
      tertiaryContainer: Color(0xff499ca9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1513),
      onSurface: Color(0xfff6fcf9),
      onSurfaceVariant: Color(0xffc3cdca),
      outline: Color(0xff9ba5a2),
      outlineVariant: Color(0xff7b8583),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff00514a),
      primaryFixed: Color(0xff9ef2e5),
      onPrimaryFixed: Color(0xff001512),
      primaryFixedDim: Color(0xff82d5c9),
      onPrimaryFixedVariant: Color(0xff003e38),
      secondaryFixed: Color(0xffffdcc3),
      onSecondaryFixed: Color(0xff1f0c00),
      secondaryFixedDim: Color(0xffffb77d),
      onSecondaryFixedVariant: Color(0xff552b00),
      tertiaryFixed: Color(0xff9eeffd),
      onTertiaryFixed: Color(0xff001417),
      tertiaryFixedDim: Color(0xff82d3e0),
      onTertiaryFixedVariant: Color(0xff003c44),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff343a39),
      surfaceContainerLowest: Color(0xff090f0e),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303635),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffebfffa),
      surfaceTint: Color(0xff82d5c9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff86dacd),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbd88),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff1fdff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff86d7e5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1513),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3fdfa),
      outline: Color(0xffc3cdca),
      outlineVariant: Color(0xffc3cdca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdde4e1),
      inversePrimary: Color(0xff00302b),
      primaryFixed: Color(0xffa2f6e9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff86dacd),
      onPrimaryFixedVariant: Color(0xff001a17),
      secondaryFixed: Color(0xffffe1cd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbd88),
      onSecondaryFixedVariant: Color(0xff271000),
      tertiaryFixed: Color(0xffaaf3ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff86d7e5),
      onTertiaryFixedVariant: Color(0xff001a1d),
      surfaceDim: Color(0xff0e1513),
      surfaceBright: Color(0xff343a39),
      surfaceContainerLowest: Color(0xff090f0e),
      surfaceContainerLow: Color(0xff161d1c),
      surfaceContainer: Color(0xff1a2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303635),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
