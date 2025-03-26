
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SendUTPScreen extends StatefulWidget  {

   @override
  State<SendUTPScreen> createState() => _SendUTPScreen();

}

class _SendUTPScreen extends State<SendUTPScreen> {

   String? _selectedCountry;
  String? _selectedKBE;
  final _lastNameController = TextEditingController(text: 'IVANOV');
  final _firstNameController = TextEditingController(text: 'IVAN');
  final _phoneController = TextEditingController(text: '+7 (___) ___ __ __');

  bool _isPublicOfficer = false;


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
        title: Text('UTP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAccountSelector('Откуда'),
                  SizedBox(height: 20),
                  _fieldsBlock(),
                  SizedBox(height: 32),
                  Container(
                      height: 64,
                      child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1FF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0),              
                        prefixStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        hintText: "0 \$",
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
                      SizedBox(height: 20),   
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
            ),
      )
    );
  }
  Widget _fieldsBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Получатель: ", style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF323643)
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 15),
         const Text('Страна'),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            // Нижняя линия под полем
            enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
          ),
          hint: const Text('Выберите из списка'),
          value: _selectedCountry,
            items: const [
              DropdownMenuItem(value: 'ru', child: Text('Россия')),
              DropdownMenuItem(value: 'kz', child: Text('Казахстан')),
              // ... добавьте нужные страны
            ],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
          ),
          SizedBox(height: 16),
            // КБЕ
            const Text('КБЕ'),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
              ),
              hint: const Text('Выберите из списка'),
              value: _selectedKBE,
              items: const [
                DropdownMenuItem(value: 'kbe1', child: Text('KBE 1')),
                DropdownMenuItem(value: 'kbe2', child: Text('KBE 2')),
                // ... добавьте нужные варианты
              ],
              onChanged: (value) {
                setState(() {
                  _selectedKBE = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Фамилия (латиницей)
            const Text('Фамилия (латиницей)'),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
                hintText: "IVANOV",
              ),
            ),
            const SizedBox(height: 16),

            // Имя (латиницей)
            const Text('Имя (латиницей)'),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
                hintText: "IVAN",
              ),
            ),
            const SizedBox(height: 16),

            // Номер телефона
            const Text('Номер телефона'),
            const SizedBox(height: 4),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
                hintText: "+7 (___) ___ __ __",
              ),
            ),
            const SizedBox(height: 16),

            // Я публичное должностное лицо
            Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF1F1FF),
              ),
                child: SwitchListTile(
                    title: const Text('Я публичное должностное лицо',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF323643)
                      ),
                    ),
                    value: _isPublicOfficer,
                    onChanged: (bool value) {
                      setState(() {
                        _isPublicOfficer = value;
                      });
                    },
                    // Чтобы упростить стилизацию, можно убрать Divider:
                    // secondary: const Icon(Icons.person_outline),
                  ),
            )
      ],
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