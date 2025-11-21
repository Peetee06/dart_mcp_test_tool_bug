import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Slow test that takes 5 seconds', () async {
    print('Slow test started');
    await Future.delayed(const Duration(seconds: 5));
    print('Slow test completed');
    expect(true, isTrue);
  });
}
