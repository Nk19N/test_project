import 'package:test_project/Model/MenuProperties.dart';
import 'package:test_project/ViewModel/menu_helper.dart';

class CustomDashboardMenuViewModel {
  final List<MenuProperties> menuItems;
  final String selectedOption;

  CustomDashboardMenuViewModel({
    required this.menuItems,
    required this.selectedOption,
  });

  void handleMenuItemTap(int index) {
    final menuItem = menuItems[index];
    // Implement the logic for handling menu item taps, such as navigation or performing actions.
    // You can utilize the MenuHelper or other relevant functionality.
   // handleOnTap(menuItem.onTap as,menuItems as String);
  }
}
