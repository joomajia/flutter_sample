// ignore_for_file: file_names

import 'package:faker/faker.dart' show Faker;
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFDEE9F9),
        textTheme: const TextTheme(
            displaySmall: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => const NewWidgetLay(),
      },
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  const CustomAppBar({
    super.key,
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.red,
        ),
        child: child);
  }
}

class AppBars extends AppBar {
  AppBars({super.key})
      : super(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "this is app bar",
            style: TextStyle(color: Color(0xFFDEE9F9)),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        );
}
// class MyTitle extends StatelessWidget {
//   const MyTitle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Title(color: Colors.black,
//     child: const Text("AAAAAAAA"),);
//   }
// }

class NewWidgetLay extends StatefulWidget {
  const NewWidgetLay({super.key});

  @override
  State<NewWidgetLay> createState() => _NewWidgetLayState();
}

class _NewWidgetLayState extends State<NewWidgetLay> {
  double _textSize = 16.0; // Начальный размер текста
  String _displayText = 'Пример текста'; // Начальный текст

  void _increaseTextSize() {
    setState(() {
      _textSize += 2.0; // Увеличиваем размер текста на 2.0 пункта
    });
  }

  void _decreaseTextSize() {
    setState(() {
      _textSize -= 2.0; // Уменьшаем размер текста на 2.0 пункта
    });
  }

  void _resetTextSize() {
    setState(() {
      _textSize = 16.0; // Сбрасываем размер текста до начального значения
    });
  }

  void _generateRandomText() {
    final faker = Faker();
    setState(() {
      _displayText = faker.lorem.sentence(); // Генерируем случайный текст
    });
  }

  void _nullText() {
    setState(() {
      _displayText = ""; // Генерируем случайный текст
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(
            milliseconds: 400), // Длительность отображения подсказки
      ),
    );
  }

  final ScrollController _mycontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: 200,
        child: Column(
          children: [
            FlutterLogo(size: 56),
            SizedBox(
              height: 100,
              width: 100,
              child: Row(
                children: [
                  Icon(Icons.abc_sharp),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.abc_sharp),
                  Icon(Icons.abc_sharp),
                ],
              ),
            ),
            
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 100,
              child: ListView(
                children: <Widget>[
                  SingleChildScrollView(
                    controller: _mycontroller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        Text(
                          _displayText,
                          style: TextStyle(
                              fontSize: _textSize, color: Colors.amber),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _decreaseTextSize();
                            _showSnackBar(context, 'Текст уменьшен');
                          },
                          child: const Text('Уменьшить текст'),
                        ),
                        const SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            _resetTextSize();
                            _showSnackBar(context, 'Размер сброшен');
                          },
                          child: const Text('Сбросить размер'),
                        ),
                        const SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            _increaseTextSize();
                            _showSnackBar(context, 'Текст увеличен');
                          },
                          child: const Text('Увеличить текст'),
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            _generateRandomText();
                            _showSnackBar(
                                context, 'Сгенерирован случайный текст');
                          },
                          child: const Text('Случайный текст'),
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            _nullText();
                            _showSnackBar(context, 'Текст сброшен');
                          },
                          child: const Text('Сбросить текст'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                  ),
                ],
              )),
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
            child: Text(
              _displayText,
              style: TextStyle(fontSize: _textSize, color: Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}

// class CustomTextField extends StatelessWidget {

//   const CustomTextField({ Key? key, this.onChanged, required this.hint}) : super(key: key)

//   final Function onChanged;
//   final String hint;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: TextField(
//         // onChanged Function is used here.
//         onChanged: onChanged,
//         style: TextStyle(fontSize: 18),
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 20),
//             filled: true,
//             fillColor: Colors.black12,
//             border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(18)),

//             // hint String is used here.
//             hintText: hint,
//             helperText: 'Keep it Short'),
//       ),
//     );
//   }
// }

//This is a Custom Button Widget.
// class CustomButton extends StatelessWidget {
// // In the Constructor onTap and Symbol fields are added.
//   const CustomButton({Key? key, required this.onTap, required this.symbol}) : super(key: key);

// // It Requires 2 fields Symbol(to be displayed)
// // and onTap Function
//   final String symbol;
//   final Function onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // The onTap Field is used here.
//       onTap: onTap,
//       child: Container(
//         height: 60,
//         width: 60,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blueGrey,
//         ),
//         child: Center(
//           child: Text(
//             // The Symbol is used here
//             symbol,
//             style: TextStyle(
//               fontSize: 35,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late double n1, n2, op = 0; // 1st Number, 2nd Number and Output.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GeeksforGeeks'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(18),
//         child: Column(
//           children: [
//             Text(
//               'Simple Calculator',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 CustomTextField(
//                     hint: '1st Number',
//                     onChanged: (s) {
//                       n1 = double.parse(s);
//                       print(n1);
//                     }),
//                 SizedBox(width: 10),
//                 CustomTextField(
//                     hint: '2nd Number',
//                     onChanged: (s) {
//                       n2 = double.parse(s);
//                       print(n2);
//                     })
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomButton(
//                     symbol: '+',
//                     onTap: () {
//                       setState(() {
//                         op = (n1 + n2);
//                       });
//                     }),
//                 CustomButton(
//                     symbol: '-',
//                     onTap: () {
//                       setState(() {
//                         op = (n1 - n2);
//                       });
//                     }),
//                 CustomButton(
//                     symbol: '×',
//                     onTap: () {
//                       setState(() {
//                         op = (n1 * n2);
//                       });
//                     }),
//                 CustomButton(
//                     symbol: '÷',
//                     onTap: () {
//                       setState(() {
//                         if (n2 == 0)
//                           op = -1;
//                         else
//                           op = (n1 / n2).toDouble();
//                       });
//                     }),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Output',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 5),
//             Container(
//               padding: EdgeInsets.all(10),
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.black12,
//                   borderRadius: BorderRadius.circular(18)),
//               child: Center(
//                 child: Text(
//                   op.toStringAsFixed(2),
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
