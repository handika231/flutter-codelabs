import 'package:coding_flutter/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Default user test', () {
    User user = User();
    test(
      "User has an id with type int",
      () {
        expect(user.id, isA<int>());
      },
    );
    test(
      "User has an name with type String",
      () {
        expect(user.name, isA<String>());
      },
    );

    test('Default id  = 0, Default name = "No Name"', () {
      expect(user.id, equals(0));
      expect(user.name, equals('No Name'));
    });
  });

  group('Testing User constructor', () {
    User user1 = User(id: 1);
    User user2 = User(id: 1, name: 'John');
    User user3 = User(name: 'John');

    test('Single parameter (id) is valid', () {
      expect(user1.id, equals(1));
    });
    test('Two parameters (id, name) are valid', () {
      expect(user2.id, equals(1));
      expect(user2.name, equals('John'));
    });
    test('One parameter (name) is valid', () {
      expect(user3.id, equals(0));
      expect(user3.name, equals('John'));
    });
  });
}
