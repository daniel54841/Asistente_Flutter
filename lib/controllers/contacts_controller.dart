import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  List<Contact> contact = [];

  void getContacts() async {
    try {
      await FlutterContacts.requestPermission();
      contact = await FlutterContacts.getContacts();
    } catch (e) {
      debugPrint("Exception in getContacts");
    }
    update();
  }
}
