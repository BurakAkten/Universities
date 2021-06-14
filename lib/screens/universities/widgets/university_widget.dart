import 'package:flutter/material.dart';
import 'package:universities/models/dao/university_dao.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversityWidget extends StatelessWidget {
  final UniversityDao item;

  const UniversityWidget({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 100,
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () async {
            var webpPage = item.webPages.isNotEmpty ? item.webPages.first : "";
            if ((await canLaunch(webpPage))) await launch(webpPage);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 24),
              Icon(Icons.school, size: 56),
              SizedBox(width: 24),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "University: ",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "${item.name}",
                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Country: ",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "${item.country} - ${item.alphaTwoCode}",
                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.chevron_right_rounded, size: 36),
              SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}
