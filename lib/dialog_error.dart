import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class DialogError extends StatefulWidget {
  const DialogError({Key? key}) : super(key: key);

  @override
  State<DialogError> createState() => _DialogErrorState();

   static void displayDialog(String message, BuildContext context) {
    // This delegates to the helper (or you could duplicate the logic)
    _DialogErrorState()._showCustomDialog(message, context);
  }
}

class _DialogErrorState extends State<DialogError> {
  void _showCustomDialog(String message, BuildContext context) {
    showDialog(
      context: context,
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
                  'assets/images/dialog_error.svg',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(height: 16),
                Container(
                  width: 222,
                  child: const Text(
                    "Внимание!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 222,
                  child: Text(
                    message, // Use the passed text here
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),
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
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: const Text(
                      "Хорошо",
                      style: TextStyle(
                        color: Colors.white,
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
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () {
      _showCustomDialog("Вы действительно хотите выйти?", context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Диалог появляется автоматически"),
      ),
    );
  }
}

