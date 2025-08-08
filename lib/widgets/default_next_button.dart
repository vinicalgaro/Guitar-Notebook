import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/helpers/helper_bottom_sheet.dart';
import 'package:guitar_notebook/widgets/default_bottom_sheet_header.dart';

import 'default_card_container.dart';

class DefaultNextButton extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final List<Widget>? modalContent;
  final String? route;
  final String? trailing;

  const DefaultNextButton(
      {super.key,
      required this.title,
      required this.leadingIcon,
      this.modalContent,
      this.trailing,
      this.route});

  _nextContent(BuildContext context) {
    route != null
        ? context.goTo(route!)
        : callBottomSheet(
            context,
            heightPercent: 0.33,
            DefaultBottomSheetHeader(
                label: title, children: modalContent ?? []));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultCardContainer(
        margin: const EdgeInsets.only(bottom: 12.0),
        shadow: false,
        child: ListTile(
          leading: leadingIcon,
          title: Text(title),
          onTap: () => _nextContent(context),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing != null) Text(trailing!),
              IconButton(
                onPressed: () => _nextContent(context),
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ));
  }
}
