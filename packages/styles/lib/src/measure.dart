import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Measure {
  // MARK: - Space
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;

  // MARK: - Gap
  static const Gap gap4 = Gap(Measure.space4);
  static const Gap gap8 = Gap(Measure.space8);
  static const Gap gap12 = Gap(Measure.space12);
  static const Gap gap16 = Gap(Measure.space16);

  // MARK: - EdgeInsets(padding)
  static const EdgeInsets paddingL4 = EdgeInsets.only(left: Measure.space4);
  static const EdgeInsets paddingT4 = EdgeInsets.only(top: Measure.space4);
  static const EdgeInsets paddingR4 = EdgeInsets.only(right: Measure.space4);
  static const EdgeInsets paddingB4 = EdgeInsets.only(bottom: Measure.space4);
  static const EdgeInsets paddingH4 =
      EdgeInsets.symmetric(horizontal: Measure.space4);
  static const EdgeInsets paddingV4 =
      EdgeInsets.symmetric(vertical: Measure.space4);
  static const EdgeInsets paddingA4 = EdgeInsets.all(Measure.space4);
  static const EdgeInsets paddingL8 = EdgeInsets.only(left: Measure.space8);
  static const EdgeInsets paddingT8 = EdgeInsets.only(top: Measure.space8);
  static const EdgeInsets paddingR8 = EdgeInsets.only(right: Measure.space8);
  static const EdgeInsets paddingB8 = EdgeInsets.only(bottom: Measure.space8);
  static const EdgeInsets paddingH8 =
      EdgeInsets.symmetric(horizontal: Measure.space8);
  static const EdgeInsets paddingV8 =
      EdgeInsets.symmetric(vertical: Measure.space8);
  static const EdgeInsets paddingA8 = EdgeInsets.all(Measure.space8);
  static const EdgeInsets paddingL12 = EdgeInsets.only(left: Measure.space12);
  static const EdgeInsets paddingT12 = EdgeInsets.only(top: Measure.space12);
  static const EdgeInsets paddingR12 = EdgeInsets.only(right: Measure.space12);
  static const EdgeInsets paddingB12 = EdgeInsets.only(bottom: Measure.space12);
  static const EdgeInsets paddingH12 =
      EdgeInsets.symmetric(horizontal: Measure.space12);
  static const EdgeInsets paddingV12 =
      EdgeInsets.symmetric(vertical: Measure.space12);
  static const EdgeInsets paddingA12 = EdgeInsets.all(Measure.space12);
  static const EdgeInsets paddingL16 = EdgeInsets.only(left: Measure.space16);
  static const EdgeInsets paddingT16 = EdgeInsets.only(top: Measure.space16);
  static const EdgeInsets paddingR16 = EdgeInsets.only(right: Measure.space16);
  static const EdgeInsets paddingB16 = EdgeInsets.only(bottom: Measure.space16);
  static const EdgeInsets paddingH16 =
      EdgeInsets.symmetric(horizontal: Measure.space16);
  static const EdgeInsets paddingV16 =
      EdgeInsets.symmetric(vertical: Measure.space16);
  static const EdgeInsets paddingA16 = EdgeInsets.all(Measure.space16);

  // MARK: - Corner Radius
  static const radius2 = Radius.circular(2);
  static const radius4 = Radius.circular(4);
  static const radius6 = Radius.circular(6);
  static const radius8 = Radius.circular(8);

  // MARK: - Border Radius
  static const borderRadius2 = BorderRadius.all(Measure.radius2);
  static const borderRadius4 = BorderRadius.all(Measure.radius4);
  static const borderRadius6 = BorderRadius.all(Measure.radius6);
  static const borderRadius8 = BorderRadius.all(Measure.radius8);
}
