/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Black.ttf
  String get poppinsBlack => 'assets/fonts/Poppins-Black.ttf';

  /// File path: assets/fonts/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';

  /// File path: assets/fonts/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'assets/fonts/Poppins-ExtraBold.ttf';

  /// File path: assets/fonts/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'assets/fonts/Poppins-ExtraLight.ttf';

  /// File path: assets/fonts/Poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/Poppins-Light.ttf';

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// File path: assets/fonts/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/Poppins-Thin.ttf';

  /// List of all assets
  List<String> get values => [
    poppinsBlack,
    poppinsBold,
    poppinsExtraBold,
    poppinsExtraLight,
    poppinsLight,
    poppinsMedium,
    poppinsRegular,
    poppinsSemiBold,
    poppinsThin,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/HomeActive.svg
  String get homeActive => 'assets/images/HomeActive.svg';

  /// File path: assets/images/HomeInActive.svg
  String get homeInActive => 'assets/images/HomeInActive.svg';

  /// File path: assets/images/IconActive.svg
  String get iconActive => 'assets/images/IconActive.svg';

  /// File path: assets/images/IconInActive.svg
  String get iconInActive => 'assets/images/IconInActive.svg';

  /// File path: assets/images/Star.svg
  String get star => 'assets/images/Star.svg';

  /// File path: assets/images/area.svg
  String get area => 'assets/images/area.svg';

  /// File path: assets/images/bathroom.svg
  String get bathroom => 'assets/images/bathroom.svg';

  /// File path: assets/images/bed.svg
  String get bed => 'assets/images/bed.svg';

  /// File path: assets/images/error.svg
  String get error => 'assets/images/error.svg';

  /// File path: assets/images/fillHeart.svg
  String get fillHeart => 'assets/images/fillHeart.svg';

  /// File path: assets/images/heartActive.svg
  String get heartActive => 'assets/images/heartActive.svg';

  /// File path: assets/images/heartInActive.svg
  String get heartInActive => 'assets/images/heartInActive.svg';

  /// File path: assets/images/image 1.png
  AssetGenImage get image1 => const AssetGenImage('assets/images/image 1.png');

  /// File path: assets/images/image 2.png
  AssetGenImage get image2Png =>
      const AssetGenImage('assets/images/image 2.png');

  /// File path: assets/images/image2.svg
  String get image2Svg => 'assets/images/image2.svg';

  /// File path: assets/images/logoTest.svg
  String get logoTest => 'assets/images/logoTest.svg';

  /// File path: assets/images/phone.svg
  String get phone => 'assets/images/phone.svg';

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/whatsapp.svg
  String get whatsapp => 'assets/images/whatsapp.svg';

  /// List of all assets
  List<dynamic> get values => [
    homeActive,
    homeInActive,
    iconActive,
    iconInActive,
    star,
    area,
    bathroom,
    bed,
    error,
    fillHeart,
    heartActive,
    heartInActive,
    image1,
    image2Png,
    image2Svg,
    logoTest,
    phone,
    search,
    whatsapp,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
