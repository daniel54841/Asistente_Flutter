import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reproductor_ia/controllers/contacts_controller.dart';

class ItemContact extends StatelessWidget {
  final Contact contact;
  final ContactsController controller;

  const ItemContact({
    Key? key,
    required this.contact,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.callContact(contact);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.call,
            label: "Llamar",
          )
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              contact.photo != null
                  ? CircleAvatar(
                      child: Image.memory(contact.photo!),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      child: Icon(
                        Icons.contact_phone,
                        color: Colors.deepOrange,
                      ),
                    ),
              const SizedBox(
                width: 12,
              ),
              Text(contact.displayName),
            ],
          ),
        ),
      ),
    );
  }
}
