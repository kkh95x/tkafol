// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:takafol/src/chat/domain/chat_model.dart';
import 'package:takafol/src/chat/presentation/messages_page.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

class ChatCompnent extends StatelessWidget {
  ChatCompnent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getChats(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            const Center(
              child: Icon(Icons.error),
            );
          }

          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "لاتوجد رسائل حالياَ",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 80,
                      color: Colors.grey.shade300,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessagesPage(
                                  idChat: "${snapshot.data![index].id}",
                                  isFinised: snapshot.data![index].finished,
                                  myEmail: _myEmail,
                                ),
                              ));
                        },
                        leading: CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          foregroundColor: Colors.white,
                          radius: 50.0,
                          child: const Icon(
                            Icons.person_outlined,
                            size: 40,
                          ),
                        ),
                        trailing: Text(
                          GetTimeAgo.parse(snapshot.data![index].created_at!,
                              locale: "ar"),
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        title: Text(
                          !_isNeedy
                              ? snapshot.data![index].idNeedyUser
                              : snapshot.data![index].idBenefactorUSer,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: snapshot.data!.length);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  bool _isNeedy = false;
  String _myEmail = "";
  Future<List<ChatModel>> getChats(context) async {
    AppUser? appUser = await UserSharedPreference.getLocalUser();

    if (appUser == null) {
      supabaseCleint.auth.signOut();
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoute);
    }
    _myEmail = appUser?.email ?? "";
    String column = "";
    if (appUser!.typeUser == TypeUser.benefactor.getStringNameTypeUser()) {
      column = "emailBenefactorUSer";
      _isNeedy = false;
    } else {
      column = "emailNeedyUser";
      _isNeedy = true;
    }

    final response = await supabaseCleint
        .from("chats")
        .select()
        .eq(column, appUser.email)
        .order("created_at")
        .execute();
    if (response.error != null) {
      getSnackBar(context, "حدث خطأ");
    } else {}
    List<ChatModel> list = [];
    for (var x in response.data) {
      list.add(ChatModel.fromJson(x));
    }

    return list;
  }
}
