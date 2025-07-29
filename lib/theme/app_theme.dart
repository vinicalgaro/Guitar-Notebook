import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors_extension.dart';

class AppTheme {
  AppTheme._();

  // --- CORES DA PALETA ---
  static const Color darkBlue = Color(0xFF003366);
  static const Color darkRed = Color(0xFF8B2222);
  static const Color cream = Color(0xFFFDF5E6);
  static const Color lightBlue = Color(0xFF6C92B4);
  static const Color brightRed = Color(0xFFC70039);

  // --- CORES DE TEXTO ---
  // Cores principais de texto
  static const Color _lightTextColor = Color(0xFF001A33);
  static const Color _darkTextColor = cream;

  /// Cor secundária, mais suave. Ótima para subtítulos e descrições.
  static const Color _textSecondary = Color(0xFF575757);
  static const Color _textSecondaryDark = Color(0xFFA4A4A4);

  static TextTheme get textTheme => GoogleFonts.redHatDisplayTextTheme();

  // --- TEMA CLARO (LIGHT THEME) ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Esquema de cores principal
    colorScheme: const ColorScheme.light(
      primary: darkBlue,
      onPrimary: Colors.white,
      secondary: lightBlue,
      onSecondary: Colors.white,
      tertiary: darkRed,
      onTertiary: Colors.white,
      background: cream,
      onBackground: _lightTextColor,
      surface: cream,
      onSurface: _lightTextColor,
      error: brightRed,
      onError: Colors.white,
    ),

    // Tema dos textos
    textTheme: textTheme.apply(
      bodyColor: _lightTextColor,
      displayColor: _lightTextColor,
    ),

    // Tema da AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBlue,
      foregroundColor: Colors.white, // Cor do título e ícones
      elevation: 4.0,
      centerTitle: true,
    ),

    // Tema do Scaffold
    scaffoldBackgroundColor: cream,

    // Tema dos Botões
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // Tema do Floating Action Button (FAB)
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: darkRed, // Usando o vermelho escuro para destaque
      foregroundColor: Colors.white,
    ),

    // Tema dos Cards
    cardTheme: CardTheme(
      color: Colors.white, // Um pouco mais branco que o fundo para se destacar
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // Tema dos campos de texto
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBlue, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      labelStyle: TextStyle(color: darkBlue),
    ),

    extensions: [
      AppColorsExtension(
        textSecondary: _textSecondary,
      ),
    ],
  );

  // --- TEMA ESCURO (DARK THEME) ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Esquema de cores para o modo escuro
    colorScheme: const ColorScheme.dark(
      primary: lightBlue,
      // O azul claro se destaca mais no fundo escuro
      onPrimary: _darkTextColor,
      secondary: darkBlue,
      onSecondary: _darkTextColor,
      tertiary: darkRed,
      onTertiary: _darkTextColor,
      background: Color(0xFF121212),
      // Um preto padrão do Material Design
      onBackground: _darkTextColor,
      surface: Color(0xFF1E1E1E),
      onSurface: _darkTextColor,
      error: brightRed,
      onError: Colors.white,
    ),

    // Tema dos textos para o modo escuro
    textTheme: textTheme.apply(
      bodyColor: _darkTextColor,
      displayColor: _darkTextColor,
    ),

    // Tema da AppBar para o modo escuro
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: _darkTextColor,
      elevation: 4.0,
      centerTitle: true,
    ),

    // Tema do Scaffold para o modo escuro
    scaffoldBackgroundColor: const Color(0xFF121212),

    // Tema dos Botões para o modo escuro
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightBlue,
        foregroundColor: _darkTextColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // Tema do Floating Action Button (FAB)
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: darkRed,
      foregroundColor: Colors.white,
    ),

    // Tema dos Cards
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return darkBlue.withOpacity(0.5);
        }
        return null;
      }),
    ),

    extensions: [
      AppColorsExtension(
        textSecondary: _textSecondaryDark,
      ),
    ],
  );
}
