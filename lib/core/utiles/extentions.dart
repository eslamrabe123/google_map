import 'package:flutter/material.dart';

import '../../exports.dart';

extension Photo on String {
  String png([String? path = "images"]) => 'assets/$path/$this.png';
  String svg([String path = "icons"]) => 'assets/$path/$this.svg';
  String jpeg([String path = "icons"]) => 'assets/$path/$this.jpg';
}

extension Dates on String {
  String formattedDate([String format = "MMM dd, yyyy"]) {
    if (isNotEmpty) {
      DateTime date = DateTime.parse(this);
      return DateFormat(format, Utils.lang).format(date);
    }

    return "";
  }
}

extension ChatTime on String {
  String chatFormattedDate([String format = "h:mm a"]) {
    if (isNotEmpty) {
      DateTime date = DateTime.parse(this);
      return DateFormat(format, Utils.lang).format(date);
    }

    return "";
  }
}

//? context extentions
extension ContextExtensions on BuildContext {
  // size
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

extension MySLiverBox on Widget {
  SliverToBoxAdapter get sliverBox => SliverToBoxAdapter(
        child: this,
      );
  SliverToBoxAdapter get sliverPadding => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: this,
        ),
      );
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension DateTimeParsing on String {
  String parseDateTime() {
    var dateTime = DateTime.tryParse(this);

    var formate1 = "${dateTime?.day} -${dateTime?.month} -${dateTime?.year}";

    return formate1;
  }
}

extension ToDouble on String {
  double doubleParse() => double.tryParse(this) ?? 0;
}

extension DebugLog on String {
  void logIfDebug() {
    if (kDebugMode) {
      log(this);
    }
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", ""); //0xff012547
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
