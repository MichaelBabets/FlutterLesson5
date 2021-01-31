import 'package:Lesson5/form_validation.dart';
import 'package:Lesson5/indexed_list.dart';
import 'package:Lesson5/infinite_list.dart';
import 'package:Lesson5/simple_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }

}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson 5')),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              child: Text('Simple list'),
                onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return SimpleList();
              }));
            }),
            SizedBox(height: 10,),
            MaterialButton(
                child: Text('Infinite list'),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return InfiniteList();
                  }));
                }),
            SizedBox(height: 10,),
            MaterialButton(
                child: Text('Indexed list'),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return IndexedList();
                  }));
                }),
            SizedBox(height: 10,),
            MaterialButton(
                child: Text('Form Validation'),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return FormValidation();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}

