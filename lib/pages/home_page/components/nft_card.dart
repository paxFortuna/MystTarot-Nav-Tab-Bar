import 'package:flutter/material.dart';

class NftCard extends StatelessWidget {
  final String imagePath;

  const NftCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ClipRRect(
        child: Image.asset(
          imagePath,
          fit: BoxFit.fitHeight          ,
        ),
      ),
    );
  }
}
