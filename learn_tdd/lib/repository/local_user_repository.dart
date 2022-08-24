import 'package:coding_flutter/repository_interface.dart/i_user_repository.dart';

import '../entities/user.dart';

class LocalUserRepository implements IUserRepository {
  @override
  Future<User?> getUser(int id) async {
    return User(
      id: id,
    );
  }
}
