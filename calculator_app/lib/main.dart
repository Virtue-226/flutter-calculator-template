import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new  MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
} 

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String output = "0";

String _output = "0";
double num1 = 0.0;
double num2 = 0.0;
String operand ="";

buttonPressed(String buttonText){
  if (buttonText == "CLEAR"){
 _output = "0";
 num1 = 0.0;
 num2 = 0.0;
 operand ="";

  }else if (buttonText == "+" || buttonText == "-" || buttonText == "/"|| buttonText == "*"){
   num1 = double.parse(_output);
   operand = buttonText;
   _output = "0";
  } else if (buttonText == "."){
    if (_output.contains(".")){
       return
      print("Already contain a decimal");
      

    } else {
      _output = _output + buttonText;
    }
    } 
    else if  (buttonText == "="){
        num2 = double.parse(output);
        if(operand == "+"){
          _output = (num1 + num2).toString();
        }
         if(operand == "-"){
          _output = (num1 - num2).toString();
        }
         if(operand == "*"){
          _output = (num1 * num2).toString();
        }
         if(operand == "/"){
          _output = (num1 / num2).toString();
        }
        num1 = 0.0;
        num2 = 0.0;
        operand= "";

    } else {
      _output = _output + buttonText;

    }
      print(_output);
      setState(() {
        output =double.parse(_output).toStringAsFixed(2);
      });
  }




 Widget buildButton(String bottonText) {
   return  new Expanded(
              child: new OutlineButton(
                padding: EdgeInsets.all(24.0),
               child : new Text(bottonText,
               style: TextStyle(
                 fontSize: 20.0,fontWeight: FontWeight.bold),
                 ),
               onPressed:() => 
                 buttonPressed(bottonText)
               
              //  color : Colors.blueGrey,
              //  textColor :Colors.white,
                 ),
           );
            
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:  new Text(widget.title),
      ),
      body: new Container(

    child :   new Column(
      children:  <Widget>[
       Container(
         alignment: Alignment.centerRight,
         padding: EdgeInsets.symmetric(
           vertical : 24,
           horizontal: 12,
         ),
         
         child: new  Text(output,style:TextStyle(
           fontSize: 48.0,
           fontWeight: FontWeight.bold,
         ))),
       
    

       new Expanded(
         child: new Divider(),
         ),//expanded

     Column(
       children: [
        
         new  Row( children : [
            buildButton("7"),
             buildButton("8"),
              buildButton("9"),
               buildButton("/")
         ] ),
         new  Row( children : [
            buildButton("4"),
             buildButton("5"),
              buildButton("6"),
               buildButton("*")
              
         ] ),
         new  Row( children : [
            buildButton("1"),
             buildButton("2"),
              buildButton("3"),
               buildButton("-")
         ] ),
         new  Row( children : [
            buildButton("."),
             buildButton("0"),
              buildButton("00"),
               buildButton("+")

         ] ),
         new  Row( children : [
            buildButton("CLEAR"),
             buildButton("="),
             
         ])
       ])

      ],


        ))); 
    
  }
}
