// ignore_for_file: must_be_immutable
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:intl/intl.dart' as fr;
import 'package:flutter/material.dart';
import 'package:takafol/src/chat/domain/donation_model.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/core/presention/widgets/alter_map_dialog.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

class DonationWidget extends StatefulWidget {
  DonationWidget(
      {super.key, required this.donationModel, required this.chatID});
  DonationModel donationModel;
  String chatID;
  @override
  State<DonationWidget> createState() => _DonationWidgetState();
}

class _DonationWidgetState extends State<DonationWidget> {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(widget.donationModel.waitingTime!);

    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Material(
          // elevation: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration:
                BoxDecoration(border: Border.all(color: AppColor.primaryColor)),
            child: Column(
              children: [
                getRow(context, "النوع",
                    (widget.donationModel.typeDonation ?? "غير معروف")),
                const Divider(
                  color: Colors.grey,
                ),
                getRow(context, "العدد",
                    (widget.donationModel.count ?? "غير معروف")),
                const Divider(
                  color: Colors.grey,
                ),
                getRow(context, "الوزن",
                    (widget.donationModel.weight ?? "غير معروف")),
                const Divider(
                  color: Colors.grey,
                ),
                getRow(context, "ملاحظات",
                    (widget.donationModel.notes ?? "غير معروف")),
                const Divider(
                  color: Colors.grey,
                ),
                getRow(context, "المكان",
                    (widget.donationModel.location ?? "غير معروف")),
                const Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "الموقع على الخريطة",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        MapsDialog.showMarkerInMap(
                            context: context,
                            target: LatLng(widget.donationModel.latitude!,
                                widget.donationModel.longitude!));
                      },
                      child: Text(
                        "أنقر لعرض الموقع",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    )
                  ],
                ),
                getRow(
                    context,
                    "انتهاء مهلة الأنتظار",
                    (fr.DateFormat("يوم  MM/dd  الساعة  hh:mm").format(date)
                    // " الساعة ${date.hour} : ${date.minute}  اليوم ${date.month}  من الشهر ${date.day} "

                    //  GetTimeAgo.parse(
                    //     DateTime.parse(widget.donationModel.waitingTime!),
                    //     locale: "ar",
                    //   )
                    )),
                FutureBuilder(
                    future: _isNeedy(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!) {
                          return getRowNeedy();
                        } else {
                          return getRow(
                              context,
                              "الحالة:",
                              // ignore: prefer_interpolation_to_compose_strings
                              (widget.donationModel.accepted
                                      ? "تم تاكيد القبول"
                                      : "لم يتم تاكيد القبول") +
                                  '        ' +
                                  (widget.donationModel.receive
                                      ? "تم تاكيد الأستلام"
                                      : "لم يتم تاكيد الأستلام"));
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  Row getRowNeedy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: widget.donationModel.accepted
              ? null
              : () async {
                  await _accept(context);
                },
          child: Text(
            widget.donationModel.accepted ? "تم القبول" : "قبول",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        ElevatedButton(
            onPressed: widget.donationModel.accepted
                ? widget.donationModel.receive
                    ? null
                    : () async {
                        await _receved(context);
                      }
                : null,
            child: Text(
                widget.donationModel.receive ? "تم الأستلام" : "أستلمت؟",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white))),
      ],
    );
  }

  Future<void> _accept(context) async {
    final response = await supabaseCleint
        .from("donations")
        .update({"accepted": true})
        .eq("id", widget.donationModel.id)
        .execute();
    if (response.error != null) {
      getSnackBar(context, "حدث خطأ");
    } else {
      bool accpted = response.data.first['accepted'];
      widget.donationModel = widget.donationModel.copyWith(accepted: accpted);
      setState(() {});
    }
  }

  Future<void> _receved(context) async {
    final response = await supabaseCleint
        .from("donations")
        .update({"receive": true})
        .eq("id", widget.donationModel.id)
        .execute();
    if (response.error != null) {
      getSnackBar(context, "حدث خطأ");
    } else {
      bool receive = response.data.first['receive'];
      await supabaseCleint
          .from("chats")
          .update({"finished": true})
          .eq("id", widget.chatID)
          .execute();
      widget.donationModel = widget.donationModel.copyWith(receive: receive);
      setState(() {});
    }
  }

  Widget getRow(BuildContext context, String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.normal, fontSize: 14),
        )
      ],
    );
  }

  Future<bool> _isNeedy(context) async {
    AppUser? appUser = await UserSharedPreference.getLocalUser();
    if (appUser == null) {
      supabaseCleint.auth.signOut();
      UserSharedPreference.deleteLocalUser();
      Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
    }
    if (appUser!.typeUser == TypeUser.needy.getStringNameTypeUser()) {
      return true;
    } else {
      return false;
    }
  }
}
