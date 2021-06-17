import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:universities/base/viewmodels/base_view_model.dart';
import 'package:universities/models/dao/university_dao.dart';
import 'package:universities/models/enums/search_type.dart';
import 'package:universities/models/enums/service_path.dart';
import 'package:universities/screens/universities/universities_service.dart';

class UniversitiesViewModel extends BaseViewModel {
  final UniversitiesService service;
  UniversitiesViewModel({@required this.service});
  TextEditingController textEditingController = TextEditingController();
  List<UniversityDao> _universities = [];
  List<UniversityDao> _filteredUniversities = [];
  String errorMessage;

  @override
  FutureOr<void> init() async => await getAll();

  Future<void> getAll({List<SearchType> bys}) async {
    changeStatus();
    var response = await service.fetchAll(key: SearchParameter.COUNTRY, value: "Turkey");
    if (response.isSuccess) {
      _universities = response.data;
      _filteredUniversities = _universities;
    } else
      errorMessage = response.errorMessage;
    changeStatus();
  }

  void searchUniversities(String text) {
    if (text.length > 2)
      _filteredUniversities = _universities
          .where((element) => element.country.toLowerCase().contains(text.toLowerCase()) || element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    else
      _filteredUniversities = _universities;
    reloadState();
  }

  //Getters
  UniversityDao getItem(int index) => _filteredUniversities[index];
  int get count => _filteredUniversities.length;
}
