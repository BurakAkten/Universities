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
