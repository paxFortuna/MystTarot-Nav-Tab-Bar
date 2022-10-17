import 'package:flutter/material.dart';
import 'package:ui_nft_app/components/nft_card.dart';

class RecentTab extends StatelessWidget {
  const RecentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NftCard(imagePath: 'lib/images/apiens_3.png');
  }
}
