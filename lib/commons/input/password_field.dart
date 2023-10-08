import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class PasswordInputField extends StatefulWidget {
  final String? labelText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextEditingController textEditingController;

  const PasswordInputField({
    Key? key,
    this.labelText,
    this.validator,
    this.prefixIcon,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;
  bool _isFocused = false;
  bool _hasText = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasText = widget.textEditingController.text.isNotEmpty;
    });
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12.0,
      ),
      controller: widget.textEditingController,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey[500],
        ),
        contentPadding: const EdgeInsets.all(15.0),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        fillColor: Styles.greyColor50,
        filled: true,
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
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
    );
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }
}
