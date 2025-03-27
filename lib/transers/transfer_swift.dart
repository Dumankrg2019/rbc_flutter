
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwiftTransferScreen extends StatefulWidget  {

   @override
  State<SwiftTransferScreen> createState() => _SwiftTransferScreen();

}

class _SwiftTransferScreen extends State<SwiftTransferScreen> {

   String? _selectedCountry;
  String? _selectedKBE;
  final _lastNameController = TextEditingController(text: 'IVANOV');
  final _firstNameController = TextEditingController(text: 'IVAN');
  final _phoneController = TextEditingController(text: '+7 (___) ___ __ __');

  bool _isHelpForFill = false;


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
        title: Text('Swift'),
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
                   // Я публичное должностное лицо
                 Container(
              
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFF1F1FF),
                    ),
                    child: SwitchListTile(
                        title: const Text('Помощь в заполнении',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF323643)
                          ),
                        ),
                        value: _isHelpForFill,
                        onChanged: (bool value) {
                          setState(() {
                            _isHelpForFill = value;
                          });
                        },
                        // Чтобы упростить стилизацию, можно убрать Divider:
                        // secondary: const Icon(Icons.person_outline),
                      ),
                  ),
                  _buildAccountSelector('Счет списания'),
                  SizedBox(height: 10),
                  if(!_isHelpForFill) _buildAccountSelector('Счет получателя', iconUrl: "assets/images/little_card.svg"),
                  if(_isHelpForFill) _buildAccountSelector('Счет списания комиссии (KZT)'),                  
                  SizedBox(height: 20),
                  if(!_isHelpForFill) _fieldsBlock(),
                  _isHelpNeed(),
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
        const Text('Swift-код банка получателя'),
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
              DropdownMenuItem(value: 'ru', child: Text('Kaspi')),
              DropdownMenuItem(value: 'kz', child: Text('Halyk')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
          ),
          SizedBox(height: 16),
           const Text('Название получателя'),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
                hintText: "Введите название",
              ),
            ),
            SizedBox(height: 22),
            //Страна гражданство получателя
            const Text('Страна гражданства получателя'),
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
              DropdownMenuItem(value: 'ru', child: Text('Казахстан')),
              DropdownMenuItem(value: 'kz', child: Text('РФ')),
              DropdownMenuItem(value: 'kz', child: Text('Узбекстан')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
          ),
          SizedBox(height: 16),
           const Text('Город получателя (местонахождение)'),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
                hintText: "Заполните поле",
              ),
            ),
              SizedBox(height: 22),
            //Страна гражданство получателя
            const Text('Страна гражданства получателя'),
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
          hint: const Text('Swift-код банка корреспондента'),
          value: _selectedCountry,
            items: const [
              DropdownMenuItem(value: 'ru', child: Text('25886686')),
              DropdownMenuItem(value: 'kz', child: Text('33458787')),
              DropdownMenuItem(value: 'kz', child: Text('00428845')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
          ),
          SizedBox(height: 16),
           const Text('Счет в банке корреспондента'),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Color(0xFFE1E3E8))
                ),
                 focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                ),
                hintText: "Заполните поле",
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding:const EdgeInsets.all(8),                
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF1F1FF),     
                ),
              child: Text(
                "Реквизиты банка корреспондента и счета не являются обязательными к заполнению и вносятся при условии их наличия"
                ),
            ),

            SizedBox(height: 25),
            
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
             // КНП
            const Text('КНП'),
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
                DropdownMenuItem(value: 'КНП1', child: Text('КНП 1')),
                DropdownMenuItem(value: 'КНП2', child: Text('КНП 2')),
                // ... добавьте нужные варианты
              ],
              onChanged: (value) {
                setState(() {
                  _selectedKBE = value;
                });
              },
            ),             
          ],
    );
  }

  Widget _isHelpNeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
              // Тип комиссии
            const Text('Тип комиссии'),
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
                DropdownMenuItem(value: 'comision1', child: Text('Комссия 1')),
                DropdownMenuItem(value: 'comision1', child: Text('Комссия 2')),
                // ... добавьте нужные варианты
              ],
              onChanged: (value) {
                setState(() {
                  _selectedKBE = value;
                });
              },
            ),
            const SizedBox(height: 15),
            const Text('Назначения платежа'),
              const SizedBox(height: 4),
              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1E3E8))
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE1E3E8)), // Gray color when focused
                  ),
                  hintText: "Заполните поле",
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding:const EdgeInsets.all(8),                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFF1F1FF),     
                  ),
                child: Text(
                  "Заполняется только на английском языке"
                  ),
              ),
              SizedBox(height: 25),
            if(!_isHelpForFill) _buildAccountSelector('Счет списания комиссии (KZT)'),
            SizedBox(height: 25),
            _attachDocAndTextBlock(),      
      ],
    );
  }

  Widget _attachDocAndTextBlock() {
    return Column(
        children: [
          OutlinedButton(
            onPressed: () => {

            },
             style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              side: BorderSide(color: Color(0xFF5659FE), width: 2), // Border color & width
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
            child: Center(
              child: Text(
                "ВЛОЖИТЬ ДОКУМЕНТ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5659FE)
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
              Container(
              padding:const EdgeInsets.all(8),                
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF1F1FF),     
                ),
              child: Text(
                "Внимание, если вы прикладываете документ, в нем должны обязательно присутствовать реквизиты: Swift код банка получателя Счет получателя Наименование получателя Страна и нород нахождения получателя Swift-код банка корреспондента (при наличии) Счет в банке корреспондента (при наличии) Размер файла не должен превышать 10 мб"
                ),
            ),
        ],
    );
  }

  Widget _buildAccountSelector(String label, { String? iconUrl}) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: 16.0),
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
        ],
      ),
    );
  }
}