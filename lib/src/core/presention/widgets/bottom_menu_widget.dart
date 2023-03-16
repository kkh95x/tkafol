// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart' as fr;
import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/constant.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/core/presention/widgets/alter_loading_dialog.dart';
import 'package:takafol/src/core/presention/widgets/alter_map_dialog.dart';
import 'package:takafol/src/core/presention/widgets/custom_button.dart';
import 'package:takafol/src/core/presention/widgets/text_filde_form.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

class BottomPersonMenu extends StatefulWidget {
  BottomPersonMenu(
      {super.key,
      required this.email,
      required this.id,
      required this.cityName,
      required this.latLng,
      this.onTapSendMassageButtom});
  String email;
  String id;
  String cityName;
  LatLng latLng;

  dynamic Function()? onTapSendMassageButtom;

  @override
  State<BottomPersonMenu> createState() => _BottomPersonMenuState();
}

class _BottomPersonMenuState extends State<BottomPersonMenu> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  final TextEditingController _typeDonationController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _countController = TextEditingController();

  final TextEditingController _weightController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

  DateTime _dateTime = DateTime.now().add(const Duration(hours: 5));
  LatLng? latLng;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Text(
              "بيانات المحتاج",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            getMyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "المعرف:",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.id,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            getMyContainer(
              child: Row(
                children: [
                  const Icon(Icons.location_city),
                  Text("المدينة:     ${widget.cityName}",
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "أدخل بيانات التبرع",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            TextFildeWidget(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "حقل مطلوت";
                  }
                  return null;
                },
                controller: _typeDonationController,
                icon: const Icon(Icons.food_bank),
                label: "نوع التبرع: مثال طعام,ألبسة ...الخ"),
            TextFildeWidget(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "حقل مطلوت";
                  }
                  return null;
                },
                controller: _countController,
                icon: const Icon(Icons.numbers),
                label: "العدد"),
            TextFildeWidget(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "حقل مطلوت";
                  }
                  return null;
                },
                controller: _locationController,
                icon: const Icon(Icons.location_pin),
                label: "الموقع مثال: أعزاز -دوار الكفين"),
            TextFildeWidget(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "حقل مطلوت";
                  }
                  return null;
                },
                controller: _weightController,
                icon: const Icon(Icons.numbers),
                label: " الوزن مثال: 250 غرام"),
            TextFildeWidget(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return "حقل مطلوت";
                  }
                  return null;
                },
                controller: _notesController,
                icon: const Icon(Icons.note),
                label: "ملاحظات"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                title: const Text(
                  "أختر موقع من الخريطة",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  latLng == null ? "لم يتم أختيار موقع" : "تم تحديد الموقع",
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.explore,
                  color: Colors.white,
                ),
                onTap: () {
                  MapsDialog.showLoadingDialog(
                    context: context,
                    target: widget.latLng,
                    onTap: (p0) {
                      latLng = p0;
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.white,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                title: Text(
                  "وقت انتهاء الأنتظار  - أضغط للتغيير",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white, fontSize: 14),
                ),
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime.now().add(const Duration(days: 45)),
                    onChanged: (date) {
                      // print('change $date');
                    },
                    onConfirm: (date) {
                      _dateTime = date;
                      setState(() {});
                      // print('confirm $date');
                    },
                    currentTime: DateTime.now(),
                    locale: LocaleType.ar,
                  );
                },
                subtitle: Text(
                  fr.DateFormat("يوم  MM/d  الساعة  hh:mm").format(_dateTime),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white, fontSize: 12),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime.now().add(const Duration(days: 45)),
                        onChanged: (date) {
                      // print('change $date');
                    }, onConfirm: (date) {
                      _dateTime = date;
                      setState(() {});
                      // print('confirm $date');
                    }, currentTime: DateTime.now(), locale: LocaleType.ar);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              name: "أرسل التبرع",
              forcColor: Colors.white,
              backColor: Colors.green,
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await _sendDonation();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _typeDonationController.dispose();
    _countController.dispose();
    _locationController.dispose();
    _weightController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Padding getMyContainer({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.primaryColor)),
          child: child),
    );
  }

  Future<void> _sendDonation() async {
          FocusScope.of(context).unfocus();

    if (latLng == null) {
    
       return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تنويه'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('لم يتم تحديد الموقع على الخريطة',style: TextStyle(fontSize: 16),),
                Text('يرجى الضغط على زر تحديد الموقع والمحاولة مرة أخرى',style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('حسنا'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
    }
    AppUser? appUser = await UserSharedPreference.getLocalUser();
    if (appUser == null ||
        appUser.typeUser == TypeUser.needy.getStringNameTypeUser()) {
      supabaseCleint.auth.signOut();
      Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
    }
    Dialogs.showLoadingDialog(context, _keyLoader);

    String? chatID = await _creatChat(appUser!.email, appUser.id!);
    if (chatID != null) {

      final typeDonation = _typeDonationController.text.trim();
      final contDonation = _countController.text.trim();
      final location = _locationController.text.trim();
      final weightDonation = _weightController.text.trim();
      DateTime witing = _dateTime;

      final notes = _notesController.text.trim();

      final response = await supabaseCleint.from("donations").insert({
        "count": contDonation,
        "location": location,
        "waitingTime": witing.toString(),
        "typeDonation": typeDonation,
        "weight": weightDonation,
        "notes": notes,
        "emailBenefactorUSer": appUser.email,
        "emailNeedyUser": widget.email,
        "idChat": chatID,
        "longitude": latLng!.longitude,
        "latitude":latLng!.latitude
      }).execute();
      if (response.error != null) {
        getSnackBar(context, "حدث خطأ");
      }
      Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      Navigator.pop(context);
      getSnackBar(context, "تم أرسال التبرع");
    } else {}

    //  DonationModel(createdat:DateTime.now(), emailBenefactorUSer:appUser!.email , emailNeedyUser: widget.email, idChat: idChat)
  }

  Future<String?> _creatChat(String email, String id) async {
    final response = await supabaseCleint.from("chats").insert({
      "idBenefactorUSer": id,
      "idNeedyUser": widget.id,
      "emailBenefactorUSer": email,
      "emailNeedyUser": widget.email
    }).execute();

    if (response.error != null) {
      if (response.error!.message ==
          "Failed host lookup: 'arfdcvyjxxdtawwywvyr.supabase.co'") {
        getSnackBar(context, "check your Enternet");
      } else {
        getSnackBar(context, response.error!.message);
      }
      print(response.error!.message);
      return null;
    } else {
      List<dynamic> data = response.data;
      return data.first['id'];
    }
  }
}
