import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/core/application/colors_manager.dart';

import 'package:takafol/src/core/presention/pages/home/compnents/mpas_widge_albab.dart';
import 'package:takafol/src/core/application/maps_city_index_provider.dart';
import 'package:takafol/src/core/presention/pages/home/compnents/mpas_widge_azzaz.dart';

List<Widget> _cityes = const [MapAllDerbrisAzzaz(), MapAllDerbrisAlbab()];

class MapCompnent extends ConsumerWidget {
  const MapCompnent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexMapsCityProvider);
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height, child: _cityes[index]),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 60,
            width: 100,
            margin: const EdgeInsets.only(bottom: 8.0, left: 8.0),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              child: Text(
                "تغيير المدينة",
                style: TextStyle(color: AppColor.primaryColor),
              ),
              onPressed: () {
                _showMyDialog(context, ref);
              },
            ),
          ),
        )
        
      ],
    );
  }

  Future<void> _showMyDialog(context, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('الخرائط'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        ref.read(indexMapsCityProvider.notifier).state = 0;
                                        Navigator.of(context).pop();
        
                      },
                      child: const Text('خريطة أعزاز')),
                  TextButton(onPressed: () {
                                          ref.read(indexMapsCityProvider.notifier).state = 1;
                                                          Navigator.of(context).pop();
        
        
                  }, child: const Text('خريطة الباب')),
                ],
              ),
            ),
            
          ),
        );
      },
    );
  }
}
