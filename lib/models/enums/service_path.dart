enum ServicePath { SEARCH }

extension ServicePathExt on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.SEARCH:
        return "search?";
      default:
        return "";
    }
  }
}

enum SearchParameter { COUNTRY, NAME }

extension SearchParametersExt on SearchParameter {
  String get rawValue => this.toString().split(".")[1].toLowerCase();
}
