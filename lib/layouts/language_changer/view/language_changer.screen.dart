import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/l10n/l10n.dart';
import 'package:task_trecker/storage/models/language.model.dart';
import '../dialog_builder/dialog_builder.dart';

class LanguageChangerScreen extends StatefulWidget {
  const LanguageChangerScreen({super.key});

  @override
  State<LanguageChangerScreen> createState() => _LanguageChangerScreenState();
}

class _LanguageChangerScreenState extends State<LanguageChangerScreen> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Language'),
      onTap: () {
        _dialogBuilder(context);
      },
      trailing: const Icon(LineAwesomeIcons.language_solid),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final languageModel = Provider.of<LanguageModel>(context, listen: false);
    Map previousLanguage = fullLocales.firstWhere((el) => el['locale'] == languageModel.locale);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DialogBuilderWidget(
          previousLanguage: previousLanguage,
        );
      },
    );
  }
}
