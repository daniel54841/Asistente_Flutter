import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/widgets/drawer/drawer_menu.dart';
import 'package:reproductor_ia/widgets/floatingbutton/voice_floating_button.dart';

import '../../controllers/contacts_controller.dart';
import '../../controllers/voice_controller.dart';
import '../../utils/responsive.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

/// An example that demonstrates the basic functionality of the
/// SpeechToText plugin for using the speech recognition capability
/// of the underlying platform.
class _ContactViewState extends State<ContactView> {
  final VoiceController _voiceCtrl = Get.find<VoiceController>();
  final ContactsController _contactsCtrl = Get.find<ContactsController>();

  @override
  void initState() {
    _voiceCtrl.initSpeech();
    _contactsCtrl.getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Text(
          "Listado de Contactos",
          style: TextStyle(
            fontSize: responsive.dp(5),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (ContactsController contacts) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  contacts.contact[index].photo != null ? Image.memory(contacts.contact[index].photo!) : const Icon(Icons.contact_phone),
                  Text(contacts.contact[index].displayName),
                  //   Text(contacts.contact[index].phones[0].number),
                  //Text(contacts.contact[index].name.nickname)
                ],
              );
            },
            itemCount: contacts.contact.length,
          );
        },
      ),
      floatingActionButton: const VoiceFloatingButton(),
    );
  }
}
