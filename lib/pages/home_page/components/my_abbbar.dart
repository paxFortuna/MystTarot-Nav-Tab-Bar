import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyAbbBar extends StatelessWidget {
  final String title;
  VoidCallback onSearchTap;

  MyAbbBar({
    Key? key,
    required this.title,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
              ),
            ),
          ),
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[200],
              ),
              child: Icon(
                Icons.search,
                size: 36,
                color: Colors.grey[800],
              ),
            ),
          )
        ],
      ),
    );
  }
}
