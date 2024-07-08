import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  RxDouble textFontSize = 15.0.obs;
  RxString textFontFamily = "Readex Pro".obs;
  RxDouble familyValue = 0.0.obs;
  RxInt color = Colors.black.value.obs;
  RxBool isDarkMode = ThemeMode.system == ThemeMode.dark ? true.obs : false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  changeDarkMode(bool value) {
    isDarkMode.value = value;
    if (isDarkMode.value) {
      color = Colors.white.value.obs;
    } else {
      color = Colors.black.value.obs;
    }
    saveSettings();

    update();
  }

  void changeColor(Color newcolor) {
    color.value = newcolor.value;
    saveSettings();

    update();
  }

  void changeFontSize(double value) {
    textFontSize.value = value;
    saveSettings();
  }

  void changeFontFamily(double value) {
    familyValue.value = value;
    switch (familyValue.value) {
      case 0:
        textFontFamily.value = "Readex Pro";
        break;
      case 1:
        textFontFamily.value = "Lalezar";
        break;
      case 2:
        textFontFamily.value = "Markazi Text";
        break;
      default:
    }
    saveSettings();
  }

  void saveSettings() {
    box.write('fontSize', textFontSize.value);
    box.write('colorText', color.value);
    box.write('darkmode', isDarkMode.value);

    box.write('fontFamily', textFontFamily.value);
    box.write('fontFamilyValue', familyValue.value);
  }

  void loadSettings() {
    isDarkMode.value =
        box.read('darkmode') ?? ThemeMode.system == ThemeMode.dark
            ? true
            : false;
    print(
        'isDark mode++++++++++++++++++++++++++++++++++++++++++++++ === ${isDarkMode.value}');
    familyValue.value = box.read('fontFamilyValue') ?? 0.0;
    textFontSize.value = box.read('fontSize') ?? 15.0;
    color.value = box.read('colorText') ?? Colors.black.value;
    textFontFamily.value = box.read('fontFamily') ?? "Readex Pro";
    update();
  }
}
