import 'package:flutter/material.dart';
class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key,  required this.labeltext, required this.hintText,  required this.error, required this.controller, required this.obsecure, required this.submitted });

  final String labeltext, hintText;
  final String? error;
  final bool obsecure;
  final bool submitted;

  final TextEditingController controller;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  // create a TextEditingController


  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, TextEditingValue value, __){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: TextField(
            obscureText: widget.obsecure,
            controller: widget.controller,
            decoration:  InputDecoration(
                border: const OutlineInputBorder(

                ),

                labelText: widget.labeltext,
                hintText: widget.hintText,
                errorText: widget.submitted? widget.error:null
            ),

          ),
        );
      }

    );
  }
}
