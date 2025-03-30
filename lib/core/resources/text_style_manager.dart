// import 'package:flutter/material.dart';

// import 'font_manager.dart';

// class TextStylesManager {
//   const TextStylesManager._();

//   //arabic text font
//   static TextStyle arabicRegular =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.regular);
//   static TextStyle arabicMedium =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.medium);
//   static TextStyle arabicSemiBold =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.semiBold);
//   static TextStyle arabicBold =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.bold);
//   static TextStyle arabicExtraBold = const TextStyle(
//       fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.extraBold);

//   // english text font
//   static TextStyle englishRegular =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.regular);
//   static TextStyle englishMedium =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.medium);
//   static TextStyle englishSemiBold =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.semiBold);
//   static TextStyle englishBold =
//       const TextStyle(fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.bold);
//   static TextStyle englishExtraBold = const TextStyle(
//       fontFamily: FontConstants.fontFamily, fontWeight: FontWeightManager.extraBold);
// }

// class ShadowStyles {
//   const ShadowStyles._();

//   static List<BoxShadow> bottomSheetShadow = [
//     BoxShadow(
//       color: LightThemeColors.shadowBottomSheet,
//       blurRadius: 32,
//       offset: const Offset(4, 10),
//       spreadRadius: 0,
//     )
//   ];

//   static List<BoxShadow> cardShadow = [
//     const BoxShadow(
//       color: LightThemeColors.shadow,
//       blurRadius: 8,
//       offset: Offset(0, 1),
//       spreadRadius: 0,
//     )
//   ];
// }

// class GradientStyles {
//   const GradientStyles._();

//   static LinearGradient primaryGradient = const LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: LightThemeColors.gradientPrimary,
//   );
// }

// class InputDecorations {
//   const InputDecorations._();

//   static InputDecoration filled({
//     String? hint,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     bool isPassword = false,
//     bool obscuredValue = true,
//     bool smallSuffixIcon = false,
//     Color fillColor = LightThemeColors.background,
//     required ValueNotifier<bool> obscure,
//   }) {
//     return InputDecoration(
//       filled: true,
//       hintText: hint,
//       fillColor: fillColor,
//       contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
//       hintStyle: TextStylesManager.arabicRegular.s16.ellipsis.setColor(LightThemeColors.textHint),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide.none,
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide.none,
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide.none,
//       ),
//       prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
//       suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
//       prefixIcon: prefixIcon,
//       suffixIcon: isPassword
//           ? obscuredValue
//               ? const Icon(
//                   Icons.visibility_outlined,
//                   color: LightThemeColors.textHint,
//                 ).onTap(() => obscure.value = !obscuredValue)
//               : const Icon(
//                   Icons.visibility_off_outlined,
//                   color: LightThemeColors.textHint,
//                 ).onTap(() => obscure.value = !obscuredValue)
//           : suffixIcon,
//     );
//   }

//   static InputDecoration outlined({
//     String? hint,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     bool isPassword = false,
//     bool obscuredValue = true,
//     bool smallSuffixIcon = false,
//     required ValueNotifier<bool> obscure,
//   }) {
//     return InputDecoration(
//       filled: true,
//       hintText: hint,
//       fillColor: LightThemeColors.background,
//       contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
//       hintStyle: TextStylesManager.arabicRegular.s16.ellipsis.setColor(LightThemeColors.textHint),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: const BorderSide(color: LightThemeColors.primary),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: BorderSide(color: LightThemeColors.inputFieldBorder),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: const BorderSide(color: LightThemeColors.redTextColor),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(AppSize.inputBorderRadius),
//         borderSide: const BorderSide(color: LightThemeColors.redTextColor),
//       ),
//       prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
//       suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
//       prefixIcon: prefixIcon,
//       suffixIcon: isPassword
//           ? obscuredValue
//               ? const Icon(
//                   Icons.visibility_outlined,
//                   color: LightThemeColors.textHint,
//                 ).onTap(() => obscure.value = !obscuredValue)
//               : const Icon(
//                   Icons.visibility_off_outlined,
//                   color: LightThemeColors.textHint,
//                 ).onTap(() => obscure.value = !obscuredValue)
//           : suffixIcon,
//     );
//   }

//   static InputDecoration underlined({
//     String? hint,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     bool isPassword = false,
//     bool obscuredValue = true,
//     bool smallSuffixIcon = false,
//     Color fillColor = LightThemeColors.background,
//     required ValueNotifier<bool> obscure,
//   }) {
//     return InputDecoration(
//       filled: true,
//       hintText: hint,
//       fillColor: fillColor,
//       contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
//       hintStyle: TextStylesManager.arabicRegular.s16.ellipsis.setColor(LightThemeColors.textHint),
//       border:
//           UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.inputFieldBorder)),
//       focusedBorder:
//           const UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.primary)),
//       enabledBorder:
//           UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.inputFieldBorder)),
//       errorBorder:
//           const UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.redTextColor)),
//       focusedErrorBorder:
//           const UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.redTextColor)),
//       prefixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
//       suffixIconConstraints: smallSuffixIcon ? const BoxConstraints(maxWidth: .15) : null,
//       prefixIcon: prefixIcon,
//       suffixIcon: isPassword
//           ? obscuredValue
//               ? const Icon(
//                   Icons.visibility_outlined,
//                   color: LightThemeColors.textHint,
//                 ).onTap(() => obscure.value = !obscuredValue)
//               : const Icon(
//                   Icons.visibility_off_outlined,
//                   color: LightThemeColors.textHint,
//                 ).onTap(() => obscure.value = !obscuredValue)
//           : suffixIcon,
//     );
//   }
// }
