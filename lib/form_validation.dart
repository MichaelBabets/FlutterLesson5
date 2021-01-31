import 'package:flutter/material.dart';

enum GenderList { male, female }

class FormValidation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormValidationState();
}

class FormValidationState extends State {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GenderList _gender;
  bool _agreement = false;

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Form Validation')),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child:  Form(
                key: _formKey,
                child:  Column(
                  children: <Widget>[
                     Text(
                      'Имя пользователя:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                     TextFormField(validator: (value) {
                      if (value.isEmpty) {
                        return 'Пожалуйста, введите свое имя';
                      }
                      return null;
                    }),
                     SizedBox(height: 20.0),
                     Text(
                      'Контактный E-mail:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                     TextFormField(validator: (value) {
                      if (value.isEmpty) return 'Пожалуйста введите свой Email';

                      String p =
                          "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                      RegExp regExp =  RegExp(p);

                      if (regExp.hasMatch(value)) return null;

                      return 'Это не E-mail';
                    }),
                     SizedBox(height: 20.0),
                     Text(
                      'Ваш пол:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                     RadioListTile(
                      title: const Text('Мужской'),
                      value: GenderList.male,
                      groupValue: _gender,
                      onChanged: (GenderList value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                     RadioListTile(
                      title: const Text('Женский'),
                      value: GenderList.female,
                      groupValue: _gender,
                      onChanged: (GenderList value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                     SizedBox(height: 20.0),
                     CheckboxListTile(
                        value: _agreement,
                        title:  Text('Я ознакомлен' +
                            (_gender == null
                                ? '(а)'
                                : _gender == GenderList.male
                                    ? ''
                                    : 'а') +
                            ' с документом "Согласие на обработку персональных данных" и даю согласие на обработку моих персональных данных в соответствии с требованиями "Федерального закона О персональных данных № 152-ФЗ".'),
                        onChanged: (bool value) => setState(() => _agreement = value)),
                     SizedBox(height: 20.0),
                     RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Color color = Colors.red;
                          String text;

                          if (_gender == null)
                            text = 'Выберите свой пол';
                          else if (_agreement == false)
                            text = 'Необходимо принять условия соглашения';
                          else {
                            text = 'Форма успешно заполнена';
                            color = Colors.green;
                          }

                          _scaffoldKey.currentState.hideCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(text),
                            backgroundColor: color,
                          ));
                        }
                      },
                      child: Text('Проверить'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ))),
      ),
    );
  }
}
