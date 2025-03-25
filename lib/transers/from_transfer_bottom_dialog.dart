
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FromTransferBottomDialog extends StatelessWidget {
   FromTransferBottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Dialog')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showCustomBottomSheet(context, accounts);
            },
            child: const Text('Показать BottomDialog'),
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context, List<Map<String, String>> accounts) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];
            return AccountCard(
              icon: "assets/images/transfer_card.svg",
              title: account["type"]!,
              number: account["number"]!,
              balance: account["balance"]!,
            );
          },
        );
      },
    );
  }

   
  
}

final List<Map<String, String>> accounts = [
    {"type": "Virtuon", "number": "*0189", "balance": "0.00 ₸"},
    {"type": "Virtuon", "number": "*1906", "balance": "0.00 ₸"},
    {"type": "Счет", "number": "*0004", "balance": "0.00 ₸"},
  ];

  
class AccountCard extends StatelessWidget {
  final String icon;
  final String title;
  final String number;
  final String balance;

  const AccountCard({
    required this.icon,
    required this.title,
    required this.number,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF1F1FF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: 10),
                Text(
                  "$title $number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              balance,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
