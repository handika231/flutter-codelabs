import 'package:coding_flutter/entities/user.dart';
import 'package:coding_flutter/repository/local_user_repository.dart';
import 'package:coding_flutter/repository/user_repository.dart';
import 'package:coding_flutter/repository_interface.dart/i_user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('Testing TDD using Mock and Dio', () {
    test('Get User Test (Success)', () async {
      Dio dio = MockDio();
      when(
        dio.get('https://reqres.in/api/users/2'),
      ).thenAnswer((_) async {
        return Future.value(
          Response<dynamic>(
            statusCode: 200,
            requestOptions: RequestOptions(
              path: 'https://reqres.in/api/users/2',
            ),
            data: {
              "data": {
                "id": 2,
                "email": "janet.weaver@reqres.in",
                "first_name": "Janet",
                "last_name": "Weaver",
                "avatar": "https://reqres.in/img/faces/2-image.jpg"
              },
              "support": {
                "url": "https://reqres.in/#support-heading",
                "text":
                    "To keep ReqRes free, contributions towards server costs are appreciated!"
              }
            },
          ),
        );
      });
      User? user = await UserRepository(dio: dio).getUser(2);
      expect(user?.id, equals(2));
    });

    test(
      'Get user test Failed',
      () async {
        Dio dio = MockDio();
        when(
          dio.get('https://reqres.in/api/users/23'),
        ).thenAnswer((_) async {
          return Future.value(
            Response<dynamic>(
              statusCode: 404,
              requestOptions: RequestOptions(
                path: 'https://reqres.in/api/users/23',
              ),
              data: {},
            ),
          );
        });
        User? user = await UserRepository(dio: dio).getUser(23);
        expect(user, isNull);
      },
    );

    test('Local user repository Success', () async {
      LocalUserRepository localUserRepository = LocalUserRepository();
      User? user = await localUserRepository.getUser(12);
      expect(user?.id, equals(12));
      expect(localUserRepository, isA<IUserRepository>());
    });
  });
}
