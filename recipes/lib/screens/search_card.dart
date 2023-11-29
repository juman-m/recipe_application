import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.data, required this.isUser});
  final String data;
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isUser
          ? const EdgeInsets.only(right: 18.0, top: 10)
          : const EdgeInsets.only(left: 18.0, top: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
        decoration: BoxDecoration(
            color: isUser
                ? const Color.fromARGB(255, 205, 203, 203)
                : const Color.fromARGB(157, 251, 139, 34),
            borderRadius: BorderRadius.circular(10)),
        child: Text(data),
      ),
    );
  }
}
