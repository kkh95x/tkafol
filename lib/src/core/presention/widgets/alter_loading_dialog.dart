import 'package:flutter/material.dart';

void getSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
      content: ListTile(
    trailing: const Icon(
      Icons.info,
      color: Colors.white,
    ),
    title: Text(
      message,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontSize: 18, color: Colors.white),
    ),
  ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "الرجاء الإنتظار",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.blueAccent,
                                  ),
                        )
                      ]),
                    )
                  ]));
        });
  }

}
