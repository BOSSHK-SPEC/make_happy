class ElderlySellerProfile {
  final String name;
  final String location;
  final String description;
  final List<String> itemImages;

  ElderlySellerProfile({
    required this.name,
    required this.location,
    required this.description,
    required this.itemImages,
  });
}
final List<ElderlySellerProfile> elderlySellerProfiles = [
  ElderlySellerProfile(
    name: 'John Doe',
    location: 'New York',
    description: 'I sell handmade crafts and accessories.',
    itemImages: [
      'https://example.com/item1.jpg',
      'https://example.com/item2.jpg',
      'https://example.com/item3.jpg',
    ],
  ),
  // Add more profiles here
];