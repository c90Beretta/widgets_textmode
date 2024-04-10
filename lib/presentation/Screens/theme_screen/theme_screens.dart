import 'dart:ffi';

import 'package:widgets_sexmode/presentation/Screens/screens.dart';

class ThemeScreens extends ConsumerWidget {
  const ThemeScreens({super.key});
  static String name = "theme_screen";
  @override
  Widget build(BuildContext context, ref) {
  final isDarkMode = ref.watch(darkModeProvider);

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer Screen"),
        actions: [
          IconButton(
           icon:  Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: (){
              ref.read(darkModeProvider.notifier).state = !isDarkMode;
            },
          ),

        ],
      ),
      body: const _ThemeChangerView(),
     
    );
  }
}


class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context , ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    return ListView.builder(

  
      itemCount: colors.length,

      itemBuilder: ( context,  index) {
        final Color color = colors[index];

        return RadioListTile(value: value,  
        groupValue: groupValue, 
        onChanged:  onChanged)
      },
    );
  }   
}