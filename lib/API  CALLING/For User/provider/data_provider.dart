import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/data_model.dart';
import '../screen/home/api.dart';

class UserApiProvider extends ChangeNotifier{

  List<UserModel> _usersList = [];
  List<UserModel> get usersList => _usersList;

  UserApiProvider(){
    getData();
  }

  Future<void> getData() async {
    String json = await ApiService().callApi('https://jsonplaceholder.typicode.com/users');
    List data = await jsonDecode(json);

    _usersList = data.map((e) => UserModel.getFromJson(e)).toList();
  }
}