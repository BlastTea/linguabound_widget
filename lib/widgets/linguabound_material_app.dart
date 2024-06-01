part of 'widgets.dart';

class LinguaboundMaterialApp extends StatelessWidget {
  const LinguaboundMaterialApp({
    super.key,
    this.home,
  });

  final Widget? home;

  @override
  Widget build(BuildContext context) => MWidgetDynamicColorBuilder(
        builder: (context, theme, darkTheme, themeMode, colorScheme) {
          ColorScheme effectiveColorScheme = colorScheme!.copyWith(
            surface: kColorSurface,
          );

          TextTheme effectiveTextTheme = TextTheme(
            bodyLarge: kTextStyleBodyLarge.copyWith(fontFamily: kFontFamily),
            bodyMedium: kTextStyleBodyMedium.copyWith(fontFamily: kFontFamily),
            bodySmall: kTextStyleBodySmall.copyWith(fontFamily: kFontFamily),
            displayLarge: kTextStyleDisplayLarge.copyWith(fontFamily: kFontFamily),
            displayMedium: kTextStyleDisplayMedium.copyWith(fontFamily: kFontFamily),
            displaySmall: kTextStyleDisplaySmall.copyWith(fontFamily: kFontFamily),
            headlineLarge: kTextStyleHeadlineLarge.copyWith(fontFamily: kFontFamily),
            headlineMedium: kTextStyleHeadlineMedium.copyWith(fontFamily: kFontFamily),
            headlineSmall: kTextStyleHeadlineSmall.copyWith(fontFamily: kFontFamily),
            labelLarge: kTextStyleLabelLarge.copyWith(fontFamily: kFontFamily),
            labelMedium: kTextStyleLabelMedium.copyWith(fontFamily: kFontFamily),
            labelSmall: kTextStyleLabelSmall.copyWith(fontFamily: kFontFamily),
            titleLarge: kTextStyleTitleLarge.copyWith(fontFamily: kFontFamily),
            titleMedium: kTextStyleTitleMedium.copyWith(fontFamily: kFontFamily),
            titleSmall: kTextStyleTitleSmall.copyWith(fontFamily: kFontFamily),
          );

          // TODO: Implement color for disabled state
          // FilledButtonThemeData effectiveFilledButtonTheme = FilledButtonThemeData(
          //   style: ButtonStyle(
          //     elevation: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.pressed) ? 0.0 : 8.0),
          //     textStyle: WidgetStatePropertyAll(effectiveTextTheme.headlineSmall),
          //     foregroundColor: const WidgetStatePropertyAll(kColorWhite),
          //     padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0)),
          //     shape: const WidgetStatePropertyAll(
          //       RoundedRectangleBorder(
          //         borderRadius: kBorderRadius,
          //       ),
          //     ),
          //   ),
          // );

          InputDecorationTheme effectiveInputDecorationTheme = const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: kBorderRadius,
            ),
          );

          DividerThemeData effectiveDividerTheme = const DividerThemeData(
            color: kColorDivider,
          );

          return MaterialApp(
            theme: theme.copyWith(
              colorScheme: effectiveColorScheme,
              scaffoldBackgroundColor: effectiveColorScheme.surface,
              textTheme: effectiveTextTheme,
              // filledButtonTheme: effectiveFilledButtonTheme,
              inputDecorationTheme: effectiveInputDecorationTheme,
              dividerTheme: effectiveDividerTheme,
            ),
            darkTheme: darkTheme.copyWith(
              colorScheme: effectiveColorScheme,
              scaffoldBackgroundColor: effectiveColorScheme.surface,
              textTheme: effectiveTextTheme,
              // filledButtonTheme: effectiveFilledButtonTheme,
              inputDecorationTheme: effectiveInputDecorationTheme,
              dividerTheme: effectiveDividerTheme,
            ),
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            home: home,
          );
        },
      );
}
