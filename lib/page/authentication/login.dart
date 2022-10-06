import 'package:flutter/material.dart';
import 'package:gotech_app/modal/modal_authentication.dart';
import 'package:gotech_app/responsive/repo.dart';
import 'package:gotech_app/router/router_manager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ValueNotifier<bool> showPassword = ValueNotifier(true);
  ValueNotifier<String?> mess = ValueNotifier(null);

  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  void _handleClickShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      insetPadding: const EdgeInsets.all(100),
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text("Authenticating...")),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _handleClickSubmitLogin(
      String username, String password, BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      showLoaderDialog(context);

      Future<ModalAuthentication> res =
          GotechRespontive.fetchPostLogin(username, password);

      res.then((value) {
        if (_isThereCurrentDialogShowing(context) == true) {
          Navigator.pop(context);
        }

        if (value.success == true) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteManager.home, (route) => false);
        } else if (value.success == false) {
          mess.value = value.mess;
        } else {
          print("network is not find");
        }
      });
    }
  }

  void onChangeInput() {
    mess.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _login(),
    );
  }

  Widget _login() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _title(),
                const SizedBox(
                  height: 32,
                ),
                _formLogin(),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      "SIGN IN",
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
    );
  }

  Widget _formLogin() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            // onEditingComplete: (() => ),
            onChanged: ((value) => onChangeInput()),
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "User Name",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          AnimatedBuilder(
            animation: showPassword,
            builder: (context, child) => TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: ((value) => onChangeInput()),
              controller: passwordController,
              obscureText: showPassword.value,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () => _handleClickShowPassword(),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
              animation: mess,
              builder: (context, child) => mess.value == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        mess.value ?? "",
                        style: const TextStyle(color: Colors.red),
                      ),
                    )),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("REGISTER"))),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () => _handleClickSubmitLogin(
                          usernameController.text,
                          passwordController.text,
                          context),
                      child: const Text("SIGN IN"))),
            ],
          )
        ],
      ),
    );
  }
}
