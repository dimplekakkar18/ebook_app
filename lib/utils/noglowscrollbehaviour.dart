import 'package:flutter/material.dart';

// Pass this Scrollbehaviour wherever you need to disable the scroll glow or keep the BouncingScrollPhysics()
class NoGlowScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
