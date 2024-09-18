import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_trecker/l10n/l10n.dart';
import 'package:task_trecker/storage/models/language.model.dart';

class DialogBuilderWidget extends StatefulWidget {
  final Map previousLanguage;

  const DialogBuilderWidget({super.key, required this.previousLanguage});

  @override
  State<DialogBuilderWidget> createState() => _DialogBuilderWidgetState();
}

class _DialogBuilderWidgetState extends State<DialogBuilderWidget> {
  late Map newLanguage;

  @override
  void initState() {
    newLanguage = widget.previousLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final languageModel = Provider.of<LanguageModel>(context, listen: false);

    return AlertDialog(
      title: const Text('Language'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            for (var fullLocale in fullLocales)
              RadioListTile<LanguagesEnum>(
                  title: Text(fullLocale['nameLang'] as String),
                  value: fullLocale['langRadioKey'] as LanguagesEnum,
                  groupValue: newLanguage['langRadioKey'] as LanguagesEnum,
                  onChanged: (LanguagesEnum? value) {
                    final item = fullLocales
                        .where((el) => el['langRadioKey'] == value)
                        .first;

                    return setState(() => newLanguage = item as Map);
                  }),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      if (newLanguage['locale'] != languageModel.locale) {
                        languageModel.setLocale(newLanguage['locale']);
                      }
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor),
                    child: const Text('Change')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
