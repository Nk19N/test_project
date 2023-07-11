import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_project/Entry%20Point/main.dart';
import 'package:test_project/Model/MenuProperties.dart';
import 'package:test_project/ViewModel/menu_helper.dart';


class ViewAllMenuScreen extends StatelessWidget {

  const ViewAllMenuScreen({super.key, required this.menuItems});
  final List<MenuProperties> menuItems;

  Map<String, List<MenuProperties>> groupItemsByCategory(
      List<MenuProperties> items) {
    final groupedItems = <String, List<MenuProperties>>{};
    for (final item in items) {
      final category = item.category ??
          'Uncategorized'; // Provide a default value for null categories
      if (groupedItems.containsKey(category)) {
        groupedItems[category]!.add(item);
      } else {
        groupedItems[category] = [item];
      }
    }
    return groupedItems;
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        menuItems.where((item) => item.category != null).toList();
    final groupedItems = groupItemsByCategory(filteredItems);

    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press here
        // For example, you can navigate back to the previous screen
        unawaited(Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        ),);
        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View All'),
        ),
        body: ListView.builder(
          itemCount: groupedItems.length,
          itemBuilder: (BuildContext context, int index) {
            final category = groupedItems.keys.elementAt(index);
            final items = groupedItems[category]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 4,
                  padding:  const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (int i = 0; i < items.length; i++)
                      GestureDetector(
                        onTap: () {
                          handleOnTap(context, items[i].onTap, menuItems);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                          child: Align(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 20,
                                    child: Image.asset(
                                      items[i].image,
                                      height: 30,
                                      width: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  items[i].displayName,
                                  style: const TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
