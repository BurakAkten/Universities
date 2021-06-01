import 'package:flutter/material.dart';
import 'package:universities/base/views/base_view.dart';
import 'package:universities/screens/universities/viewmodels/universities_view_model.dart';

class UniversitiesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<UniversitiesViewModel>(
      vmBuilder: (context) => UniversitiesViewModel(),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, UniversitiesViewModel viewModel) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Universities")),
        body: viewModel.isLoading
            ? Container(child: Center(child: CircularProgressIndicator()))
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var item = viewModel.getItem(index);
                        return Text(item.name);
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: viewModel.count),
                ),
              ),
      );
}
