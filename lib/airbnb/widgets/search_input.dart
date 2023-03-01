import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(0.1))
      ]),
      child: TextField(
        controller: TextEditingController(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xffFF5A60),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "Where are you going?",
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            hintStyle: TextStyle(color: Colors.black.withOpacity(.75)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
    );
  }
}
