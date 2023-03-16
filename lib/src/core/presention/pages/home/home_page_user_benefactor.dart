import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/domain/page_model.dart';
import 'package:takafol/src/core/presention/widgets/button_navigation_widget.dart';
import 'package:takafol/src/core/presention/widgets/custom_drawer.dart';

class HomePageBenefactor extends ConsumerStatefulWidget {
  const HomePageBenefactor({super.key});

  @override
  ConsumerState<HomePageBenefactor> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePageBenefactor> {
  @override
  Widget build(BuildContext context) {
    final pages = ref.watch(bottomNavigationProvider);
    return Scaffold(
   
      endDrawer: CustomeDrawer(),
    
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonNavigationWidget(
                icon: Icons.map,
                isSelected: pages == 0,
                name: "الخريطة",
                onTap: () {
                  ref.watch(bottomNavigationProvider.notifier).state = 0;
                },
              ),
              ButtonNavigationWidget(
                icon: Icons.message,
                isSelected: pages == 1,
                name: "الرسائل",
                onTap: () {
                  ref.watch(bottomNavigationProvider.notifier).state = 1;
                },
              )
            ],
          )),
      appBar: AppBar(
        iconTheme: IconThemeData(color:pages==0? Colors.black:Colors.white,size: 40,),
        automaticallyImplyLeading: false,
        backgroundColor:pages==0? Colors.white:AppColor.primaryColor,
        elevation: 0.0,
        centerTitle:pages==0?null:true ,
        title: Text(
          listOfScreen[pages].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color:pages==0? AppColor.primaryColor:Colors.white, fontSize:pages==0? 35:20,
              ),
        ),
      ),
      body: listOfScreen[pages].page,
    );
  }
}
