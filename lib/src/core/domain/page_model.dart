import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/presention/pages/home/compnents/chat_compnent.dart';
import 'package:takafol/src/core/presention/pages/home/compnents/maps_compnent.dart';

class PageModle {
  String title;
  Widget page;
  PageModle({required this.title, required this.page});
}

final bottomNavigationProvider = StateProvider<int>((ref) => 0);
List<PageModle> listOfScreen = [
  PageModle(title: "الخريطة", page: const MapCompnent()),
  PageModle(title: "الرسائل", page: ChatCompnent())

];
