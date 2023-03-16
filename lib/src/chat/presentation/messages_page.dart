// ignore_for_file: must_be_immutable

import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:takafol/src/chat/domain/donation_model.dart';
import 'package:takafol/src/chat/domain/massage_model.dart';
import 'package:takafol/src/chat/presentation/donation_widget.dart';
import 'package:takafol/src/chat/presentation/message_widget.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';

String myID = "1234";

class MessagesPage extends StatefulWidget {
  MessagesPage(
      {super.key,
      required this.idChat,
      required this.isFinised,
      required this.myEmail});
  String idChat;
  bool isFinised;
  String myEmail;
  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController _controller = TextEditingController();
  Future<DonationModel?> _getDonation() async {
    final response = await supabaseCleint
        .from("donations")
        .select()
        .eq("idChat", widget.idChat)
        .execute();
    if (response.error != null) {
      getSnackBar(context, "حدث خطأ");
      return null;
    } else {
      return DonationModel.fromJson(response.data.first);
    }
  }

  bool _showeMessage = false;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
          height: 80,
          width: 130,
          decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            child:const Text("عرض بيانات التبرع",style: TextStyle(color:Colors.white),),
            onPressed: () {
              SlideDialog.showSlideDialog(
                context: context,
                pillColor: Colors.black,
                backgroundColor: Colors.white,
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 500),
                child: FutureBuilder(
                    future: _getDonation(),
                    builder: (context, snapShote) {
                      if (snapShote.hasError) {
                        return const Center(
                          child: Icon(Icons.error),
                        );
                      } else if (snapShote.hasData) {
                        if (snapShote.data == null) {
                          return const Center(
                            child: Icon(Icons.error),
                          );
                        }
    
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon:const Icon(Icons.close,color:Colors.black)),
                            DonationWidget(
                              donationModel: snapShote.data!,
                              chatID: widget.idChat,
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              );
            },
          ),
        ),
    ),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                foregroundColor: AppColor.primaryColor,
                backgroundColor: Colors.white,
                radius: 20.0,
                child: const Icon(
                  Icons.person_outlined,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.idChat,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ),
      body: Column(children: [
        Visibility(
          visible: _showeMessage,
          child: Expanded(
            flex: 1,
            child: FutureBuilder(
                future: _getDonation(),
                builder: (context, snapShote) {
                  if (snapShote.hasError) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  } else if (snapShote.hasData) {
                    if (snapShote.data == null) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }

                    return DonationWidget(
                      donationModel: snapShote.data!,
                      chatID: widget.idChat,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
        Expanded(
          flex: 1,
          child: StreamBuilder(
              stream: _getMasseges(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                } else if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                    color: AppColor.primaryColor.withOpacity(0.5),
                      child: Text(
                        "لاتوجد رسائل",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  } else {
                    return Container(
                      color: AppColor.primaryColor.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          reverse: true,
                          controller: _scrollController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return MessageWidget(
                                createdAt: snapshot.data?[index].created_at ??
                                    DateTime.now(),
                                message: snapshot.data?[index].value ??
                                    "جزء من النص مفقود",
                                isMyMessage:
                                    snapshot.data?[index].emailSender ==
                                        widget.myEmail);
                          },
                        ),
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        Divider(
          color: Colors.grey.shade600,
        ),
        Visibility(
          visible: !widget.isFinised,
          child: SizedBox(
            height: 50,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 30),
                        child: Icon(
                          Icons.send,
                          color: AppColor.primaryColor,
                          size: 30,
                        ),
                      ),
                      onPressed: () async {
                        if (_controller.text.isNotEmpty) {
                          await _sendMasseg();
                          setState(() {});
                        }
                      },
                    ),
                    border: InputBorder.none,
                    hintText: "أكتب رسالتك هنا",
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey.shade400)),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Stream<List<MassageModle>> _getMasseges() {
    final response = supabaseCleint
        .from("massages:idChat=eq.${widget.idChat}")
        .stream(['id'])
        .order("created_at", ascending: false)
        .execute();

    return response.map<List<MassageModle>>(
        (event) => event.map((e) => MassageModle.fromJson(e)).toList());
  }

  Future<void> _sendMasseg() async {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      final response = await supabaseCleint.from("massages").insert({
        "idChat": widget.idChat,
        "emailSender": widget.myEmail,
        "value": message
      }).execute();
      if (response.error != null) {
        // ignore: use_build_context_synchronously
        getSnackBar(context, "حدث خطأ");
        print(response.error!.message);
      } else {
        _controller.clear();
        _scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
