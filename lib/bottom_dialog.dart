import 'package:flutter/material.dart';
import 'package:flutter_application_1/pin_code.dart';
import 'package:flutter_svg/svg.dart';

class BottomDialog extends StatefulWidget {
  const BottomDialog({super.key});

  @override
  _BottomDialogState createState() => _BottomDialogState();

 
    
}


class _BottomDialogState extends State<BottomDialog> {
    @override
    void initState() {
      super.initState();
      // Вызываем метод после построения первого кадра
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showCustomBottomSheet(context);
      });
    }
    
    
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(       
        body: Container(
           color: Color(0xFF574B9B),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      showCustomBottomSheet(context);
                    },
                    child: Image.asset("assets/images/logo_rbc.png"),
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton('assets/images/finger_print.svg'),
                  _buildIconButton('assets/images/pin_code.png'),
                ],
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Сменить пользователя',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontWeight: FontWeight.normal,
                    decorationThickness: 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconButton(String icon) {
    bool isSvg = icon.toLowerCase().endsWith('.svg');
    return Column(
      children: [
        InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinCodeScreen()),
            )
          },
            child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF5659FE),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  isSvg
                ? SvgPicture.asset(
              icon,
              width: 70,
              height: 70,
            )
                : Image.asset(
              icon,
              width: 70,
              height: 70,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
    
  }

