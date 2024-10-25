import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_pill.dart';

class SectionListTileWidget extends StatelessWidget {
  final String title;
  final String? content;
  final String? subTitle;
  final String? subtitleContent;
  final String? subTitleTrailing;
  final List<String>? contentList;
  final List<String>? pillSections;
  const SectionListTileWidget({
    super.key,
    required this.title,
    this.content,
    this.subTitle,
    this.contentList,
    this.subTitleTrailing,
    this.subtitleContent,
    this.pillSections
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subTitle != null && subTitle!.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      subTitle!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    if(subtitleContent != null) Text(
                      subtitleContent!,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      ),
                    ),
                  ],
                ),
                if (subTitleTrailing != null) Text(subTitleTrailing!),

              ],
            ),
          if(pillSections != null) Wrap(
          spacing: 10,
          children: [
            ...pillSections!.map((pill) => CustomPill(label: pill,))
          ],
          ) ,
          if (contentList == null && content != null) Text(content!),
          if (contentList != null)
            ...contentList!.map(
              (val) => Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 5,
                    color: Colors.black45,
                  ),
                  const SizedBox(width: 5),
                  Expanded(child: Text(val))
                ],
              ),
            )
        ],
      ),
    );
  }

}




class PillList{
  String label;
  List<String> pills;

  PillList({required this.label, required this.pills});

  factory PillList.fromJson(Map<String, dynamic> json){
    return PillList(
      label: json['label'],
      pills: json['pill_list'],
    );
  }
  
  final json = """
  
  {
  "label": Blandas,
  "pills": ["Docker", React]
  
  }
  
  """;
}