import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
  });
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 400,
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: Colors.grey.shade700,
          prefixIconColor: Colors.white,
          filled: true,
          constraints: const BoxConstraints.tightFor(width: 327, height: 60),
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: '',
        ),
      ),
    );
  }
}
