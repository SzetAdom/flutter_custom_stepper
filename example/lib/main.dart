import 'package:custom_stepper/custom_stepper.dart';
import 'package:custom_stepper/custom_stepper_step.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CustomStepper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _stepperIndex = 0;

  String? data1;
  String? data2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: CustomStepper(
              steps: [
                CustomStepperStep(
                  title: const Text('Step 1'),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        data1 = value;
                      });
                    },
                  ),
                  activeIcon: const Icon(
                    Icons.edit,
                    color: Colors.yellow,
                  ),
                  activeSubTitle: const Text('Give me data 1'),
                  subTitle: data1 != null
                      ? const Text('Good data')
                      : const Text('Wrong data'),
                  icon: data1 != null
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(Icons.close, color: Colors.red),
                ),
                CustomStepperStep(
                  title: const Text('Step 2'),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        data2 = value;
                      });
                    },
                  ),
                  activeIcon: const Icon(
                    Icons.edit,
                    color: Colors.yellow,
                  ),
                  activeTitle: const Text('Give me data 2'),
                  subTitle: data2 != null
                      ? const Text('Good data')
                      : const Text('Wrong data'),
                  icon: data2 != null
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(Icons.close, color: Colors.red),
                ),
                CustomStepperStep(
                  title: const Text('Step 3'),
                  activeSubTitle: const Text('Checking data'),
                  child: Column(
                    children: [
                      Text('Data 1: $data1'),
                      Text('Data 2: $data2'),
                      if (data1 != null && data2 != null)
                        const Text('All data is correct')
                      else
                        const Text('Some data is wrong')
                    ],
                  ),
                ),
              ],
              activeIndex: _stepperIndex,
              onStepTapped: (index) {
                setState(() {
                  _stepperIndex = index;
                });
              },
            )),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
