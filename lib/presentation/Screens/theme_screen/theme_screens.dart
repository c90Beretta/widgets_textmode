
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
              ref.read(darkModeProvider.notifier).update((state) => !state);
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
    final int selectedColor = ref.watch(selectedColorProvider);
   
   
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: ( context,  index) {
        final Color color = colors[index];

         return RadioListTile(
          title: Text("Este Color $index", style: TextStyle(color: color),),
          subtitle: Text("${color.value}"),
          activeColor: color,
         value: index,  
         groupValue: selectedColor,
         onChanged:  (value) {
            ref.read(selectedColorProvider.notifier).state = index;
         }
       );
      },
    );
  }   
}