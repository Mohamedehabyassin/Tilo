import 'package:flutter/cupertino.dart';
import 'package:tilo/model/data_model.dart';
import 'package:tilo/request/request_data.dart';

class DataProvider extends ChangeNotifier {
  var _dataRequest = APIService();

  List<Result> data = [];

  DataProvider(int num,int page) {
    getData(num,page);
  }
  void getData(int num,int page) async {
    data = await _dataRequest.get(num,page);
    notifyListeners();
  }
}
