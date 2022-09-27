import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'model.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Demo for Brain Rehab'),
        ),
        body: TestForm(),
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
 bool _termsChecked = false;
 List<String> typeNeg = [
"Male",
"Female"];

String dropdownValue = "Male";
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
        
    

              ],
            ),
          ),

              Container(
                  alignment: Alignment.topCenter,
                width: halfMediaWidth,


           child:MyTextFormField(
               hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
           
          
     
            onSaved: (String value) {
              model.firstName = value;
            },
          ),
               ),
                   Container(
                alignment: Alignment.topCenter,
                width: halfMediaWidth,


                child: DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                validator: (val) {
                  print(val);
                  return null;
                },
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
            
                ),
              
                 Container(
                  alignment: Alignment.topCenter,
                width: halfMediaWidth,


           child:DropdownButtonFormField<String>(
                    value: dropdownValue,
                    hint: Text("Male/Female"),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                        validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Gender';
                      }
                      return null;
                    },
           
                    items: typeNeg
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
            onSaved: (String value) {
              model.password = value;
            },                  ),
               ),
  Container(
                  alignment: Alignment.topCenter,
                width: halfMediaWidth,


           child:TextFormField(
                 keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Description'),
                onFieldSubmitted: (value) {
                  //Validator
                },
                      validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the description';
                      }
                      return null;
                    },
           
          
     
            onSaved: (String value) {
              model.email = value;
            },
          ),
               ),


      Container(
                  alignment: Alignment.topLeft,
                width: halfMediaWidth,

          child:CheckboxListTile(
               title: Text('I agree to Terms & Conditions'),
                value: _termsChecked,
                onChanged: (bool value) =>
                    setState(() => _termsChecked = value),
                subtitle: !_termsChecked
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                        child: Text(
                          'Required field',
                          style:
                              TextStyle(color: Color(0xFFe53935), fontSize: 12),
                        ),
                      )
                    : null,
        
       
          ), ),
          ElevatedButton(
       
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(model: this.model)));
              }
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}