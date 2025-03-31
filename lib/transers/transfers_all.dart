import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_bank.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/transers/between_own_accounts.dart';
import 'package:flutter_application_1/transers/currency_coonversion.dart';
import 'package:flutter_application_1/transers/on_another_bank_card.dart';
import 'package:flutter_application_1/transers/to_top_up_card.dart';
import 'package:flutter_application_1/transers/transfer_request.dart';
import 'package:flutter_application_1/transers/transfer_swift.dart';
import 'package:flutter_application_1/transers/transfer_to_business_or_individual.dart';
import 'package:flutter_application_1/transers/transfer_to_phone_number.dart';
import 'package:flutter_application_1/transers/utp_bottom_dialog.dart';
import 'package:flutter_svg/svg.dart';

class TransfersAll extends StatelessWidget {
  const TransfersAll({
    Key? key,
    required this.hideBottomNav,
    required this.showBottomNav,
  }) : super(key: key);
  final VoidCallback hideBottomNav;
  final VoidCallback showBottomNav;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Переводы',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  TransfersAllScreen(
         hideBottomNav: hideBottomNav,
        showBottomNav: showBottomNav,
      ),
    );
  }
}



class TransfersAllScreen extends StatefulWidget {
    final VoidCallback hideBottomNav;
    final VoidCallback showBottomNav;
    int _currentIndex = 0;

    
     TransfersAllScreen({
      Key? key,
      required this.hideBottomNav,
      required this.showBottomNav,
    }) : super(key: key);


  @override
  _TransfersAllScreenState createState() => _TransfersAllScreenState();
}

class _TransfersAllScreenState extends State<TransfersAllScreen> {
  bool isFaceIDEnabled = false;
  bool isPinEnabled = true;
  bool isScreenshotEnabled = true;

  //   @override
  // void initState() {
  //   super.initState();
  //   widget.hideBottomNav(); // Hide bottom navigation on screen open
  // }

  // @override
  // void dispose() {
  //   widget.showBottomNav(); // Show bottom navigation when leaving the screen
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Handle back button press
        //     //Navigator.pop(context);
        //   },
        // ),
        title: Text('Переводы'),
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
        ],
       
      ),
      body: TransfersScreen(
        hideBottomNav: widget.hideBottomNav,
        showBottomNav: widget.showBottomNav,
      )
    );
  }


}


  class TransfersScreen extends StatefulWidget {

    final VoidCallback hideBottomNav;
    final VoidCallback showBottomNav;

    const TransfersScreen({
      Key? key,
      required this.hideBottomNav,
      required this.showBottomNav,
    }) : super(key: key);

  @override
  State<TransfersScreen> createState() => _TransfersScreenState();
}

class _TransfersScreenState extends State<TransfersScreen> {
  // Индекс выбранной вкладки
  int _selectedIndex = 0;

  // Метод для смены вкладки
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Верхний блок с тремя кнопками
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Кнопка "Все"
                _buildTabButton(index: 0, label: 'Все'),
                const SizedBox(width: 8),
                // Кнопка "Частые"
                _buildTabButton(index: 1, label: 'Частые'),
                const SizedBox(width: 8),
                // Кнопка "История"
                _buildTabButton(index: 2, label: 'История'),
              ],
            ),
          ),

          // Основная часть экрана
          Expanded(
            child: Builder(
              builder: (context) {
                switch (_selectedIndex) {
                  case 0:
                    return _buildAllTransfers(widget.hideBottomNav);
                  case 1:
                    return _buildFrequentTransfers();
                  case 2:
                    return _buildHistoryTransfers();
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Виджет "Все"
  Widget _buildAllTransfers(VoidCallback hideBottomNav) {
    return ListView(
      children: [
        _buildListItem(
          icon: 'assets/images/transfer.svg',
          title: 'Между своими счетами',
          subtitle: 'Картами и депозитами',
           onTap: () {
            hideBottomNav();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransferOwnAccountScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/card.svg',
          title: 'На карту любого банка',
          subtitle: 'Клиенту RBK, банков РК и зарубежных',
           onTap: () {
            hideBottomNav();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransfTAntherankCardScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/phone.svg',
          title: 'По номеру телефона',
          subtitle: 'Клиенту RBK, Halyk Bank, Altyn Bank и др.',
          onTap: () {
            hideBottomNav();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransferToPhoneumberScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/refresh.svg',
          title: 'Конвертация валют',
          subtitle: 'Льготный курс от 10 000\$',
          onTap: () {
            hideBottomNav();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CurrencyConversionScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/add_card.svg',
          title: 'Пополнение карты',
          subtitle: 'Картой другого банка',
          onTap: () {
            hideBottomNav();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ToTopUpCardScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/new_card.svg',
          title: 'На счет юр. и физ. лицам',
          subtitle: 'В любой банк РК',
          onTap: () {
            hideBottomNav();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransferToBusinesOrIndividualScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/swift.svg',
          title: 'Swift',
          subtitle: 'По всему миру',
          onTap: () {
            hideBottomNav();
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SwiftTransferScreen()),
              );
          },
        ),
        _buildListItem(
          icon: 'assets/images/upt.svg',
          title: 'UPT международный перевод',
          subtitle: 'Отправить или получить',
            onTap: () {
              hideBottomNav();
              showUTPBottomSheet(context);           
          },
        ),
        _buildListItem(
          icon: 'assets/images/get_transfer.svg',
          title: 'Запрос перевода',
          subtitle: 'По номеру перевода',
            onTap: () {
              hideBottomNav();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransfRequestScreen()),
              );
          },
        ),
      ],
    );
  }

  /// Виджет "Частые"
  Widget _buildFrequentTransfers() {
    return const Center(
      
      child: SizedBox(
        width: 222,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Частые операции',
            style: TextStyle(
              color:Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
            Text('Добавляйте переводы в частые для быстрого доступа к ним. Платежи добавля.тся автоматически',
            textAlign: TextAlign.center,)
          ],
        ),
        ),
    );
  }

  /// Виджет "История"
  Widget _buildHistoryTransfers() {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          alignment: Alignment.topLeft,
          child: Column(
              children: [
               SizedBox(
                child:  Text("Выберите период",
                style: TextStyle(
                color:Color(0xFFA5A5A5),
                fontSize: 14,
                fontWeight: FontWeight.normal,
                  )
                 ),
               ),
            SizedBox(
              child: Text("11 марта - 28 марта",
                style: TextStyle(
                  color:Color(0xFF5659FE),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
          ],
          )
          )),  
     
        Expanded(
          child:   Center(
            child: SizedBox(
            width: 222,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('История пуста',
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                    Text('За выбранный период операции не найдено',
                    textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }

  /// Кастомная кнопка переключения вкладок
  Widget _buildTabButton({required int index, required String label}) {
    final bool isSelected = (index == _selectedIndex);

    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabSelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF5659FE) : Colors.white,
            border: Border.all(color: Color(0xFF5659FE)),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF323643),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Элемент списка с цветной полоской слева
  Widget _buildListItem({
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 32,
        height: 32,
        ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,  
      onTap: () {
        onTap();
      },
    );
  }
}