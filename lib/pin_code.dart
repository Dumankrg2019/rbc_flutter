import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_bank.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_svg/svg.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PinCodeScreen(),
    );
  }
}

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String pin = '';

  void onNumberPress(String number) {
    if (pin.length < 4) {
      setState(() {
        pin += number;
      });
    }
    if(pin.length == 4){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyBankHomeScreen()),
      );
    }
  }

  void onDeletePress() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  Widget buildNumberButton(String number) {
    return SizedBox(
      width: 70,
      height: 70,
        child:  ElevatedButton(
        onPressed: () => onNumberPress(number),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          backgroundColor: Color(0xFFE6E6FF)
        ),
        child: Text(
          number,
          style: TextStyle(fontSize: 32, color: Colors.black),
        ),
      ),
    );
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 320,
              child: Text(
              "Придумайте пинкод для быстрого доступа в приложение",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
                  (index) => Container(
                margin: EdgeInsets.all(8),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index < pin.length ? Colors.black : Colors.grey[300],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
       Center(
        child: SizedBox(
          width: 240,
          child:    GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.0,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              if (index == 9) return SizedBox.shrink();
              if (index == 10) return buildNumberButton("0");
              if (index == 11) {
                return
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index < pin.length ? Colors.black : Color(0xFFE6E6FF),
                    ),
                    child: Material(
                      color: Colors.transparent,
                         child: InkWell(
                          onTap: onDeletePress,
                           borderRadius: BorderRadius.circular(8),
                           child: Center(
                            child: IconButton(
                                icon: Icon(Icons.backspace),
                                onPressed: onDeletePress,
                             ),
                           )
                           )
                    ),
                  );
              }
              return buildNumberButton("${index + 1}");
            },
          ),
        ),
       )
        ],
      ),
    );
  }
}