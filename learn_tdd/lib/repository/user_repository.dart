import 'package:coding_flutter/entities/user.dart';
import 'package:dio/dio.dart';

import '../repository_interface.dart/i_user_repository.dart';

class UserRepository implements IUserRepository {
  Dio? dio;
  UserRepository({Dio? dio}) {
    this.dio = dio ?? Dio();
  }
  @override
  Future<User?> getUser(int id) async {
    try {
      final response = await dio!.get('https://reqres.in/api/users/$id');
      if (response.statusCode == 200) {
        return User(
          id: response.data['data']['id'],
          name: response.data['data']['first_name'] +
              ' ' +
              response.data['data']['last_name'],
        );
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
