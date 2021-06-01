import 'dart:async';
import 'package:universities/base/viewmodels/base_view_model.dart';
import 'package:universities/models/dao/university_dao.dart';
import 'package:universities/screens/universities/universities_service.dart';

class UniversitiesViewModel extends BaseViewModel {
  UniversitiesService _service = UniversitiesService();
  UniversitiesViewModel();
  List<UniversityDao> _universities = [];
  String errorMessage;

  @override
  FutureOr<void> init() async => await getAll();

  Future<void> getAll({List<SearchType> bys}) async {
    isLoading = true;
    var response = await _service.fetchAll();
    if (response.isSuccess)
      _universities = response.data;
    else
      errorMessage = response.errorMessage;
    isLoading = false;
  }

  //Getters
  UniversityDao getItem(int index) => _universities[index];
  int get count => _universities.length;
}

enum SearchType { NAME, COUNTRY }

extension SearchTypeExt on SearchType {
  String get rawValue {
    switch (this) {
      case SearchType.NAME:
        return "name";
      case SearchType.COUNTRY:
        return "country";
      default:
        return "";
    }
  }
}
