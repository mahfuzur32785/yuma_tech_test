import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuma_tech_test/api_service/api_service.dart';
import 'package:yuma_tech_test/home/homepage.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  SharedPreferences? sharedPreferences;

  var token;

  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Sign in to your account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ///Email Feild
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value==null){
                          return;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    ///Password Feild
                    TextFormField(
                      obscureText: isObsecure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        }, icon: Icon(isObsecure ? Icons.visibility_off : Icons.visibility)),
                        hintText: "Enter your password",
                      ),
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if(value==null){
                          return;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30,),
                    ///Sign in button
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(onPressed: () async {
                        var data ={
                          "email": emailController.text.trim(),
                          "password":passController.text.trim()
                        };
                        var result = await ApiService().signIn(data);

                        if(result.statusCode == 200){
                          var data = result.data['data']['_token'];
                          sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences!.setString("token", data);
                          var signuptoken = sharedPreferences!.getString('token');
                          print('token is: ${signuptoken}');

                          print("Log in success $data");
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully Log in")));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(token: token.toString()),));
                          // Navigator.pop(context);
                        }else{
                          print("Something wrong");
                        }

                      }, child: const Text("Sign In"),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ///Password forgot
                    TextButton(onPressed: () {

                    }, child: Text("Forgot password ?")),

                    SizedBox(height: 10,),
                    ///Guest option
                    TextButton(onPressed: () {

                    }, child: Text("Browse as guest",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: CupertinoColors.systemYellow),)),
                  ],
                ),
              )
            ],
            ),
          )
        ],
      ),
    );
  }
}
