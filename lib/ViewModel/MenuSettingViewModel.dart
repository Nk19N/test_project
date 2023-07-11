import 'package:test_project/Model/MenuProperties.dart';

class MenuSettingViewModel {
  final List<MenuProperties>? menuItems;
  late String selectedOption;

  MenuSettingViewModel({required this.menuItems}) {
    getSavedOption();
  }

  Future<void> getSavedOption() async {
    // Simulate retrieving the saved option from storage or any other source
    await Future.delayed(const Duration(seconds: 2));
    selectedOption = 'Default'; // Replace with your actual logic to get the saved option
  }

  Future<void> saveModifiedMenuProperties() async {
    // Implement the logic to save the modified menu items
    // You can use the menuItems property to access the reordered items
    // Replace this with your actual logic to save the menu items
    await Future.delayed(const Duration(seconds: 2));
    print('Menu items saved!');
  }

  void handleOptionSelection(String? value) {
    if (value != null) {
      selectedOption = value;
      // Handle the selectedvalue and perform any necessary operations or updates
      print('Selected value: $selectedOption');
    }
  }

  void reorderMenuItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final MenuProperties item = menuItems!.removeAt(oldIndex);
    menuItems!.insert(newIndex, item);
  }
}
