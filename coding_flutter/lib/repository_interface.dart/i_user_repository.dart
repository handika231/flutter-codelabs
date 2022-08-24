import 'package:coding_flutter/entities/user.dart';

abstract class IUserRepository {
  Future<User?> getUser(int id);
}
