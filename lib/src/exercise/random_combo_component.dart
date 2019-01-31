import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'exercise_service.dart';

@Component(
  selector: 'random-combo',
  styleUrls: ['random_combo_component.css'],
  templateUrl: 'random_combo_component.html',
  directives: [
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(ExerciseService)],
)
class RandomComboComponent implements OnInit {
  final ExerciseService exerciseService;

  List<String> items = [];
  Map<String,String> bindings;
  String pressedKey = '';
  String combo = '';
  
  List<String> wrongs = [];

  int n = 100;

  RandomComboComponent(this.exerciseService);

  @override
  Future<Null> ngOnInit() async {
    items = await exerciseService.next_combos(n);
    bindings = await exerciseService.bindings();
    
    combo = items.last;
    items.removeLast(); 
  }

  void check() {
    if (combo.length > 0) {
      String symbol = combo[0];
      String key = bindings[symbol];
      if (pressedKey == key) {
        // entered key is correct: remove first symbol
        if (combo.length > 1) {
          combo = combo.substring(1);
        } else {
          // get next combo
          combo = items.last;
          items.removeLast(); 
        }
      } else {
        wrongs.add(symbol);
      }
      pressedKey = '';
    }

    if (items.isEmpty) {
      if (wrongs.isNotEmpty) {
        items = wrongs;
        wrongs = [];
      }
    }
  }

  String remove(int index) => items.removeAt(index);
}
