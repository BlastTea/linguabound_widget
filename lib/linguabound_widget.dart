library linguabound_widget;

import 'package:flutter/material.dart';
import 'package:linguabound_widget/utils/utils.dart';
import 'package:m_widget/m_widget.dart';

export 'widgets/widgets.dart';

class LinguaboundWidget {
  Future<void> initialize() async {
    await MWidget.initialize(
      defaultLanguage: LanguageType.indonesiaIndonesian,
      defaultTheme: ThemeValue(
        themeMode: ThemeMode.dark,
        color: kColorSurface,
        withCustomColors: true,
        useDynamicColors: true,
      ),
    );
  }
}
