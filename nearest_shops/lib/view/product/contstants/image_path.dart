import '../../../core/extension/string_extension.dart';

class ImagePaths {
  static ImagePaths? _instance;
  static ImagePaths get instance {
    return _instance ??= ImagePaths._init();
  }

  ImagePaths._init();

    final hotDog = "hotdog".toImagePath;

    final facebookSVG = "facebook".toSVG;
    final googleSVG = "google".toSVG;
    final localization1SVG = "localization1".toSVG;
    final localization2SVG = "localization2".toSVG;
    final localization3SVG = "localization3".toSVG;
  
}
