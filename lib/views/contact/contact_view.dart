import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/widgets/drawer/drawer_menu.dart';
import 'package:reproductor_ia/widgets/floatingbutton/voice_floating_button.dart';

import '../../controllers/contacts_controller.dart';
import '../../controllers/voice_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/item_list_views/item_contacts.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

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
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Text(
          "Listado de Contactos",
          style: TextStyle(
            fontSize: responsive.dp(2),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (ContactsController contacts) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ItemContact(
                contact: contacts.contact[index],
                controller: contacts,
              );
            },
            itemCount: contacts.contact.length,
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: null,
            child: const Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            height: responsive.dp(1.5),
          ),
          const VoiceFloatingButton()
        ],
      ),
    );
  }
}
