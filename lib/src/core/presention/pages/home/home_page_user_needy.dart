import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/domain/page_model.dart';
import 'package:takafol/src/core/presention/pages/home/compnents/chat_compnent.dart';
import 'package:takafol/src/core/presention/widgets/custom_drawer.dart';

class HomePageNeedy extends ConsumerStatefulWidget {
  const HomePageNeedy({super.key});

  @override
  ConsumerState<HomePageNeedy> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePageNeedy> {
  @override
  Widget build(BuildContext context) {
    final pages = ref.watch(bottomNavigationProvider);
    return Scaffold(
      endDrawer: CustomeDrawer(),
       
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 40,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle:true,
        title: Text(
          "الرسائل",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
             color:   Colors.white,
                fontSize:  20,
              ),
        ),
      ),
      body:  ChatCompnent()
    );
  }
}
