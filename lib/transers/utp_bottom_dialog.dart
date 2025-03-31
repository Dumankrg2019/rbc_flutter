import 'package:flutter/material.dart';
import 'package:flutter_application_1/pin_code.dart';
import 'package:flutter_application_1/transers/receive_utp.dart';
import 'package:flutter_application_1/transers/send_utp.dart';
import 'package:flutter_svg/svg.dart';

 void showUTPBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(42)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
               ListTile(
                    title: const Text('UTP международный перевод',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                      )
                     ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
              ListTile(
                    title: const Text('Отправить перевод'),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // При необходимости можно добавить иконку или стрелку справа
                    onTap: () {
                      // Действие при нажатии
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SendUTPScreen()),
                        );  
                    },
                  ),
                  // Серая разделительная линия
                  Divider(color: Colors.grey.shade300,
                   height: 1,        
                   thickness: 1,
                    indent: 16.0,
                    endIndent: 16.0,
                   ),
                  // Элемент «Получить перевод»
                  ListTile(
                    title: const Text('Получить перевод'),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    onTap: () {
                      // Действие при нажатии
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReceiveUTPScreen()),
                        );  
                    },
                  ),              
            ],
          ),
        )
        );
      },
    );
  }