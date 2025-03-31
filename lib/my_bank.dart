import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/dialog_error.dart';
import 'package:flutter_application_1/dialog_face_id.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/transers/transfers_all.dart';
import 'package:flutter_svg/svg.dart';



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



class MyBankHomeScreen extends StatefulWidget  {
  const MyBankHomeScreen({Key? key}) : super(key: key);

    @override
  _MyBankHomeScreenState createState() => _MyBankHomeScreenState();
}


class _MyBankHomeScreenState extends State<MyBankHomeScreen> {
  int _currentIndex = 0;
  bool _showBottomNav = true;
  

final List<String> _titles = ['Мой банк', 'Переводы', 'Платежи', 'Услуги'];

  void toggleBottomNav(bool show) {
    setState(() {
      _showBottomNav = show;
    });
  }

 List<Widget> _screens = [
    HomeContent(),
    TransfersAll(
      hideBottomNav: () => {},
      showBottomNav: () =>{}
    ),
    
  ];

  @override
  void initState() {
    super.initState();
      _screens = [
          HomeContent(),
      TransfersAll(
        hideBottomNav: () => toggleBottomNav(false), 
        showBottomNav: () => toggleBottomNav(true)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
          height: 96,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          // Для примера можно добавить лёгкую тень:
            boxShadow: const [
            BoxShadow(
                color: Colors.black12, // полупрозрачный чёрный для мягкой тени
                blurRadius: 10,        // степень размытия
                offset: Offset(0, -4), // смещение вверх (т.к. тень идёт снизу)
              ),
            ],
           ),
        child: BottomNavigationBar(          
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF5659FE),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true, // Чтобы подписи были и у неактивных
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _showBottomNav = true;
              });
            },
            items:  [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/home.svg",
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 0 ? Color(0xFF5659FE) : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                label: 'Мой банк',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/transfer_menu.svg",
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 1 ? Color(0xFF5659FE) : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                label: 'Переводы',
              ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     "assets/images/wallet_menu.svg",
              //       colorFilter: ColorFilter.mode(
              //         _currentIndex == 2 ? Color(0xFF5659FE) : Colors.grey,
              //         BlendMode.srcIn,
              //       ),
              //     ),
              //   label: 'Платежи',
              // ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     "assets/images/services_menu.svg",
              //       colorFilter: ColorFilter.mode(
              //         _currentIndex == 3 ? Color(0xFF5659FE) : Colors.grey,
              //         BlendMode.srcIn,
              //       ),
              //     ),
              //   label: 'Услуги',
              // ),
            ],
          ),
          
       
      ),
      appBar: _currentIndex == 0 ?  AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(_titles[_currentIndex]),
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
              ) : null,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
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
          color: Colors.white,
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
                color: Colors.white,
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
          color: Colors.white,
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
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => TransfersAllScreen(
          //         hideBottomNav: () => {},
          //         showBottomNav: () => {},
          //       )),
          // );
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