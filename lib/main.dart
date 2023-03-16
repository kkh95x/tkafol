import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/route_manager.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //     url: "https://arfdcvyjxxdtawwywvyr.supabase.co",
  //     anonKey:
  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFyZmRjdnlqeHhkdGF3d3l3dnlyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzY2NDU0MzcsImV4cCI6MTk5MjIyMTQzN30.S3hUXuOilypSPv7tseqjowlm7z5mUUz5IarMABc8abg");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
        
            theme: ThemeData(
              fontFamily: "cairo",
                primaryColor: AppColor.primaryColor,
            ),
            onGenerateRoute: RoutesGenerator.getRpute,
            initialRoute: AppRoutes.splashRoute));
  }
}
