import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'exercise_service.dart';

@Component(
  selector: 'random-symbol',
  styleUrls: ['random_symbol_component.css'],
  templateUrl: 'random_symbol_component.html',
  directives: [
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(ExerciseService)],
)
class RandomSymbolComponent implements OnInit {
  final ExerciseService exerciseService;

  List<String> items = [];
  Map<String,String> bindings;
  String pressedKey = '';
  
  List<String> wrongs = [];

  int n = 200;

  RandomSymbolComponent(this.exerciseService);

  @override
  Future<Null> ngOnInit() async {
    items = await exerciseService.next_symbols(n);
    bindings = await exerciseService.bindings();
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
