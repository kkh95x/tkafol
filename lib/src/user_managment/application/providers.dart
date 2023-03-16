import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/application/route_manager.dart';

final authIndexPAgeProvider = StateProvider<int>(
  (ref) => 0,
);

void showAlterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text("chose type user for display home screen"),
      actions: [
        ElevatedButton(
          child: Text("محتاج"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteNeedy);
          },
        ),
         ElevatedButton(
          child: Text("متبرع"),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteBenefactor);
          },
        ),
      ],
    ),
  );
}
