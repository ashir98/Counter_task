import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{





  int counter = 0;
  TextEditingController textEditingController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$counter',
                  style: TextStyle(fontSize: 50,),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      TextField(
                        keyboardType: TextInputType.number,
                        
                        decoration: InputDecoration(
                          
                          hintText: "Enter any number",
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          
                        )),
                        controller: textEditingController,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed:() {
                              setState(() {
                               counter = counter - int.parse(textEditingController.text);
                               textEditingController.clear();
                              });
                            },
                            child: const Icon(Icons.minimize),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                               counter = counter + int.parse(textEditingController.text);
                               textEditingController.clear();
                              });
                            },
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    
    
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
    
            FloatingActionButton(
              onPressed: () {
                _decrementCounter();
              },
    
              child: Icon(Icons.minimize),
            ),   
    
            SizedBox(width: 10,),         
            FloatingActionButton(
              onPressed: () {
                _incrementCounter();
              },
    
              child: Icon(Icons.add),
            ),
    
            
    
          
          ],
        )
    
    
        // floatingActionButton: Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: _incrementCounter,
        //       tooltip: 'Increment',
        //       child: const Icon(Icons.add),
        //     ),
        //     SizedBox(
        //       width: 25,
        //     ),
        //     FloatingActionButton(
        //       onPressed: _decrementCounter,
        //       tooltip: 'Increment',
        //       child: const Icon(Icons.minimize_rounded),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
