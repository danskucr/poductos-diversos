import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/API/provider/email.dart';
import 'package:provider/provider.dart';

class ContactoForm extends StatefulWidget {
  const ContactoForm({super.key});

  @override
  State<ContactoForm> createState() => _ContactoFormState();
}

class _ContactoFormState extends State<ContactoForm> {
  ColorsPalette colorsPalette = ColorsPalette();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EmailProvider>(context);

    return provider.isLoading ?  
      const Center(
        child: LinearProgressIndicator(),
      ) : provider.error.isNotEmpty
        ?  Center(
        child: Text('Error al consultar información', style: TextStyles().ubuntu16M),
      ) : SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text('Nombre', style: TextStyles().ubuntu16B,),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              filled: true,
              fillColor: Colors.grey.shade300,
    
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Correo Contacto', style: TextStyles().ubuntu16B),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              filled: true,
              fillColor: Colors.grey.shade300,
    
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Texto Correo', style: TextStyles().ubuntu16B),
          TextField(
            controller: bodyController,
            maxLines: 3,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              filled: true,
              fillColor: Colors.grey.shade300,
    
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorsPalette.blueDarkPD,
                ),
                onPressed: () async {

                  await provider.sendEmail(
                    name: nameController.value.text,
                    email: emailController.value.text,
                    subject: 'Solicitud Información APP',
                    message: bodyController.value.text,
                    toName: 'Juan Perez').then((onValue){
                      if (provider.status) {
                        const SnackBar(
                          content: Text('Correo enviado'),
                          backgroundColor: Colors.green,
                        );
                      } else {
                        const SnackBar(
                          content: Text('Error al mandar correo'),
                          backgroundColor: Colors.red,
                        );
                      }
                    });
  
                },
                child: Text('Contactar al vendedor',
                style: TextStyles().ubuntu16But
                
                )
              )
            ],
          )
    
        ],
      ),
    );
  }
}