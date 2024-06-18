import 'dart:convert';
import 'package:api_calling/API%20%20CALLING/For%20Comments/model/data_model.dart';
import 'package:flutter/material.dart';
import '../../For User/screen/home/api.dart';

class CommentsProvider extends ChangeNotifier{
  List<CommentsModel> _commentsList = [];

  List<CommentsModel> get commentsList => _commentsList;

  CommentsProvider() {
    getData();
  }

  Future<void> getData() async {
    String json = await ApiService()
        .callApi('https://jsonplaceholder.typicode.com/comments');
    List data = await jsonDecode(json);
    _commentsList = data.map((e) => CommentsModel.fromJson(e)).toList();
    notifyListeners();
  }
}