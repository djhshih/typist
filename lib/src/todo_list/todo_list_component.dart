import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(TodoListService)],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<String> items = [];
  Map<String,String> bindings;
  String pressedKey = '';
  
  List<String> wrongs = [];

  int n = 200;

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.next(n);
    bindings = await todoListService.bindings();
  }

  void check() {
    String symbol = items.last;
    String key = bindings[symbol];
    if (pressedKey == key) {
      // entered key is correct
      items.removeLast();
    } else {
      wrongs.add(symbol);
    }
    pressedKey = '';

    if (items.isEmpty) {
      if (wrongs.isNotEmpty) {
        items = wrongs;
        wrongs = [];
      }
    }
  }

  String remove(int index) => items.removeAt(index);
}
