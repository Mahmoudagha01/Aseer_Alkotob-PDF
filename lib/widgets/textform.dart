import 'package:flutter/material.dart';

class TFF with ChangeNotifier {
  FocusNode? focus;
 tabed({required FocusNode currentfocus}) {
    focus = currentfocus;
    notifyListeners();
  }
  Widget textForm(
      {TextInputType? type,
      IconData? icon,
      String? label,
      FocusNode? focus,
      required VoidCallback tabed,
      required String? Function(String? val)? v,
       Function(String? val)? save,
    void Function(String val)? onChanged,
      required TextEditingController controller,
      bool? obsecure}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Material(
        elevation: focus!.hasFocus ? 10 : 0,
        child: TextFormField(
          controller: controller ,
          obscureText: obsecure!,
          validator: v,
          onSaved: save,
          onChanged: onChanged,
          keyboardType: type,
          focusNode: focus,
          onTap: tabed,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black54,
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: focus.hasFocus ? Colors.black : Colors.black54,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: false,
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
