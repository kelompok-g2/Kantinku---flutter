import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesignIcon extends StatelessWidget {
  const DesignIcon(this.asset, {super.key});
  final String asset;
  @override
  Widget build(BuildContext context) => SvgPicture.asset('assets/figma/$asset', fit: BoxFit.none);
}
