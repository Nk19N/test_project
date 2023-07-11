import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/Model/MenuProperties.dart';
import 'package:test_project/ViewModel/MenuSettingViewModel.dart';
import 'package:test_project/AdditionalViews/widget/ui/CustomDashboardMenu/MenuSettingScreen.dart';

Future<String> getSavedOption() async {
  final prefs = await SharedPreferences.getInstance();
  final savedOption = prefs.getString('selectedOption');
  return savedOption ?? 'Default';
}

Future<void> saveSelectedOption(String option) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedOption', option);
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[800],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void handleOnTap(
  BuildContext context,
  String onTap,
  List<MenuProperties> menuItems,
) {
  showToast(onTap);
}

Future<void> navigateToMenuSettingScreen(
    BuildContext context, List<MenuProperties> menuItems) async {
  unawaited(Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MenuSettingScreen(
        viewModel: MenuSettingViewModel(menuItems: menuItems),
      ),
    ),
  ),);
}

Future<List<MenuProperties>> getMenuPropertiesFromJsonFile() async {
  final jsonAsset = await rootBundle.loadString('assets/json/menu.json');
  final jsonData = jsonDecode(jsonAsset) as List<dynamic>;

  final menuPropertiesList = jsonData
      .map((data) => MenuProperties.fromJson(data as Map<String, dynamic>))
      .toList();

  return menuPropertiesList;
}

Future<void> saveModifiedMenuProperties(
    List<MenuProperties>? modifiedData) async {
  if (modifiedData != null) {
    final List<dynamic> jsonData = modifiedData.map((menu) {
      return {
        'routeName': menu.routeName,
        'image': menu.image,
        'displayName': menu.displayName,
        'category': menu.category,
        'arguments': menu.arguments,
        'onTap': menu.onTap,
        'shouldShowLoading': menu.shouldShowLoading,
      };
    }).toList();

    final appDirectory = await getApplicationDocumentsDirectory();
    final jsonFilePath = '${appDirectory.path}/menu.json';

    final assetData = await rootBundle.load('assets/json/menu.json');
    final bytes = assetData.buffer.asUint8List();
    await File(jsonFilePath).writeAsBytes(bytes);

    final jsonFile = File(jsonFilePath);

    if (await jsonFile.exists()) {
      final existingJsonString = await jsonFile.readAsString();
      final existingJsonData =
          json.decode(existingJsonString) as List<dynamic>;

      for (var modifiedItem in modifiedData) {
        final existingItem = existingJsonData.firstWhere(
          (item) => item['displayName'] == modifiedItem.displayName,
          orElse: () => null,
        );
        if (existingItem != null) {
          existingItem['routeName'] = modifiedItem.routeName;
          existingItem['image'] = modifiedItem.image;
          existingItem['displayName'] = modifiedItem.displayName;
          existingItem['category'] = modifiedItem.category;
          existingItem['arguments'] = modifiedItem.arguments;
          existingItem['onTap'] = modifiedItem.onTap;
          existingItem['shouldShowLoading'] = modifiedItem.shouldShowLoading;
        }
      }

      if (await jsonFile.exists()) {
        await jsonFile.delete();
      }

      await jsonFile.writeAsString(json.encode(existingJsonData));
    }

    if (kDebugMode) {
      print('Menu properties saved successfully.');
    }
  }
}
