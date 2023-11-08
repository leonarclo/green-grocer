import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:green_grocer/src/pages/widgets/custom_text_field.dart';
import 'package:green_grocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do Usuário"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
            initialValue: app_data.user.email,
            readOnly: true,
          ),
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: app_data.user.name,
            readOnly: true,
          ),
          CustomTextField(
              icon: Icons.phone,
              label: 'Celular',
              initialValue: app_data.user.celular,
              readOnly: true,
              inputFormatters: [
                TextInputMask(mask: ['(99) 9 9999-9999', '(99) 9999-9999'])
              ]),
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            inputFormatters: [TextInputMask(mask: '999.999.999-99')],
            initialValue: app_data.user.cpf,
            isSecret: true,
            readOnly: true,
          ),
          SizedBox(
            height: 45,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(width: 2, color: Colors.green)),
              child: const Text(
                "Atualizar senha",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
