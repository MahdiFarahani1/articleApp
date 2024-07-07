import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/Settings/getx/setting_controller.dart';
import 'package:flutter_application_1/Features/Settings/view/widgets/base.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final settingController = Get.put(SettingController());
  @override
  void initState() {
    settingController.loadSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            fontFamily(context),
            fontSize(context),
            colorPick(context),
            darkMode(context),
          ],
        ),
      ),
    );
  }

  ItemSetting fontSize(BuildContext context) {
    return ItemSetting(
      icon: Icons.text_fields,
      child: Column(
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    trackHeight: 1,
                    inactiveTrackColor: const Color.fromRGBO(158, 158, 158, 1),
                    thumbColor: Colors.white,
                    inactiveTickMarkColor: Colors.grey,
                    activeTickMarkColor: Colors.transparent,
                    valueIndicatorColor: Theme.of(context).primaryColor,
                  ),
                  child: Slider(
                    label:
                        settingController.textFontSize.value.toInt().toString(),
                    divisions: 15,
                    value: settingController.textFontSize.value,
                    min: 10,
                    max: 25,
                    onChanged: (value) {
                      settingController.changeFontSize(value);
                    },
                  ),
                ),
              )),
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                  style: TextStyle(
                      fontSize: settingController.textFontSize.value,
                      color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }

  ItemSetting colorPick(BuildContext context) {
    return ItemSetting(
      icon: Icons.color_lens,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          child: Obx(() => ElevatedButton(
                onPressed: () {
                  pickColor(context);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Color(settingController.color.value),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: const Text("اختيار اللون"),
              )),
        ),
      ),
    );
  }

  ItemSetting fontFamily(BuildContext context) {
    return ItemSetting(
        icon: Icons.font_download,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SliderTheme(
                    data: const SliderThemeData(
                      activeTrackColor: Colors.white,
                      trackHeight: 1,
                      inactiveTrackColor: Color.fromRGBO(158, 158, 158, 1),
                      thumbColor: Colors.white,
                      inactiveTickMarkColor: Colors.grey,
                      activeTickMarkColor: Colors.transparent,
                    ),
                    child: Slider(
                      divisions: 2,
                      value: settingController.familyValue.value,
                      min: 0,
                      max: 2,
                      onChanged: (value) {
                        settingController.changeFontFamily(value);
                      },
                    ),
                  ),
                )),
            Obx(() => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                  style: GoogleFonts.getFont(
                    settingController.textFontFamily.value,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ))),
          ],
        ));
  }

  ItemSetting darkMode(BuildContext context) {
    return ItemSetting(
      icon: Icons.color_lens,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("فاتح"),
                EsaySize.gap(4),
                Obx(() => Switch(
                      value: settingController.isDarkMode.value,
                      onChanged: (value) {
                        settingController.changeDarkMode(value);
                        Get.changeThemeMode(settingController.isDarkMode.value
                            ? ThemeMode.dark
                            : ThemeMode.light);
                      },
                    )),
                EsaySize.gap(4),
                const Text("داكن")
              ],
            )),
      ),
    );
  }

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('اختيار اللون!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: Color(settingController.color.value),
                onColorChanged: (Color color) {
                  settingController.changeColor(color);
                },
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('اختيار'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
