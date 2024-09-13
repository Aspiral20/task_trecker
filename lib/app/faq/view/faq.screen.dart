import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:task_trecker/layouts/app_drawer/app_drawer.dart';

@RoutePage()
class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faq'),
      ),
      drawer: const AppDrawer(),
      body: Container(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('Faq1'),
              subtitle: Text('Subtitle', style: theme.textTheme.bodySmall),
              children: const [
                ListTile(title: Text('Faq1 Example 1')),
                ListTile(title: Text('Faq1 Example 2'))
              ],
            ),
            const ExpansionTile(
              title: Text('Faq2'),
              children: const [
                ListTile(title: Text('Faq2 Example 1')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
