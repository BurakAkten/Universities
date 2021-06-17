import 'package:flutter/material.dart';
import 'package:universities/base/views/base_view.dart';
import 'package:universities/screens/universities/universities_service.dart';
import 'package:universities/screens/universities/viewmodels/universities_view_model.dart';
import 'package:universities/screens/universities/widgets/university_widget.dart';

class UniversitiesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BaseView<UniversitiesViewModel>(
      vmBuilder: (context) => UniversitiesViewModel(service: UniversitiesService()),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, UniversitiesViewModel viewModel) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Universities")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: viewModel.errorMessage != null
                ? Center(child: Expanded(child: Text("${viewModel.errorMessage}")))
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: TextField(
                          controller: viewModel.textEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                            labelText: "Search University by Name",
                            contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          ),
                          onChanged: viewModel.searchUniversities,
                        ),
                      ),
                      Divider(),
                      ...List.generate(
                        viewModel.count,
                        (index) => UniversityWidget(
                          item: viewModel.getItem(index),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
}
