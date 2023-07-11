import 'package:flutter/material.dart';
import 'package:test_project/Model/MenuProperties.dart';
import 'package:test_project/ViewModel/CustomDashboardMenuViewModel.dart';
import 'package:test_project/ViewModel/menu_helper.dart';
import 'package:test_project/AdditionalViews/widget/ui/CustomDashboardMenu/ViewAllMenuScreen.dart';

class CustomDashboardMenuView extends StatelessWidget {
  final CustomDashboardMenuViewModel viewModel;

  CustomDashboardMenuView({required this.viewModel});

   Widget buildDefaultScreen() {
    final itemCount = viewModel.menuItems.length < 7 ? viewModel.menuItems.length : 7;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Adjust the number of columns as needed
              mainAxisSpacing: 0.0, // Add vertical spacing between items
              crossAxisSpacing: 0.0, // Add horizontal spacing between items
            ),
            shrinkWrap: true,
            itemCount: itemCount + 1,
            itemBuilder: (context, index) {
              if (index == itemCount) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAllMenuScreen(
                          menuItems: viewModel.menuItems,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              40.0, // Adjust the size of the container as needed
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .grey, // Set the background color of the circle
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius:
                                20.0, // Adjust the size of the circle avatar as needed
                            child: Image.asset(
                              'assets/images/nav-bar/categories.png',
                              height: 30.0,
                              width: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 0.0),
                        const Text(
                          'View All',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                final menuItem = viewModel.menuItems[index];
                return GestureDetector(
                  onTap: () {
                    handleOnTap(context,menuItem.onTap, viewModel.menuItems);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                40.0, // Adjust the size of the container as needed
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey, // Set the background color of the circle
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius:
                                  20.0, // Adjust the size of the circle avatar as needed
                              child: Image.asset(
                                menuItem.image,
                                height: 30.0,
                                width: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 0.0),
                          Text(
                            menuItem.displayName,
                            style: const TextStyle(fontSize: 9.5),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildMenuGridA() {
    final itemCount =
        viewModel.menuItems.length < 5 ? viewModel.menuItems.length + 1 : 6;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              mainAxisSpacing: 0.0, // Add vertical spacing between items
              crossAxisSpacing: 0.0, // Add horizontal spacing between items
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (index == 5) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAllMenuScreen(
                          menuItems: viewModel.menuItems,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              40.0, // Adjust the size of the container as needed
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .grey, // Set the background color of the circle
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius:
                                20.0, // Adjust the size of the circle avatar as needed
                            child: Image.asset(
                              'assets/images/nav-bar/categories.png',
                              height: 30.0,
                              width: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'View All',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (index < viewModel.menuItems.length) {
                final menuItem = viewModel.menuItems[index];
                return GestureDetector(
                  onTap: () {
                    handleOnTap(context, menuItem.onTap, viewModel.menuItems);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                40.0, // Adjust the size of the container as needed
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey, // Set the background color of the circle
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius:
                                  20.0, // Adjust the size of the circle avatar as needed
                              child: Image.asset(
                                menuItem.image,
                                height: 30.0,
                                width: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            menuItem.displayName,
                            style: const TextStyle(fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                // Placeholder for empty cells
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildMenuGridB(BuildContext context) {
    List<MenuProperties> filteredItems = viewModel.menuItems.skip(1).toList();

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
          child: GridView.count(
            childAspectRatio: 4.0,
            crossAxisCount: 1,
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  handleOnTap(
                    context,
                    viewModel.menuItems[0].onTap,
                    viewModel.menuItems,
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              40.0, // Adjust the size of the container as needed
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .grey, // Set the background color of the circle
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius:
                                20.0, // Adjust the size of the circle avatar as needed
                            child: Image.asset(
                              viewModel.menuItems[0].image,
                              height: 30.0,
                              width: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 0),
                        Text(
                          viewModel.menuItems[0].displayName,
                          style: const TextStyle(fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
          child: GridView.count(
            childAspectRatio: 0.9,
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    final item = filteredItems[i];
                    handleOnTap(context, item.onTap, viewModel.menuItems);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                40.0, // Adjust the size of the container as needed
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey, // Set the background color of the circle
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius:
                                  20.0, // Adjust the size of the circle avatar as needed
                              child: Image.asset(
                                filteredItems[i].image,
                                height: 30.0,
                                width: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            filteredItems[i].displayName,
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllMenuScreen(
                        menuItems:viewModel.menuItems,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              40.0, // Adjust the size of the container as needed
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .grey, // Set the background color of the circle
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius:
                                20.0, // Adjust the size of the circle avatar as needed
                            child: Image.asset(
                              'assets/images/nav-bar/categories.png',
                              height: 30.0,
                              width: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'View All',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenuGridC(BuildContext context) {
    List<MenuProperties> filteredItems = viewModel.menuItems.skip(2).toList();

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
          child: GridView.count(
            childAspectRatio: 2.1,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < 2; i++)
                GestureDetector(
                  onTap: () {
                    handleOnTap(
                      context,
                      viewModel.menuItems[i].onTap,
                      viewModel.menuItems,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                40.0, // Adjust the size of the container as needed
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey, // Set the background color of the circle
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius:
                                  20.0, // Adjust the size of the circle avatar as needed
                              child: Image.asset(
                                viewModel.menuItems[i].image,
                                height: 30.0,
                                width: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            viewModel.menuItems[i].displayName,
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
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
          child: GridView.count(
            childAspectRatio: 1.0,
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    final item = filteredItems[i];
                    handleOnTap(context, item.onTap, viewModel.menuItems);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height:
                                40.0, // Adjust the size of the container as needed
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .grey, // Set the background color of the circle
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius:
                                  20.0, // Adjust the size of the circle avatar as needed
                              child: Image.asset(
                                filteredItems[i].image,
                                height: 30.0,
                                width: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            filteredItems[i].displayName,
                            style: const TextStyle(fontSize: 9.5),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllMenuScreen(
                        menuItems: viewModel.menuItems,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              40.0, // Adjust the size of the container as needed
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .grey, // Set the background color of the circle
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius:
                                20.0, // Adjust the size of the circle avatar as needed
                            child: Image.asset(
                              'assets/images/nav-bar/categories.png',
                              height: 30.0,
                              width: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 0),
                        const Text(
                          'View All',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenuGridD() {

 
    final itemCount =
        viewModel.menuItems.length < 11 ? viewModel.menuItems.length : 11;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
            child: GridView.builder(
              padding: const EdgeInsets.all(0.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Adjust the number of columns as needed
                childAspectRatio: 1.15,
              ),
              shrinkWrap: true,
              itemCount: itemCount + 1,
              itemBuilder: (context, index) {
                if (index == itemCount) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllMenuScreen(
                              menuItems: viewModel.menuItems,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height:
                                  40.0, // Adjust the size of the container as needed
                              width: 40.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .grey, // Set the background color of the circle
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius:
                                    20.0, // Adjust the size of the circle avatar as needed
                                child: Image.asset(
                                  'assets/images/nav-bar/categories.png',
                                  height: 30.0,
                                  width: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 0),
                            const Text(
                              'View All',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ));
                } else {
                  final menuItem = viewModel.menuItems[index];
                  return GestureDetector(
                    onTap: () {
                      handleOnTap(context, menuItem.onTap,viewModel.menuItems);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height:
                                  40.0, // Adjust the size of the container as needed
                              width: 40.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .grey, // Set the background color of the circle
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius:
                                    20.0, // Adjust the size of the circle avatar as needed
                                child: Image.asset(
                                  menuItem.image,
                                  height: 30.0,
                                  width: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              menuItem.displayName,
                              style: const TextStyle(fontSize: 9.4),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget selectedScreen;
    if (viewModel.selectedOption == 'A') {
      selectedScreen = buildMenuGridA();
    } else if (viewModel.selectedOption == 'B') {
      selectedScreen = buildMenuGridB(context);
    } else if (viewModel.selectedOption == 'C') {
      selectedScreen = buildMenuGridC(context);
    } else if (viewModel.selectedOption == 'D') {
      selectedScreen = buildMenuGridD();
    } else {
      selectedScreen = buildDefaultScreen();
    }

    return Scaffold(
      body: selectedScreen,
    );
  }
}



