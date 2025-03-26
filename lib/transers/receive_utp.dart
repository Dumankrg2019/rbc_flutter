import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReceiveUTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: Text('UTP'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAccountSelector('Введите код UPT'),                
            
            SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Код UPT вам предоставляет отправить перевода",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  
                )
              ],
            ),
            SizedBox(height: 40),
            Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF5659FE), Color(0xFF90B2F5)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                     
                    },
                    child: const Text(
                      "Получить перевод",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),   
                SizedBox(height: 32),   
                SizedBox(
                  width: 310,
                  child:  RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Color(0xFFA5A5A5)),
                    children: [
                      TextSpan(text: 'Нажимая кнопку “Получить перевод”, Вы подтверждаете , что ознакомились с  '),
                      TextSpan(
                        text: 'Заявлением получения перевода',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        // Добавляем клик-обработчик
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Открыть правила безопасности, лимиты и тарифы");
                          },
                      ),
                    ],
                  ),
                ) ,
                ) 
          ],
        ),
      ),
      )
    );
  }

  Widget _buildAccountSelector(String label, { String? iconUrl}) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,        
        border: Border(
          bottom: BorderSide(
          color: Color(0xFFE1E3E8), // Change to your desired color
          width: 1,        // Change to your desired width
        ),
    ),
      ),
      child: Row(
        children: [    
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}