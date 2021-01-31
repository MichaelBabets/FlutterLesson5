import 'package:flutter/material.dart';

class IndexedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Indexed List'),),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: ListView.builder(itemBuilder: (context, i){
        print('num $i : нечетный = ${i.isOdd}');

        if(i.isOdd) return Divider();

        final int index = i ~/ 2;

        print('index $index');
        print('length ${_array.length}');

        if (index >= _array.length) _array.addAll(['$index', '${index + 1}', '${index + 2}']);

        return  ListTile(title: Text(_array[index]));
      }),
    );
  }
}