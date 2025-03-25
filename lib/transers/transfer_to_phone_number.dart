import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransferToPhoneumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
        title: Text('По номеру телефона'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAccountSelector('Откуда'),
            SizedBox(height: 10),
            _buildAccountSelector('+7', iconUrl: "assets/images/little_phone.svg"),
            SizedBox(height: 32),
            Container(
                height: 64,
                child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFE6E6FF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),              
                  prefixStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  hintText: "0 ₸",
                  hintStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ),
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
                      "ПЕРЕВЕСТИ",
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
                  child:  Center(
                    child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Color(0xFFA5A5A5)),
                        children: [
                          TextSpan(text: 'Нажимая кнопку “Перевести”, Вы соглашаетесь с '),
                          TextSpan(
                            text: 'правилами безопасности, лимитами и тарифами',
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
                ) 
          ],
        ),
      ),
      )
    );
  }

  Widget _buildAccountSelector(String label, { String? iconUrl}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
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
          Container(
            width: 32,
            height: 32,            
            decoration: BoxDecoration(
              color: Color(0xFFE6E6FF),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: iconUrl != null
              ? SvgPicture.asset(iconUrl, width: 19, height: 14,)
              : Icon(Icons.more_horiz, color: Colors.grey),
            )
          ),
          SizedBox(width: 10),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey)),
          Spacer(),
          Container(
            child: iconUrl != null
              ? SvgPicture.asset("assets/images/user.svg")
              : SizedBox(),
          )
        ],
      ),
    );
  }
}