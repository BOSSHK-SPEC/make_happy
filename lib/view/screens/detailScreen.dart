import 'package:flutter/material.dart';

import '../../model/profileModel.dart';

class DetailedProfileScreen extends StatefulWidget {
  final ElderlySellerProfile profile;

  const DetailedProfileScreen({required this.profile});

  @override
  _DetailedProfileScreenState createState() => _DetailedProfileScreenState();
}
class _DetailedProfileScreenState extends State<DetailedProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${widget.profile.name}'),
            Text('Location: ${widget.profile.location}'),
            Text('Description: ${widget.profile.description}'),
            SizedBox(height: 16.0),
            Text(
              'Items for Sale:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: widget.profile.itemImages.map((image) {
                return Image.network(image);
              }).toList(),
            ),
            SizedBox(height: 16.0),
            // Add buttons or contact information here
          ],
        ),
      ),
    );
  }
}
