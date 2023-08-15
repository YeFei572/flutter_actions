import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User());

  updateUser(String? username, int? id, String? desc) {
    state = User().compyWith(username, id, desc);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

class User {
  String? username;
  int? id;
  String? description;

  User({this.username, this.id, this.description});

  User compyWith(String? username, int? id, String? description) {
    return User(
      description: description ?? this.description,
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }
}
