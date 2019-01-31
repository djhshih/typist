import 'package:angular/angular.dart';

import 'src/exercise/random_symbol_component.dart';
import 'src/exercise/random_combo_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [RandomSymbolComponent, RandomComboComponent],
)
class AppComponent {
  // Nothing here yet. All logic is in RandomSymbolComponent.
}
