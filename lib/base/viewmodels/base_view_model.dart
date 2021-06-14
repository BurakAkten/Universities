import 'dart:async';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitialized = false;

  FutureOr<void> _initState;

  BaseViewModel() {
    load();
  }

  FutureOr<void> init();

  void load() async {
    this.isLoading = true;
    _initState = init();
    await _initState;
    this._isInitialized = true;
    this.isLoading = false;
  }

  void changeStatus() => isLoading = !isLoading;

  //Getters
  FutureOr<Function> get initState => _initState;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitialized;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
