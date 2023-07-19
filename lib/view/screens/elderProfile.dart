import 'package:flutter/material.dart';

import '../../model/profileModel.dart';
import 'detailScreen.dart';

class ElderlySellerProfilesScreen extends StatefulWidget {
  @override
  _ElderlySellerProfilesScreenState createState() =>
      _ElderlySellerProfilesScreenState();
}
class _ElderlySellerProfilesScreenState
    extends State<ElderlySellerProfilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elderly Seller Profiles'),
      ),
      body: ListView.builder(
        itemCount: elderlySellerProfiles.length,
        itemBuilder: (context, index) {
          final profile = elderlySellerProfiles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedProfileScreen(profile: profile),
                ),
              );
            },
            child: ListTile(
              title: Text(profile.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: ${profile.location}'),
                  Text('Description: ${profile.description}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

