import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/storage/models/theme.model.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeModel = Provider.of<ThemeModel>(context);

    return Container(
        padding: EdgeInsets.only(left: 16, top: 10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: TextStyle(
                      fontSize: theme.textTheme.bodySmall?.fontSize,
                      color: themeModel.isDark
                          ? Colors.grey
                          : Colors.grey.shade600)),
            ),
            Divider()
          ],
        ));
  }
}
