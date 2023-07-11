
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Model/MenuProperties.dart';
import 'package:test_project/View/CustomDashboardMenuView.dart';
import 'package:test_project/ViewModel/CustomDashboardMenuViewModel.dart';
import 'package:test_project/ViewModel/menu_helper.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
   List<MenuProperties>? menuItems;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuProperties>?>(
      future:
          getMenuPropertiesFromJsonFile(), // Change the future type to nullable
      builder: (context, snapshot) {
        final savedMenuItems = snapshot.data ?? menuItems ?? [];
        if (kDebugMode) {
          print('number of list  ==  ${savedMenuItems.length}');
        }
        return FutureBuilder<String>(
          future: getSavedOption(), // Call the function from the helper file
          builder: (context, snapshot) {
            final selectedOption = snapshot.data ?? 'Default';
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  // Theme data
                  ),
              home: CustomDashboardMenuView(
                viewModel: CustomDashboardMenuViewModel(menuItems: menuItems, selectedOption: selectedOption),
              ),
            );
          },
        );
      },
    );
  }
}
