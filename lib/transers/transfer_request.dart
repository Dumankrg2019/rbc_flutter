import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransfRequestScreen extends StatefulWidget {
  const TransfRequestScreen({Key? key}) : super(key: key);

  @override
  State<TransfRequestScreen> createState() => _TransfRequestScreen();

}

class _TransfRequestScreen extends State<TransfRequestScreen> {

 @override
  void initState() {
    super.initState();

    // Показываем диалог сразу после загрузки экрана
    Future.delayed(Duration(milliseconds: 300), () {
      showCustomDialog(context);
    });
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Запрет закрытия при нажатии вне окна
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/user_logo.svg',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(height: 16),
                Text("Доступ к контактам",
                     textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                Container(
                  width: 222,
                  child: const Text(
                    'Чтобы узнать является ли контакт из вашей телефонной книги клиентом банка, нам потребуется доступ к вашей телефонной книге',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5659FE), Color(0xFF90B2F5)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Закрыть диалог
                    },
                    child: const Text(
                      "РАЗРЕШИТЬ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF5659FE), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Закрыть диалог
                    },
                    child: const Text(
                      "ЗАПРЕТИТЬ",
                      style: TextStyle(
                        color: Color(0xFF5659FE),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


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
        title: Text('Мои друзья'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [                               
          ],
        ),
      )
    );
  } 
}