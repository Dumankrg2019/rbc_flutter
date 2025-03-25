import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialog_error.dart';
import 'package:flutter_application_1/dialog_face_id.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/transers/transfers_all.dart';



class MyBankApp extends StatelessWidget {
  const MyBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Bank App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyBankHomeScreen(),
    );
  }
}

class MyBankHomeScreen extends StatelessWidget {
  const MyBankHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Мой банк'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ]
              ),
      body: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopCards(),
          const SizedBox(height: 40),
          _buildCashbackInfo(context),
          const SizedBox(height: 29),
          _buildAccountsSection(context),
          const SizedBox(height: 39),
          _buildOpenOnlineButton(context),
        ],
      ),
    );
  }
   static Widget _buildTopCards() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _cardPlaceholder(),
          const SizedBox(width: 16),
          _cardPlaceholder(),
          const SizedBox(width: 16),
          _cardPlaceholder(),
          const SizedBox(width: 16),
          _cardPlaceholder(),
        ],
      ),
    );
  }

  static Widget _cardPlaceholder() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.credit_card,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }

  static Widget _buildCashbackInfo(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFE1E3E8)),
            bottom: BorderSide(color: Color(0xFFE1E3E8)),
          ),
        ),
        padding: EdgeInsets.all(8), // Добавлен отступ для лучшего вида
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Раздвигаем элементы
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Выравниваем текст
              children: [
                Text(
                  'Общий кешбэк за декабрь',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA5A5A5) 
                  ),
                ),
                SizedBox(height: 4), // Добавлен отступ между текстами
                Text(
                  '20 000 ₸',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
              Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC6CBD4)), // Серый цвет границы
                borderRadius: BorderRadius.circular(4), // Закругление углов
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5), // Внутренние отступы
              child: TextButton(
                onPressed: () {
                  // Действие при нажатии
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Убираем лишние отступы
                  minimumSize: Size(0, 0), // Минимальный размер кнопки
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Убираем доп. отступы вокруг кнопки
                ),
                child: Text(
                  'Увеличить кешбэк',
                  style: TextStyle(
                    color: Color(0xFF5659FE), // Синий цвет текста
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

   static Widget _buildAccountsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Мои счета',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () {
                    // Handle filter button press
                  },
                ),
              ],
            ),
        const SizedBox(height: 16),
        _buildAccountItem(
          title: 'Депозит (мульти)',
          amount: '22 131.76 ₸',
          subtitle: '22 209.08 ₸',
          foreignCount: "1.98 \$",
          iconData: Icons.credit_card,
          context: context,
        ),
        const SizedBox(height: 8),
        _buildAccountItem(
          title: 'Счет *0009',
          amount: '0.04 ₸',
          subtitle: '',
          foreignCount: "",
          iconData: Icons.account_balance_wallet,
          context: context,
          isError: true,
        ),
      ],
    );
  }

  static Widget _buildAccountItem({
    required String title,
    required String amount,
    required String subtitle,
    required String foreignCount,
    required IconData iconData,
    BuildContext? context,
    bool isError = false,
    // Removed unused parameter 'isError'
  }) {
        return Container(
      width: double.infinity, // Make the container take full screen width
       // Add padding to prevent text from touching edges
      
      child: InkWell(
          onTap: () => {
            if (context != null && !isError) {
              DialogExample.displayDialog(context)
            }
            else if (context != null && isError) {
              DialogError.displayDialog("Сервис временно недоступен", context)
            }
          },
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Align elements vertically
          children: [
            // Icon Container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 9),
              decoration: BoxDecoration(
                color: Color(0xFFF0F2F4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Icon(iconData, size: 32, color: Colors.deepPurple),
              ),
            ),
            
            const SizedBox(width: 12),

            // Title Text
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            // Spacer to push the next column to the right
            Spacer(),

            // Amount Column (Aligned to Right)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Align text to right side
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey, // Set color to match the UI
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  foreignCount,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  static Widget _buildOpenOnlineButton(BuildContext context) {
    return InkWell(    
        onTap: () {
        // Handle button tap
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransfersAllScreen()),
          );
      },
      child: Container(
        width: double.infinity, // Растягиваем на всю ширину экрана
        padding: EdgeInsets.symmetric(vertical: 16), // Отступы внутри контейнера
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF5659FE), // Начальный цвет (синий)
            Color(0xFF90B2F5), // Конечный цвет (голубой)
          ],
          begin: Alignment.bottomCenter, // Начало градиента
          end: Alignment.topCenter, // Конец градиента
          ), 
          borderRadius: BorderRadius.circular(16),      
        ),
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                '+ ОТКРЫТЬ ОНЛАЙН',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Кредит, депозит, счет, карту',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
    )
    );
  }
}