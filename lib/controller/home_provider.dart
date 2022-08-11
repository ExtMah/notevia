import 'package:flutter/cupertino.dart';
import 'package:notevia/controller/api.dart';
import 'package:notevia/model/model_category.dart';
import 'package:notevia/view/components/links.dart';

class HomeProvider extends ChangeNotifier {
  List _transactions = [
    {
      'title': 'Facebook',
      'amount': '135000',
      'date': 'June 20 2022',
      'catId': 1
    },
    {'title': 'bazar', 'amount': '285000', 'date': 'June 20 2022', 'catId': 2},
    {'title': 'mashin', 'amount': '375000', 'date': 'June 20 2022', 'catId': 4},
    {'title': 'car', 'amount': '155000', 'date': 'June 20 2022', 'catId': 5},
    {'title': 'fruit', 'amount': '145000', 'date': 'June 20 2022', 'catId': 5},
    {
      'title': 'spotify',
      'amount': '130000',
      'date': 'June 20 2022',
      'catId': 7
    },
  ];

  List get transactions => currentCategoryIndex == -1
      ? _transactions
      : _transactions
          .where((element) =>
              element['catId'] == categories[currentCategoryIndex].id)
          .toList();

  set setTransactions(List value) {
    _transactions = value;
  }

  List<ModelCategory> categories = [
    ModelCategory.fromJson({'name': '1', 'id': 1, 'parentId': 1}),
    ModelCategory.fromJson({'name': '1', 'id': 2}),
    ModelCategory.fromJson({'name': '1', 'id': 3}),
    ModelCategory.fromJson({'name': '1', 'id': 4}),
    ModelCategory.fromJson({'name': '1', 'id': 5}),
    ModelCategory.fromJson({'name': '1', 'id': 6}),
    ModelCategory.fromJson({'name': '1', 'id': 7}),
  ];

  int _currentCategoryIndex = -1;

  int get currentCategoryIndex => _currentCategoryIndex;

  set setCurrentCategoryIndex(int value) {
    _currentCategoryIndex = value;
    notifyListeners();
  }

  Api api = Api();

  Future getCategoriesRequest([String parentId = "0"]) async {
    /// todo : change email and password to real account
    var data = await api.post(Links.categories, {
      "apiType": "select",
      "parentId": parentId,
      "email": "asgar@gmail.com",
      "password": "asgar"
    });

    if (data != false) {
      for (var json in data['categories']);
    }
  }
}
