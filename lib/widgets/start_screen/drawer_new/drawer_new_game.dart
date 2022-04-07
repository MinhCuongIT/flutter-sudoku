import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './start_btn.dart';
import '../../../data/constants.dart';
import '../../settings_group.dart';

class DrawerNew extends StatelessWidget {
  const DrawerNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          height: constraints.maxHeight,
          child: CustomScrollView(
            shrinkWrap: true,
            primary: false,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    //Type
                    SettingsGroup(
                      title: AppLocalizations.of(context)!.type,
                      data: Constants.types,
                      option: Constants.type,
                      titleAlignment: Alignment.centerLeft,
                      textAlignment: Alignment.centerLeft,
                    ),

                    //Difficulty
                    SettingsGroup(
                      title: AppLocalizations.of(context)!.difficulty,
                      data: Constants.difficulties,
                      option: Constants.difficulty,
                      titleAlignment: Alignment.centerLeft,
                      textAlignment: Alignment.centerLeft,
                    ),

                    //Spacer push button down
                    const Spacer(),

                    //Start button
                    StartBtn(height: constraints.maxHeight * 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
