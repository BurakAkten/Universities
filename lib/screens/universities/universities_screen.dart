import 'package:flutter/material.dart';
import 'package:universities/base/views/base_view.dart';
import 'package:universities/screens/universities/viewmodels/universities_view_model.dart';
import 'package:universities/screens/universities/widgets/university_widget.dart';

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
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: TextField(
                          controller: viewModel.textEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            labelText: "Search University by Country and Name",
                            contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          ),
                          onChanged: viewModel.searchUniversities,
                        ),
                      ),
                      Divider(),
                      ...List.generate(viewModel.count, (index) => UniversityWidget(item: viewModel.getItem(index))),
                    ],
                  ),
                ),
              ),
      );
}
