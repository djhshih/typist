import 'dart:async';
import 'dart:math';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<String> mockTodoList = <String>[];
  
  Map<String,String> _bindings = {
    'ㄅ': 'b',
    'ㄆ': 'p',
    'ㄇ': 'm',
    'ㄈ': 'f',
    'ㄉ': 'd',
    'ㄊ': 't',
    'ㄋ': 'n',
    'ㄌ': 'l',
    'ㄍ': 'v',
    'ㄎ': 'k',
    'ㄏ': 'h',
    'ㄐ': 'g',
    'ㄑ': 'v',
    'ㄒ': 'c',
    'ㄓ': 'g',
    'ㄔ': 'y',
    'ㄕ': 'c',
    'ㄖ': 'j',
    'ㄗ': 'q',
    'ㄘ': 'w',
    'ㄙ': 's',
    'ㄧ': 'e',
    'ㄨ': 'x',
    'ㄩ': 'u',
    'ㄚ': 'a',
    'ㄛ': 'o',
    'ㄜ': 'r',
    'ㄝ': 'w',
    'ㄞ': 'i',
    'ㄟ': 'q',
    'ㄠ': 'z',
    'ㄡ': 'p',
    'ㄢ': 'm',
    'ㄣ': 'n',
    'ㄤ': 't',
    'ㄥ': 'l',
    'ㄦ': 'h',
    '˙': 'd',
    'ˊ': 'f',
    'ˇ': 'j',
    'ˋ': 'k',
  };

  Future<List<String>> next(int k) async {
    Random r = Random(0);
    int n = _bindings.length;
    List<String> keys = _bindings.keys.toList();
    List<String> xs = [];
    for (int i = 0; i < k; i++) {
      int j = r.nextInt(n);
      xs.add(keys[j]);
    }
    return xs;
  }

  Future<List<String>> keys() async => _bindings.keys;
  
  Future<Map<String,String>> bindings() async => _bindings;

}
