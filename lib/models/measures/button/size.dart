abstract class HskButtonSizes {
  HskBaseButtonSizes get base;
}

abstract class HskBaseButtonSizes {
  HskSmallBaseButtonSize get small;
  HskSmallBaseButtonSize get medium;
  HskSmallBaseButtonSize get large;
}

abstract class HskSmallBaseButtonSize {
  double get vertical;
  double get horizontal;
  double get labelHeight;
}