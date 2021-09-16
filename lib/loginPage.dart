import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter2homework4/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool hato = false;
  GlobalKey _keyUsername = GlobalKey<FormFieldState>();
  GlobalKey _keyEmail = GlobalKey<FormFieldState>();
  GlobalKey _keyPassword = GlobalKey<FormFieldState>();
  String? userName;
  String? userEmail;
  String? userPassword;
  List<Step> steplarimiz = [];
  StepperType stepperType = StepperType.horizontal;
  int currentStep = 0;
  bool complete = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stepper Example",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              currentStep: currentStep,
              steps: steps(),
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: (step) => goTo(step),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.apps_rounded),
        onPressed: switchStepType,
      ),
    );
  }

  List<Step> steps() {
    return [
      Step(
        title: const Text('New Account'),
        isActive: true,
        state: StepState.indexed,
        content: Column(
          children: <Widget>[
            TextFormField(
              key: _keyUsername,
              decoration: InputDecoration(
                hintText: "username",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              validator: (password){
                if(password!.length < 4){
                  return "Kamida 4 ta belgi kiriting";
                }
              },
              onSaved: (e){
                setState(() {
                  userName = e;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              key: _keyEmail,
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              validator: (password){
                if(password!.length < 5){
                  return "Kamida 5 ta belgi kiriting";
                }
              },
              onSaved: (e){
                setState(() {
                  userEmail = e;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              key: _keyPassword,
              decoration: InputDecoration(
                hintText: "password",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              validator: (password){
                if(password!.length < 5){
                  return "Kamida 5 ta belgi kiriting";
                }
              },
              onSaved: (e){
                setState(() {
                  userPassword = e;
                });
              },
            ),
          ],
        ),
      ),
      Step(
        isActive: true,
        state: StepState.indexed,
        title: const Text('Address'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Home Address",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "postcode",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: true,
        state: StepState.indexed,
        title: const Text('number'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "phone number",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text("Go to MainPage"),
            ),
          ],
        ),
      ),
    ];
  }

  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
    if (currentStep == 3) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  next() {
    currentStep + 1 != steps().length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }
}
