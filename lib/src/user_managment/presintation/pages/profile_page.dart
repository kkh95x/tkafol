import 'package:flutter/material.dart';

import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/core/presention/widgets/custom_button.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  AppUser? _appUser;
  final GlobalKey<State> _keyLoader =  GlobalKey<State>();

  Future<void> getUser() async {
    _appUser = await UserSharedPreference.getLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, snap) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(100))),
                    child: Column(
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
                        Text(
                          "${_appUser?.firstName ?? "user"} ${_appUser?.lastName ?? "name"}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${_appUser?.cityName ?? ""}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.7)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListTile(
                      onTap: () {},
                      trailing: const Icon(Icons.edit),
                      title: Text(
                        "الأسم",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        "${_appUser?.firstName ?? "user"}${_appUser?.lastName ?? "name"}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListTile(
                      title: Text(
                        "البريد الإلكتروني",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        _appUser?.email ?? "email",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    name: "تغيير كلمة السر",
                    onTap: () async {
                      Dialogs.showLoadingDialog(context, _keyLoader);

                      final response = await supabaseCleint.auth.api
                          .resetPasswordForEmail(
                              _appUser!.email);
                      if (response.error != null) {
                        getSnackBar(context, "حدث خطأ");
                      }
                      Navigator.of(_keyLoader.currentContext!,
                              rootNavigator: true)
                          .pop();
                    },
                  ),
                  Spacer(),
                ],
              ),
            );
          }),
    );
  }
}
