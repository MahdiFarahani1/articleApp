/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDatabaseGen {
  const $AssetsDatabaseGen();

  /// File path: assets/database/db.sqlite
  String get db => 'assets/database/db.sqlite';

  /// List of all assets
  List<String> get values => [db];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/house-chimney.png
  AssetGenImage get houseChimney =>
      const AssetGenImage('assets/images/house-chimney.png');

  /// File path: assets/images/info.png
  AssetGenImage get info => const AssetGenImage('assets/images/info.png');

  /// File path: assets/images/list-timeline.png
  AssetGenImage get listTimeline =>
      const AssetGenImage('assets/images/list-timeline.png');

  /// File path: assets/images/search-alt.png
  AssetGenImage get searchAlt =>
      const AssetGenImage('assets/images/search-alt.png');

  /// File path: assets/images/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/images/settings.png');

  /// File path: assets/images/star_empty.png
  AssetGenImage get starEmpty =>
      const AssetGenImage('assets/images/star_empty.png');

  /// File path: assets/images/star_full.png
  AssetGenImage get starFull =>
      const AssetGenImage('assets/images/star_full.png');

  /// File path: assets/images/wishlist-star.png
  AssetGenImage get wishlistStar =>
      const AssetGenImage('assets/images/wishlist-star.png');

  /// File path: assets/images/yellowList.png
  AssetGenImage get yellowList =>
      const AssetGenImage('assets/images/yellowList.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        houseChimney,
        info,
        listTimeline,
        searchAlt,
        settings,
        starEmpty,
        starFull,
        wishlistStar,
        yellowList
      ];
}

class Assets {
  Assets._();

  static const $AssetsDatabaseGen database = $AssetsDatabaseGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
