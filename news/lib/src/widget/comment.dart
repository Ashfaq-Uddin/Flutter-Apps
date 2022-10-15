import 'package:flutter/material.dart';
import 'package:news/src/widget/loading_container.dart';
import 'loading_container.dart';
import 'dart:async';
import '../models/item_model.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>>? itemMap;
  final int depth;

  Comment({required this.itemId, required this.itemMap, required this.depth});

  Widget build(context) {
    return FutureBuilder(
        future: itemMap![itemId],
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (!snapshot.hasData) {
            return LoadingContainer();
          }

          final item = snapshot.data;

          final childen = <Widget>[
            ListTile(
              title: buildText(item),
              subtitle: item!.by == '' ? Text('Deleted') : Text(item.by),
              contentPadding: EdgeInsets.only(
                right: 16.0,
                left: (depth + 1) * 16.0,
              ),
            ),
            Divider(),
          ];
          snapshot.data!.kids.forEach(
            (kidId) {
              childen.add(
                Comment(itemId: kidId, itemMap: itemMap, depth: depth + 1),
              );
            },
          );

          return Column(
            children: childen,
          );
        });
  }

  Widget buildText(ItemModel? item) {
    final text = item!.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '')
        .replaceAll('<a href="', '')
        .replaceAll('&#x2F;', '/')
        .replaceAll('</a>', '');

    return Text(text);
  }
}
