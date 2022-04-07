import 'package:flutter/material.dart';

import '../../../data/constants.dart';
import './settings_option.dart';

class SettingsGroup extends StatelessWidget {
  final String title;
  final List<Map<String, Object>> data;
  final String option;
  final AlignmentGeometry titleAlignment;
  final AlignmentGeometry textAlignment;

  const SettingsGroup({
    Key? key,
    required this.title,
    required this.data,
    required this.option,
    required this.titleAlignment,
    required this.textAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: Axis.vertical,
      children: [
        //Title
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 16, left: 20, bottom: 10),
          child: Align(
            alignment: titleAlignment,
            child: Text(title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText2),
          ),
        ),

        //List
        Flex(
          direction: Axis.vertical,
          children: data.asMap().entries.map(
            (data) {
              return SettingsOption(
                data: data,
                icon: data.value[Constants.icon] as Widget,
                index: data.key,
                option: option,
                alignment: textAlignment,
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
