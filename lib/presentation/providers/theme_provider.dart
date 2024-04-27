import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_sexmode/config/themes/app_theme.dart';


final  darkModeProvider = StateProvider<bool>((ref) => false);


// Lsitado de colores inmutables
final colorListProvider = Provider((ref) => colorList);


//Simple int
final selectedColorProvider = StateProvider((ref) => 0);


//un objeto de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //estado = new apptheme()
  ThemeNotifier(): super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode:!state.isDarkMode);
  }
  void changeColorIndex(int ?colorIndex) {
    state = state.copyWith(selectedColor: colorIndex); 
  }

}