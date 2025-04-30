abstract class HskButtonSizes {
  HskBaseButtonSizes get base;
}

abstract class HskBaseButtonSizes {
  HskPrimaryBaseButtonSize get primary;
}

abstract class HskPrimaryBaseButtonSize {
  double get vertical;
  double get horizontal;
}