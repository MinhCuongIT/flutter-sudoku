import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/constants.dart';
import '../../settings_group.dart';
import './id_text_form.dart';
import './search_btn.dart';

class SearchIdForm extends ConsumerStatefulWidget {
  const SearchIdForm({Key? key}) : super(key: key);

  @override
  _SearchIdFormState createState() => _SearchIdFormState();
}

class _SearchIdFormState extends ConsumerState<SearchIdForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Flex(
          direction: Axis.vertical,
          children: [
            //Type list
            SettingsGroup(
              title: AppLocalizations.of(context)!.chooseType.toUpperCase(),
              data: Constants.types,
              option: Constants.type,
              titleAlignment: Alignment.center,
              textAlignment: Alignment.centerRight,
            ),

            //Id field
            const IdTextForm(),

            //Search button
            SearchBtn(formKey: _formKey),
          ],
        ),
      ),
    );
  }
}
