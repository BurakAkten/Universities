import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:universities/base/services/base_service.dart';
import 'package:universities/models/dao/university_dao.dart';
import 'package:universities/models/enums/service_path.dart';
import 'package:universities/models/response_model.dart';

class UniversitiesService {
  Future<ResponseModel> fetchAll({SearchParameter key, String value}) async {
    String parameter = key != null && value != null && value.isNotEmpty ? "${key.rawValue}=$value" : "";
    var response = await BaseService().getRequest("${ServicePath.SEARCH.rawValue}$parameter");
    return response.isSuccess
        ? ResponseModel(data: UniversityDao().listFromJson(json.decode(response.data)))
        : ResponseModel(errorMessage: response.errorMessage, isSuccess: response.isSuccess);
  }
}
