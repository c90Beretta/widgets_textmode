import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_sexmode/config/router/app_router.dart';
import 'package:widgets_sexmode/config/themes/app_theme.dart';
import 'package:widgets_sexmode/presentation/providers/theme_provider.dart';


void main() {
//  const  ProviderScope(child: MainApp());
  runApp(const ProviderScope(child: MainApp()));
  
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme apptheme = ref.watch(themeNotifierProvider);  
    // final isDarkMode = ref.watch(darkModeProvider);
    // final selectedcolor = ref.watch(selectedColorProvider);
    
    return  MaterialApp.router(
      title: "Flutter Widgets",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: apptheme.getTheme(),
      
    );
  }
}

///This is a test 2