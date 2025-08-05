import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors_extension.dart';

class AppTheme {
  AppTheme._();

  // --- CORES PRINCIPAIS DA PALETA ---
  static const Color paletaDarkBlue = Color(0xFF003366);
  static const Color paletaDarkRed = Color(0xFF8B2222);
  static const Color paletaCream = Color(0xFFFDF5E6);
  static const Color paletaLightBlue = Color(0xFF6C92B4);
  static const Color paletaBrightRed = Color(0xFFC70039);

  // --- OUTRAS CORES DENTRO DA PALETA, MAS NÃO PRINCIPAIS ---
  static const Color paletaGreen = Color(0xFF5E9C76);
  static const Color paletaAmbar = Color(0xFFE89511);

  // --- CORES DE TEXTO ---
  // Cores principais de texto
  static const Color _lightTextColor = Color(0xFF001A33);
  static const Color _darkTextColor = paletaCream;

  /// Cor secundária, mais suave. Ótima para subtítulos e descrições.
  static const Color _textSecondary = Color(0xFF575757);
  static const Color _textSecondaryDark = Color(0xFFA4A4A4);

  static TextTheme get _textTheme => GoogleFonts.redHatDisplayTextTheme();

  static TextTheme _buildTextTheme(Color bodyColor, Color displayColor) =>
      _textTheme.apply(
        bodyColor: bodyColor,
        displayColor: displayColor,
      );

  static AppBarTheme _buildAppBarTheme(
          Color backgroundColor, Color foregroundColor) =>
      AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 4.0,
          centerTitle: true);

  static ElevatedButtonThemeData _buildElevatedButtonTheme(
          Color backgroundColor, Color foregroundColor) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme(
          Color backgroundColor, Color foregroundColor) =>
      FloatingActionButtonThemeData(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: const CircleBorder());

  static CardTheme _buildCardTheme(Color color) => CardTheme(
        color: color,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );

  static SwitchThemeData _buildSwitchTheme(Color color) =>
      SwitchThemeData(overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return color.withOpacity(0.5);
        }
        return null;
      }), thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return null;
      }));

  static InputDecorationTheme _buildInputDecorationTheme(
          Color fillColor, Color borderSideColor, Color labelColor) =>
      InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        labelStyle: TextStyle(color: labelColor),
      );

  // --- TEMA CLARO ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Esquema de cores principal
    colorScheme: const ColorScheme.light(
      primary: paletaDarkBlue,
      onPrimary: Colors.white,
      secondary: paletaLightBlue,
      onSecondary: Colors.white,
      tertiary: paletaDarkRed,
      onTertiary: Colors.white,
      background: paletaCream,
      onBackground: _lightTextColor,
      surface: Color(0xFFF5EFE0),
      onSurface: _lightTextColor,
      error: paletaBrightRed,
      onError: Colors.white,
    ),

    // Tema dos textos
    textTheme: _buildTextTheme(_lightTextColor, _lightTextColor),

    // Tema da AppBar
    appBarTheme: _buildAppBarTheme(paletaDarkBlue, Colors.white),

    // Tema do Scaffold
    scaffoldBackgroundColor: paletaCream,

    // Tema dos Botões
    elevatedButtonTheme:
        _buildElevatedButtonTheme(paletaDarkBlue, Colors.white),

    // Tema do Floating Action Button (FAB)
    floatingActionButtonTheme:
        _buildFloatingActionButtonTheme(paletaDarkRed, Colors.white),

    // Tema dos Cards
    cardTheme: _buildCardTheme(Colors.white),

    // Tema dos campos de texto
    inputDecorationTheme: _buildInputDecorationTheme(
        const Color(0xFFE0E0E0).withOpacity(0.7),
        paletaDarkBlue,
        paletaDarkBlue),

    // Tema dos Switches
    switchTheme: _buildSwitchTheme(paletaLightBlue),

    extensions: const [
      AppColorsExtension(
        textSecondary: _textSecondary,
      ),
    ],
  );

  // --- TEMA ESCURO ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Esquema de cores para o modo escuro
    colorScheme: const ColorScheme.dark(
      primary: paletaLightBlue,
      onPrimary: _darkTextColor,
      secondary: paletaLightBlue,
      onSecondary: _darkTextColor,
      tertiary: paletaDarkRed,
      onTertiary: _darkTextColor,
      background: Color(0xFF121212),
      onBackground: _darkTextColor,
      surface: Color(0xFF1E1E1E),
      onSurface: _darkTextColor,
      error: paletaBrightRed,
      onError: Colors.white,
    ),

    // Tema dos textos para o modo escuro
    textTheme: _buildTextTheme(_darkTextColor, _darkTextColor),

    // Tema da AppBar para o modo escuro
    appBarTheme: _buildAppBarTheme(const Color(0xFF1E1E1E), _darkTextColor),

    // Tema do Scaffold para o modo escuro
    scaffoldBackgroundColor: const Color(0xFF121212),

    // Tema dos Botões para o modo escuro
    elevatedButtonTheme:
        _buildElevatedButtonTheme(paletaLightBlue, _darkTextColor),

    // Tema do Floating Action Button (FAB)
    floatingActionButtonTheme:
        _buildFloatingActionButtonTheme(paletaDarkRed, Colors.white),

    // Tema dos Cards
    cardTheme: _buildCardTheme(const Color(0xFF1E1E1E)),

    // Tema dos Switches
    switchTheme: _buildSwitchTheme(paletaDarkBlue),

    // Tema dos campos de texto
    inputDecorationTheme: _buildInputDecorationTheme(
        const Color(0xFF2C2C2C), paletaLightBlue, Colors.white70),

    extensions: const [
      AppColorsExtension(
        textSecondary: _textSecondaryDark,
      ),
    ],
  );
}
