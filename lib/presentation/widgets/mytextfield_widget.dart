import 'package:book_shop/domain/models/textfield_models/textfield_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constanst/All_text.dart';

class MyTextFieldWidget extends StatefulWidget {
  final TextFieldModel model;

  const MyTextFieldWidget({
    super.key,
    required this.model,
  });

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            controller: widget.model.controller,
            obscureText: widget.model.obscureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: widget.model.hintText,
                hintStyle: customStyle,
                suffixIcon: IconButton(
                  icon:widget.model.isNeed? Icon(
                    widget.model.obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ):const SizedBox.shrink(),
                  onPressed: () {
                    setState(() {
                      widget.model.obscureText=!widget.model.obscureText;
                    });

                  },
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
