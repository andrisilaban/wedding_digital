// widgets/gift_registry.dart
import 'package:flutter/material.dart';

class GiftRegistryScreen extends StatelessWidget {
  const GiftRegistryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Registry'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const RegistryHeader(),
          const SizedBox(height: 24),
          ...registryStores.map((store) => RegistryStoreCard(store: store)),
        ],
      ),
    );
  }
}

class RegistryStore {
  final String name;
  final String logo;
  final String url;

  const RegistryStore({
    required this.name,
    required this.logo,
    required this.url,
  });
}

final registryStores = [
  const RegistryStore(
    name: 'Amazon',
    logo: 'assets/images/amazon_logo.png',
    url: 'https://amazon.com/registry/...',
  ),
  const RegistryStore(
    name: 'Target',
    logo: 'assets/images/target_logo.png',
    url: 'https://target.com/registry/...',
  ),
  // Add more stores as needed
];

class RegistryHeader extends StatelessWidget {
  const RegistryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Gift Registry',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Your presence at our wedding is the greatest gift of all. However, if you wish to honor us with a gift, we have registered at the following stores:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class RegistryStoreCard extends StatelessWidget {
  final RegistryStore store;

  const RegistryStoreCard({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Image.asset(
          store.logo,
          width: 40,
          height: 40,
        ),
        title: Text(store.name),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => _launchURL(store.url),
      ),
    );
  }

  void _launchURL(String url) async {
    // Implement URL launching using url_launcher package
  }
}
