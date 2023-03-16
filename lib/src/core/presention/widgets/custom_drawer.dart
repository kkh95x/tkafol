import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/application/maps_city_index_provider.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';

class CustomeDrawer extends ConsumerWidget {
  CustomeDrawer({super.key});
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: size.width / 2,
        height: size.height,
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 200,
              color: AppColor.primaryColor,
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                foregroundColor: AppColor.primaryColor,
                radius: 50,
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.profile);
              },
              leading: Icon(
                Icons.person,
                size: 30,
                color: AppColor.primaryColor,
              ),
              title: Text(
                "الملف التعريفي",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14),
              ),
            ),
            Divider(
              color: AppColor.primaryColor,
            ),

            ListTile(
              leading: Icon(
                Icons.question_mark,
                size: 30,
                color: AppColor.primaryColor,
              ),
              title: Text(
                "مركز الدعم",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14),
              ),
            ),
            Divider(
              color: AppColor.primaryColor,
            ),
            const SizedBox(
              height: 100,
            ),
            Divider(
              color: AppColor.primaryColor,
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark,
                size: 30,
                color: AppColor.primaryColor,
              ),
              title: Text(
                "من نحن",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14),
              ),
            ),
            // Divider(
            //   color: AppColor.primaryColor,
            // ),
            // ListTile(
            //   title: Text(
            //     "Privacy",
            //     style: Theme.of(context)
            //         .textTheme
            //         .titleMedium
            //         ?.copyWith(fontSize: 14),
            //   ),
            // ),
            Divider(
              color: AppColor.primaryColor,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
                color: AppColor.primaryColor,
              ),
              onTap: () {
                _signOut(context);
              },
              title: Text(
                "تسجيل الخروج",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14),
              ),
            ),
            Divider(
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(context) async {
    try {

      Dialogs.showLoadingDialog(context, _keyLoader);

      final respone = await supabaseCleint.auth.signOut();

      if (respone.error != null) {
        print("error sign out ${respone.error}");
      } else {
       await UserSharedPreference.deleteLocalUser();
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
       Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginRoute,(route) => false,);

      }
    } catch (err) {
      getSnackBar(context, "some thing worng");

    }

  }
}
