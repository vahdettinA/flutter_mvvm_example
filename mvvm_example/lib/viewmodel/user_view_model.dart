import 'package:flutter/material.dart';
import 'package:mvvm_example/model/user_model.dart';
import 'package:mvvm_example/service/user_service.dart';

class UserViewModel extends ChangeNotifier {
  String? name;
  String? email;
  String? avatar;

  List<Data?> data = [];
  UserViewModel() {
    service.fecthUser().then((value) => data = value!.data!);
  }

  Future<void> add(String name, String email, String avatar) async {
    this.email = email;
    this.name = name;
    this.avatar = avatar;
    data.add(Data(email: email, firstName: name, avatar: avatar));
    notifyListeners();
  }
}
