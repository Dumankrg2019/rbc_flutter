import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_dialog.dart';
import 'package:flutter_application_1/my_bank.dart';
import 'package:flutter_application_1/pin_code.dart';
import 'package:flutter_application_1/settings.dart';
import 'package:flutter_application_1/transers/between_own_accounts.dart';
import 'package:flutter_application_1/transers/currency_coonversion.dart';
import 'package:flutter_application_1/transers/from_transfer_bottom_dialog.dart';
import 'package:flutter_application_1/transers/on_another_bank_card.dart';
import 'package:flutter_application_1/transers/to_top_up_card.dart';
import 'package:flutter_application_1/transers/transfer_to_business_or_individual.dart';
import 'package:flutter_application_1/transers/transfer_to_phone_number.dart';
import 'package:flutter_application_1/transers/transfers_all.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BottomDialog(),
    );
  }
}
