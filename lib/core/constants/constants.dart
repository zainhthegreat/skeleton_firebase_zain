import 'package:flutter/material.dart';

class Constants {
  static const appName = 'skeleton';
}

//Vertical Spacers
const vSpacerXS = SizedBox(
  height: paddingXS,
);
const vSpacerS = SizedBox(
  height: paddingS,
);
const vSpacerSM = SizedBox(
  height: paddingSM,
);
const vSpacerM = SizedBox(
  height: paddingM,
);
const vSpacerXM = SizedBox(
  height: paddingXM,
);
const vSpacerL = SizedBox(
  height: paddingL,
);
const vSpacerXL = SizedBox(
  height: paddingXL,
);
const vSpacerXXL = SizedBox(
  height: paddingXXL,
);
SizedBox vSpacerCustom(double height) {
  return SizedBox(
    height: height,
  );
}

//Horizontal spacers
const hSpacerXS = SizedBox(
  width: paddingXS,
);
const hSpacerS = SizedBox(
  width: paddingS,
);
const hSpacerSM = SizedBox(
  width: paddingSM,
);
const hSpacerM = SizedBox(
  width: paddingM,
);
const hSpacerXM = SizedBox(
  width: paddingXM,
);
const hSpacerL = SizedBox(
  width: paddingL,
);
const hSpacerXL = SizedBox(
  width: paddingXL,
);
const hSpacerXXL = SizedBox(
  width: paddingXXL,
);
SizedBox hSpacerCustom(double width) {
  return SizedBox(
    width: width,
  );
}

const paddingZero = 0.0;
const paddingXS = 2.0;
const paddingS = 4.0;
const paddingSM = 6.0;
const paddingM = 8.0;
const paddingXM = 12.0;
const paddingL = 16.0;
const paddingXL = 24.0;
const paddingXXL = 32.0;
