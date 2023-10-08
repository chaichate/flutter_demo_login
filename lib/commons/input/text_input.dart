import 'package:flutter/material.dart';
import '../../constants/styles.dart';

class TextInputField extends StatefulWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  const TextInputField({
    Key? key,
    this.labelText,
    this.validator,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12.0,
      ),
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey[500],
        ),
        filled: true,
        fillColor: Styles.greyColor50,
        contentPadding: const EdgeInsets.all(15.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: widget.validator,
      keyboardType: TextInputType.text,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
