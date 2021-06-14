import 'dart:convert';
import 'package:universities/base/services/base_service.dart';
import 'package:universities/models/dao/university_dao.dart';
import 'package:universities/models/enums/service_path.dart';
import 'package:universities/models/response_model.dart';

class UniversitiesService {
  Future<ResponseModel> fetchAll() async {
    var response = await BaseService().getRequest(ServicePath.SEARCH.rawValue);
    return response.isSuccess
        ? ResponseModel(data: UniversityDao().listFromJson(json.decode(response.data)))
        : ResponseModel(errorMessage: response.errorMessage, isSuccess: response.isSuccess);
  }
}
