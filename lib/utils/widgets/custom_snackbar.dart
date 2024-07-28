import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      content: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            removePrefixAfterColon(message),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3), // Optional duration
    ),
  );
}

String removePrefixAfterColon(String input) {
  int indexOfColon = input.indexOf(":");
  return indexOfColon != -1 ? input.substring(indexOfColon + 1).trim() : input;
}
