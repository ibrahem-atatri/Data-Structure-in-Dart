// Challenge 1: Reverse a List
// Create a function that prints the contents of a list in reverse order.
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

void ReverseAList(List l) {
  Stack s = Stack.of(l);
  if (s.isEmpty)
    print('Empty list');
  else
    while (s.isNotEmpty) {
      print(s.peek);
      s.pop();
    }
}

void main() {
  List<String> l = ['1', '2', '3'];
  List<int> l1 = [];
  ReverseAList(l);
  ReverseAList(l1);
}
