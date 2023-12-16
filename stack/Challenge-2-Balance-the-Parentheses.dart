// Challenge 2: Balance the Parentheses
// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced.
class Stack<E> {
  final List<E> _storage;
  Stack() : _storage = <E>[];

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);
}

void BalancetTheParentheses(String line) {
  Stack<String> s = new Stack();
  if (line.length == 0)
    print('that is empty list');
  else {
    for (int i = 0; i < line.length; i++) {
      if (line[i] == '(' || line[i] == ')') {
        s.push(line[i]);
      }
    }

    if (s.peek != ')') {
      print('is not Balanced String');
    } else {
      int left = 0, right = 0;
      while (s.isNotEmpty) {
        left = 0;
        right = 0;
        while (s.peek == ')') {
          s.pop();
          right++;
          if (s.isEmpty) break;
        }
        while (s.peek == '(') {
          s.pop();
          left++;
          if (s.isEmpty) break;
        }
        if (left != right) {
          print('that is not Balanced String');
          return;
        }
      }
      print('that is Balnced String');
    }
  }
}

void main() {
  BalancetTheParentheses("((x + y) * z)");
}
