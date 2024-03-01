import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';

ConstantContainer decorationsContainer = ConstantContainer({
  'InputBlock.TextFieldDecoration': const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)))),
  'OutputBlock.ShaderMask.Mask': const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black,
      Colors.transparent,
      Colors.transparent,
      Colors.black
    ],
    stops: [0.0, 0.05, 0.9, 1.0],
  ),
  'navigation_button.style': ButtonStyle(
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    overlayColor: const MaterialStatePropertyAll(Color(0xff116611)),
    backgroundColor: const MaterialStatePropertyAll(Color(0xff339933)),
    iconColor: const MaterialStatePropertyAll(
      Color(0xfffcfdf7),
    ),
  )
});
