import 'package:flutter/material.dart';

class AppBarBottom<T extends TabBar> extends StatelessWidget {
  final List<Map> listTabs = [];
  AppBarBottom({
    required listTabs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: <Widget>[
        for(var listTab in listTabs)
          Tab(
            icon: listTab['icon'] ? Icon(listTab['icon']) : const Icon(Icons.account_balance),
            text: listTab['title'] ?? 'No Title',
          )
      ],
    );
  }
}
