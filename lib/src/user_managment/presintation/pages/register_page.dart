// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/core/presention/widgets/custom_button.dart';
import 'package:takafol/src/core/presention/widgets/text_filde_form.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

import 'package:takafol/src/user_managment/presintation/widgets/header_container.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
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
                height: 530,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "إنشاء حساب جديد",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 25,
                                ),
                      ),
                      TextFildeWidget(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "أدخل إيميلك";
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
                      TextFildeWidget(
                        validator: (String? value) {
                          if (value != null &&
                              value != _passwordController.text) {
                            return "كلمة السر غير مطابقة";
                          }
                          return null;
                        },
                        label: "تاكيد كلمة السر",
                        icon: Icon(
                          Icons.lock_outline,
                          color: AppColor.primaryColor.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        name: "إنشاء حساب جديد",
                        onTap:
                            //  authProvider.getAuthState == AuthState.loading
                            //     ? null
                            //     :
                            () {
                          if (_formKey.currentState!.validate()) {
                            _signin();
                          }
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
                                Navigator.of(context)
                                    .pushReplacementNamed(AppRoutes.loginRoute);
                              },
                              child: Text(
                                "الإنتقال صفحة تسجيل الدخول؟",
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

  void _signin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      Dialogs.showLoadingDialog(context, _keyLoader);

      final response = await supabaseCleint.auth.signUp(email, password,);
      if (response.error != null) {
        print("ERorrr");
        print("sigin error ${response.error!.message}");
        if (response.error!.message ==
            "Failed host lookup: 'vwcmygvjzcpqgvrarsmx.supabase.co'") {
          /// No Internet
          getSnackBar(context, "لايوجد أنترنت");
        } else if(response.error!.message.contains("unique_violaton")){
                    getSnackBar(context, "لديك حساب بافعل");

        }else{
                    getSnackBar(context, response.error!.message);

        }

        /// Moust Wite For 1 mument for security
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      }else{
         if (response.statusCode == 200) {
        /// ok login Navigate
        ///
        // final appuserJson = await supabaseCleint
        //     .from("users")
        //     .select()
        //     .eq("email", response.user!.email)
        //     .execute();
        // List<dynamic> data = appuserJson.data;
        // if (data.isEmpty) {
        //   AppUser appUser = AppUser(
        //       id: response.user!.id,
        //       email: response.user!.email!,
        //       typeUser: TypeUser.benefactor.getStringNameTypeUser());
        //   await supabaseCleint.from("users").insert(appUser.toJson()).execute();
        //   Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

        //   //secssfull
          
        // } else {
        //   //error the email is in table but not register
        // }
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoute);
          getSnackBar(context, "تم إنشاء الحساب , قم بتاكيد البريد قبل تسجيل الدخول");
        print(response.data);
        print(response.user!.email);
        print(response.user!.id);
        print(response.user!.userMetadata);
        print(response.user!.aud);
      } else {
        print("state Code : ${response.statusCode}");
      }
      }

     
    } catch (e) {
      print("catch erorr : $e");
    }
    // Sign Ip user with email and password
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
