import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

import 'package:takafol/src/core/application/colors_manager.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key, required this.message, required this.isMyMessage,required this.createdAt});
  final String message;
  final bool isMyMessage;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: isMyMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(
            boxShadow:const [BoxShadow(color: Colors.white,offset: Offset(0, 3),blurRadius: 20)] ,
              color: isMyMessage ? AppColor.primaryColor : Colors.white,
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomRight:
                    isMyMessage ? const Radius.circular(20) : Radius.zero,
                bottomLeft:
                    isMyMessage ? Radius.zero : const Radius.circular(20),
              
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: [
              Expanded(
                flex: 1,
          
                child: Text(
                  message,
                  
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  style: TextStyle(
                      color: isMyMessage ? Colors.white : AppColor.primaryColor,
                      fontSize: 18),
                ),
              ),
               Align(
                alignment: Alignment.bottomLeft,
                 child: Text(
                  GetTimeAgo.parse(createdAt,locale: "ar"),
                  style:  TextStyle(
                      color: isMyMessage ? Colors.white : AppColor.primaryColor ,
                      fontSize: 12),
                             ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
