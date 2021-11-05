import 'package:flutter/material.dart';
import 'package:proyecto/ui/input_decorationd.dart';
import 'package:proyecto/widgets/widgets.dart';

//Amplify flutter Packages
import 'package:amplify_flutter/amplify.dart';
import 'package:proyecto/amplifyconfiguration.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

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
                  Text('Registro',
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 30),
                  LoginForm()
                ],
              ),
            ),
            SizedBox(height: 50),

//Codigo de verificacion
            CardContainer(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text('ingrese codigo de verificación',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: 30),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                          hintText: 'Código',
                          labelText: 'Código',
                          prefixIcon: Icons.phonelink_setup_outlined),
                      onChanged: (value) {
                        print(value);
                      }),
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
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
                onPressed: () {
                  FocusScope.of(context).unfocus();
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
//registro
class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

//campos de registro (formulario)

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  String _password = '';
  String _confirmarpassword = '';

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    //await Amplify.addPlugins ([authPlugin, analyticsPlugin]);
    Amplify.addPlugin(AmplifyAuthCognito());
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  void _crearUsuario() async {
    if (_password == _confirmarpassword) {
      print(_email);
      print(_password);
      print(_confirmarpassword);
      SignUpResult res = await Amplify.Auth.signUp(
        username: _email,
        password: _password,
      );
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // campo correo
              TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Correo',
                      labelText: 'Correo',
                      prefixIcon: Icons.attach_email_outlined),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _email = value;
                    });
                  }),

              // contraseña
              TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      prefixIcon: Icons.lock_outline),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _password = value;
                    });
                  }),

              // campo confirmar contraseña
              TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Confirmar contraseña',
                      labelText: 'Confirmar contraseña',
                      prefixIcon: Icons.lock_outline),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _confirmarpassword = value;
                    });
                  }),

//Codigo de verificacion

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
                    FocusScope.of(context).unfocus();
                    _crearUsuario();
                    Navigator.pushReplacementNamed(context, 'home');
                  }),
            ],
          )),
    );
  }
}
