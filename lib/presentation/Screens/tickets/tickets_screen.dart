
import 'package:widgets_sexmode/presentation/Screens/screens.dart';

class TicketsScreens extends ConsumerWidget {

 static const String name = "tickets_screens";
   TicketsScreens({super.key});

  final ticketsListTileView = TicketsListTileView();
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Tickets Screens"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        child: const Icon(Icons.add_circle_outline),
        
      ),
     body:  TicketsListTileView(),
      
    );
  }
}

class TicketsListTileView extends StatelessWidget {
   TicketsListTileView({super.key});
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return  ReorderableListView(

      onReorder: (oldIndex, newIndex){
        if(newIndex > oldIndex){
          newIndex -= 1;
        }
        final String item = _items.removeAt(oldIndex);
        _items.insert(newIndex, item);
      },
      children: _items.map((item) => ListTile(
        key: Key(item),
        title: Text(item),
        subtitle: Text("item Arrastable $item"),
        trailing: const Icon(Icons.numbers_sharp),
      )).toList()
    );
    
  }
  
}