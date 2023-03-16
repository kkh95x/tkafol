// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:supabase/supabase.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/core/presention/widgets/custom_button.dart';
import 'package:takafol/src/core/presention/widgets/text_filde_form.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';
import 'package:takafol/src/user_managment/presintation/widgets/header_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderWidget(
              size: size,
              title: "تطبيق تكافل",
            ),
            // tapBarWidget(context),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
                height: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "تسجيل الدخول",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 25,
                                ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFildeWidget(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "أدخل أيميلك";
                          } else if (!value!.contains('@')) {
                            return 'صيغة خاطئة';
                          }
                          return null;
                        },
                        label: "البريد الإلكتروني",
                        icon: Icon(
                          Icons.email_outlined,
                          color: AppColor.primaryColor.withOpacity(0.5),
                        ),
                      ),
                      TextFildeWidget(
                        isPassword: true,
                        controller: _passwordController,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "أدخل كلمة السر";
                          }
                          return null;
                        },
                        label: "كلمة السر",
                        icon: Icon(
                          Icons.lock_outline,
                          color: AppColor.primaryColor.withOpacity(0.5),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 20),
                      //   child: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: TextButton(
                      //         onPressed: () {},
                      //         child: Text(
                      //           "Forget Password?",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .titleMedium
                      //               ?.copyWith(
                      //                   color: Colors.black.withOpacity(0.5)),
                      //         )),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        name: "تسجيل الدخول",
                        onTap: () {
                          _signIn();
                        },
                        backColor: AppColor.primaryColor,
                        forcColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.registerRoute);
                              },
                              child: Text(
                                "إنشاء حساب جديد؟",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Colors.black.withOpacity(0.5)),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      Dialogs.showLoadingDialog(context, _keyLoader);
      final response =
          await supabaseCleint.auth.signIn(email: email, password: password);
      if (response.error != null) {
        if (response.error!.message ==
            "Failed host lookup: 'vwcmygvjzcpqgvrarsmx.supabase.co'") {
          getSnackBar(context, "check your Enternet");
        } else {
          getSnackBar(context, response.error!.message);
        }
        print(response.error!.message);
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      } else {
        PostgrestResponse<dynamic> appuserJson = await supabaseCleint
            .from("users")
            .select()
            .eq("email", response.user!.email)
            .execute();
        List<dynamic> data = appuserJson.data;
        if (data.isEmpty) {
          AppUser appUser = AppUser(
              id: response.user!.id,
              email: response.user!.email!,
              typeUser: TypeUser.benefactor.getStringNameTypeUser());
        appuserJson =  await supabaseCleint.from("users").insert(appUser.toJson()).execute();
          Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

          //secssfull
          
        } 
        // if (appuserJson.data) print(appuserJson.data);
        AppUser appUser = AppUser.fromJson(appuserJson.data.first);
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

        switchUser(appUser);
      }
    }
  }

  void switchUser(AppUser appUser) {
    if (appUser.typeUser == TypeUser.needy.getStringNameTypeUser()) {
      UserSharedPreference.saveLocalUser(appUser);

      Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteNeedy);
    } else if (appUser.typeUser ==
        TypeUser.benefactor.getStringNameTypeUser()) {
      UserSharedPreference.saveLocalUser(appUser);

      Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteBenefactor);
    } else {
      getSnackBar(context, "some thing worng");
    }
  }
}
