import 'package:flutter/material.dart';

class BananaForms extends StatefulWidget {
  const BananaForms({
    super.key,
    this.hintText,
    required this.labelText,
    required this.controller,
    required this.isPassword,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<BananaForms> createState() => _BananaFormsState();
}

class _BananaFormsState extends State<BananaForms> {
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  late bool _passwordVisible;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        labelText: widget.labelText,
        hintText: widget.hintText ?? '',
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      controller: widget.controller,
      obscureText: widget.isPassword ? !_passwordVisible : false,
    );
  }
}
