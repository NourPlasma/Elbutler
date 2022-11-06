class AppAssets {
  static String profileDummy = 'profile_dummy'.png;
}

extension ImageExt on String {
  String get png => 'assets/icons/$this.png';
  String get svg => 'assets/icons/$this.svg';
  String get jpeg => 'assets/icons/$this.jpeg';
}