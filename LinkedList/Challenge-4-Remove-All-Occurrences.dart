import 'dart:collection';
import 'dart:convert';

class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    // var value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return head?.value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }
}

void RemoveAllOccurrences<T>(LinkedList<T> list) {
  Node<T>? p = list.head;
  while (p != null) {
    T temp = p.value;
    Node<T>? q = list.head;
    int j = 0;
    while (q != null) {
      if (temp == q.value) j++;
      q = q.next;
    }

    q = list.head;
    if (j >= 2) {
      j = 0;
      while (q != null) {
        if (temp == q.value) {
          if (temp == list.head!.value) {
            list.pop();
            q = list.head;
          } else if (temp == list.tail!.value) {
            list.removeLast();
          } else {
            final node = list.nodeAt(j - 1);
            list.removeAfter(node!);
            q = q.next;
            j++;
          }
        } else {
          j++;
          q = q.next;
        }
      }
    }

    p = p.next;
  }
}

void main() {
  LinkedList<int> list = new LinkedList();
  list.push(10);
  list.push(30);
  list.push(20);
  list.push(10);
  list.push(20);
  list.push(10);
  list.push(10);
  print(list.toString());

  RemoveAllOccurrences(list);
  print(list.toString());
}
