import 'package:flutter/material.dart';
import 'package:test_project/ViewModel/MenuSettingViewModel.dart';
import 'package:test_project/ViewModel/menu_helper.dart';

const List<String> list = <String>['Default', 'A', 'B', 'C', 'D'];

class DesignDropdownList extends StatelessWidget {

  const DesignDropdownList({super.key, required this.viewModel});
  final MenuSettingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getSavedOption(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final savedOption = snapshot.data ?? list.first;

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(0.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: savedOption,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              elevation: 16,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: viewModel.handleOptionSelection,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
