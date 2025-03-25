import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogExample extends StatefulWidget {
  const DialogExample({Key? key}) : super(key: key);

  @override
  State<DialogExample> createState() => _DialogExampleState();

 static void displayDialog(BuildContext context) {
    // This delegates to the helper (or you could duplicate the logic)
    _DialogExampleState().showCustomDialog(context);
  }
  
}

class _DialogExampleState extends State<DialogExample> {
  @override
  void initState() {
    super.initState();

    // Показываем диалог сразу после загрузки экрана
    Future.delayed(Duration(milliseconds: 300), () {
      showCustomDialog(context);
    });
  }

  void displayDialog() {
    showCustomDialog(context);
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
                  'assets/images/dialog_logo.svg',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(height: 16),
                Container(
                  width: 222,
                  child: const Text(
                    'Для использования Face ID необходимо установить код-доступа.\n'
                        'Желаете установить код-доступа для входа в приложение?',
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
                      "ДА",
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
                      "НЕТ",
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
      body: Center(
        child: Text("Диалог появляется автоматически"),
      ),
    );
  }
}