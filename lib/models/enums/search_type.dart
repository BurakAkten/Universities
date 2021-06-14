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
