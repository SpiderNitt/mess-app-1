import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController messName = TextEditingController();
  late TextEditingController password = TextEditingController();
  bool _passwordvisibility = true;
  @override
  void initState() {
    super.initState();
    _passwordvisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    final heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // decoration: const BoxDecoration(
            //   gradient: RadialGradient(
            //     colors: [
            //       Color.fromRGBO(14, 190, 126, 0.01),
            //       Color.fromRGBO(255, 255, 255, 1),
            //     ],
            //     radius: 0.5,
            //     center: Alignment.bottomRight,
            //   ),
            // ),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: heightOfScreen * 0.14,
                  ),
                  Image.asset("assets/images/vector.jpg"),
                  SizedBox(
                    height: heightOfScreen * 0.024,
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: heightOfScreen * 0.01,
                  ),
                  const Text("Login with your credentials"),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      right: currentwidth * 1.0472 * 0.05,
                      left: currentwidth * 1.0472 * 0.05,
                      bottom: heightOfScreen * 0.1,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: messName,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.check),
                            hintText: 'Mess Name',
                            contentPadding: EdgeInsets.fromLTRB(25, 25, 30, 17),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(103, 114, 148, 0.16),
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        TextField(
                          obscureText: !_passwordvisibility,
                          keyboardType: TextInputType.text,
                          controller: password,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () => setState(() {
                                      _passwordvisibility =
                                          !_passwordvisibility;
                                    }),
                                icon: Icon(_passwordvisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            hintText: 'Password',
                            contentPadding:
                                const EdgeInsets.fromLTRB(25, 25, 30, 17),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(103, 114, 148, 0.16),
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: currentwidth * 0.05, right: currentwidth * 0.05),
                    height: heightOfScreen * 0.068,
                    width: currentwidth * 1.0472 * 0.78,
                    child: ElevatedButton(
                      onPressed: (() => {
                            // Navigation for Login Screen
                          }),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightOfScreen * 0.024,
                  ),
                  InkWell(
                    highlightColor: Colors.green,
                    child: const Text(
                      "Forgot password",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(14, 190, 127, 1)),
                    ),
                    onTap: () {
                      // Navigation for Forgot password
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        elevation: 0,
        child: Image.asset("assets/images/Quote.jpg"),
      ),
    );
  }
}
