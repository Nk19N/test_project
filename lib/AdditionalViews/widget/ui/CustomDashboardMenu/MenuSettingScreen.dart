import 'package:flutter/material.dart';
import 'package:test_project/AdditionalViews/widget/ui/CustomDashboardMenu/DesignDropdownList.dart';
import 'package:test_project/Entry%20Point/main.dart';
import 'package:test_project/ViewModel/MenuSettingViewModel.dart';

class MenuSettingScreen extends StatelessWidget {

 MenuSettingScreen({super.key, required this.viewModel});
     MenuSettingViewModel viewModel;


  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Select Design',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DesignDropdownList(viewModel: viewModel),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Reorder Priority for Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                controller: _firstController,
                trackVisibility: true,
                child: ReorderableListView.builder(
                  shrinkWrap: true,
                  scrollController: _firstController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: viewModel.menuItems?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ReorderableDragStartListener(
                      index: index,
                      key: Key('$index'),
                      child: ListTile(
                        key: ValueKey('$index'),
                        leading: Image.asset(
                          viewModel.menuItems![index].image,
                          height: 40,
                          width: 40,
                          color: Colors.black,
                        ),
                        title: Text(
                          viewModel.menuItems![index].displayName,
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: const Icon(Icons.drag_handle),
                      ),
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    viewModel.reorderMenuItems(oldIndex, newIndex);
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  viewModel.saveModifiedMenuProperties();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
