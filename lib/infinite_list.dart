import 'package:flutter/material.dart';

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Infinite list')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text('Row $index');
          },
        )// ListV
    );
  }
}
