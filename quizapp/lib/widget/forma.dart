import 'package:flutter/material.dart';

class Forma extends StatelessWidget {
  Forma({super.key, required this.hint, this.obscure = false, required this.icon});

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ovo polje ne može biti prazno';
    }
    if (hint == 'Email' && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Unesite validnu email adresu';
    }
    if (hint == 'Telefonski broj' && !RegExp(r'^\d+$').hasMatch(value)) {
      return 'Unesite validan broj telefona';
    }
    if (hint == 'Lozinka' && value.length < 6) {
      return 'Lozinka mora imati najmanje 6 znakova';
    }
    return null;
  }

  final String hint;
  bool obscure = false;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          suffixIcon: icon,
        ),
        validator: _validateInput,
      ),
    );
  }
}
