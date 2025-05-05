import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  final PageController pageController = PageController();

  void jumpToPage(int page) {
    _currentPage = page; // Keep the currentPage updated.
    pageController.jumpToPage(
      page,
    );
    notifyListeners();
  }
}