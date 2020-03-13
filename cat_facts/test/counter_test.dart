import 'package:cat_facts/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter:', () {
    // Counter should start at 0
    test('Counter should start at 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });
    // Counter value should be decremented
    test('Counter value should be decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
    // Counter value should be incrememnted
    test('Counter value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
  });
}
