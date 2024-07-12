import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  List<Contact> contact = [];

  void getContacts() async {
    try {
      await FlutterContacts.requestPermission();
      contact = await FlutterContacts.getContacts(withProperties: true);
    } catch (e) {
      debugPrint("Exception in getContacts");
    }
    update();
  }

  void callContact(Contact contact) {
    List<Phone> phones = contact.phones;

    if (phones.isNotEmpty) {
      String phone = phones[1].number;
      debugPrint("Phone number: $phone");
    }
  }
}
