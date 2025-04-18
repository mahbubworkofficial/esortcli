
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/bindings/user_model.dart';

class UserPreferece {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return UserModel(token: token);
  }
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}