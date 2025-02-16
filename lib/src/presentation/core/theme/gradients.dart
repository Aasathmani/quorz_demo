import 'package:flutter/material.dart';

Gradient topToBottomLinearGradient(BuildContext context) {
  return LinearGradient(
    colors: [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColorLight,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

Gradient topLeftToBottomRightLinearGradient(
    List<Color> colors,
    ) {
  return LinearGradient(
    colors: colors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

Gradient buttonGradient(BuildContext context) {
  return LinearGradient(
    colors: [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColorLight,
    ],
  );
}

Gradient topCenterToBottomCenterGradient(List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

Gradient bottomCenterToTopCenterGradient(List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
