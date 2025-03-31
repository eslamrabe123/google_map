/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Roboto-Bold.ttf
  String get robotoBold => 'assets/fonts/Roboto-Bold.ttf';

  /// File path: assets/fonts/Roboto-Light.ttf
  String get robotoLight => 'assets/fonts/Roboto-Light.ttf';

  /// File path: assets/fonts/Roboto-MediumItalic.ttf
  String get robotoMediumItalic => 'assets/fonts/Roboto-MediumItalic.ttf';

  /// File path: assets/fonts/Roboto-Regular.ttf
  String get robotoRegular => 'assets/fonts/Roboto-Regular.ttf';

  /// List of all assets
  List<String> get values => [
    robotoBold,
    robotoLight,
    robotoMediumItalic,
    robotoRegular,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icons.png
  AssetGenImage get icons => const AssetGenImage('assets/icons/icons.png');

  /// List of all assets
  List<AssetGenImage> get values => [icons];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/images.png
  AssetGenImage get images => const AssetGenImage('assets/images/images.png');

  /// File path: assets/images/new_marker.png
  AssetGenImage get newMarker =>
      const AssetGenImage('assets/images/new_marker.png');

  /// List of all assets
  List<AssetGenImage> get values => [images, newMarker];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/empty.json
  LottieGenImage get empty => const LottieGenImage('assets/json/empty.json');

  /// File path: assets/json/error.json
  LottieGenImage get error => const LottieGenImage('assets/json/error.json');

  /// File path: assets/json/loading.json
  LottieGenImage get loading =>
      const LottieGenImage('assets/json/loading.json');

  /// File path: assets/json/map_style.json
  String get mapStyle => 'assets/json/map_style.json';

  /// File path: assets/json/success.json
  LottieGenImage get success =>
      const LottieGenImage('assets/json/success.json');

  /// List of all assets
  List<dynamic> get values => [empty, error, loading, mapStyle, success];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar-EG.json
  String get arEG => 'assets/translations/ar-EG.json';

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// List of all assets
  List<String> get values => [arEG, enUS];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
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

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
