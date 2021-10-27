import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/providers/login_form_provider.dart';
import 'package:proyecto/ui/input_decorationd.dart';
import 'package:proyecto/widgets/widgets.dart';


class RegistryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackaground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text('registro', style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(), child: _LoginForm())
                ],
              ),
            ),
            SizedBox(height: 50),

//Boton para retroceder 

            MaterialButton(
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                child: Container(
                    child: Text(
                  'Atras',
                  style: TextStyle(color: Colors.white),
                )),
                onPressed: () {
                  // if (!loginForm.isValidForm()) return;
                  Navigator.pushReplacementNamed(context, "login");
                }),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

//campos de registro (formulario)

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ana Perez',
                  labelText: 'Nombre completo',
                  prefixIcon: Icons. account_circle_sharp,
                ),
               
              ),
              
            
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                 
                    hintText: 'Edad',
                    labelText: 'Edad',
                    prefixIcon: Icons.calendar_today),
                

              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Correo',
                    labelText: 'Correo',
                    prefixIcon: Icons.attach_email_outlined),
                

              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline),
                

              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Confirmar contraseña',
                    labelText: 'Confirmar contraseña',
                    prefixIcon: Icons.lock_outline),
                

              ),

//Boton para retroceder 
            
              SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        'Crear',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () {
                    // if (!loginForm.isValidForm()) return;
                    Navigator.pushReplacementNamed(context, 'home');
                  }),
            ],
          )),
    );
  }
}




  

