import 'package:flutter/material.dart';
import 'package:plus_and_minus/plus_minus.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => PlusMinus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plus and Minus'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<PlusMinus>(
                  builder: (context, plusMinus, child) => Text(
                    '${plusMinus.counter}',
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<PlusMinus>(
                      builder: (context, plusMinus, child) => GestureDetector(
                        onTap: () {
                          plusMinus.isMinusEnabled ? plusMinus.minus() : null;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: plusMinus.isMinusEnabled
                                  ? Colors.green
                                  : Colors.grey),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('And'),
                    const SizedBox(width: 10),
                    Consumer<PlusMinus>(
                      builder: (context, plusMinus, child) => GestureDetector(
                        onTap: () {
                          plusMinus.isPlusEnabled ? plusMinus.plus() : null;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: plusMinus.isPlusEnabled
                                  ? Colors.green
                                  : Colors.grey),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
