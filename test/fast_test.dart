import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Fast test that completes immediately', () {
    print('Fast test started');
    print('Fast test completed');
    expect(true, isTrue);
  });
}
