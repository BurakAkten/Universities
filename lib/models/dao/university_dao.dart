/// web_pages : ["http://www.adu.edu.tr/"]
/// alpha_two_code : "TR"
/// country : "Turkey"
/// name : "Adnan Menderes University"
/// domains : ["adu.edu.tr"]

class UniversityDao {
  List<String> _webPages;
  String _alphaTwoCode;
  String _country;
  String _name;
  List<String> _domains;

  List<String> get webPages => _webPages;
  String get alphaTwoCode => _alphaTwoCode;
  String get country => _country;
  String get name => _name;
  List<String> get domains => _domains;

  UniversityDao({List<String> webPages, String alphaTwoCode, String country, String name, List<String> domains}) {
    _webPages = webPages;
    _alphaTwoCode = alphaTwoCode;
    _country = country;
    _name = name;
    _domains = domains;
  }

  UniversityDao.fromJson(Map<String, dynamic> json) {
    _webPages = json["web_pages"] != null ? json["web_pages"].cast<String>() : [];
    _alphaTwoCode = json["alpha_two_code"];
    _country = json["country"];
    _name = json["name"];
    _domains = json["domains"] != null ? json["domains"].cast<String>() : [];
  }

  List<UniversityDao> listFromJson(List<dynamic> json) {
    return json == null ? List<UniversityDao>() : json.map((value) => UniversityDao.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["web_pages"] = _webPages;
    map["alpha_two_code"] = _alphaTwoCode;
    map["country"] = _country;
    map["name"] = _name;
    map["domains"] = _domains;
    return map;
  }
}
