import 'package:flutter/material.dart';

import 'package:takafol/src/core/application/colors_manager.dart';

class TextFildeWidget extends StatefulWidget {
  TextFildeWidget(
      {super.key,
      required this.label,
      this.isPassword,
      this.keyboardType,
      this.icon,
      this.validator,
      this.onChanged,
      this.controller});
  TextEditingController? controller;
  String label;
  bool? isPassword;
  TextInputType? keyboardType;
  Widget? icon;
  String? Function(String?)? validator;
  void Function(String?)? onChanged;

  @override
  State<TextFildeWidget> createState() => _TextFildeWidgetState();
}

class _TextFildeWidgetState extends State<TextFildeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Material(
        elevation: 4,
        shadowColor: Colors.white,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            validator: widget.validator,
            obscureText: widget.isPassword ?? false,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                suffixIcon: widget.isPassword != null
                    ? IconButton(
                        onPressed: () {
                         widget.isPassword = !widget.isPassword!;
                          setState(() {});
                        },
                        icon: Icon(widget.isPassword!
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye_rounded))
                    : null,
                hintText: widget.label,
                hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.primaryColor.withOpacity(0.5),
                    fontSize: 20),
                prefixIcon: widget.icon),
          ),
        ),
      ),
    );
  }
}
