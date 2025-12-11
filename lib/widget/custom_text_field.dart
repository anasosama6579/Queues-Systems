import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.unicodeSymbol,required this.onSubmitted});
  final String unicodeSymbol;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSubmitted,
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 2),
            child: Text(unicodeSymbol,style: TextStyle(fontSize: 24),),
          )
      ),
    );
  }
}
