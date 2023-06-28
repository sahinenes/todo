class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  // String get logo => toPng('veli');
  // String get hotDog => toPng('hotdogs');
  // String get projeIcon => toPng('cirlce_hwa');

  //String get notFound => toSVG('not_found');


  String toPng(String name) => 'assets/images/$name.png';
  String toSVG(String name) => 'assets/images/$name.svg';
}
