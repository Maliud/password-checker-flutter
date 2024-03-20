import 'package:flutter/material.dart';

import 'lib/password_strength_checker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      title: 'Password Strength Checker',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),

      //theme dark
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.deepPurple,
        ),
      ),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _passwordController = TextEditingController();

  
  bool _isStrong = false;


    bool _isTextFieldFilled = false; 

  bool _isObscure = true; 


  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


  


    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Strength Checker'),
      ),
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: size.height * 0.3),
              TextField(
                obscureText: _isObscure,
                controller: _passwordController,
                decoration:  InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  border: 
                  const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                 
                  prefixIcon: const Icon(Icons.lock, color: Colors.white,),
                 
                  suffixIcon: 
                 
                  IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                 
                 
                  setState(() {
                    _isTextFieldFilled = value.isNotEmpty;
                  });
                },
              ),
              const SizedBox(height: 16.0),
             
             
          
          
            
              if (_isTextFieldFilled)
              AnimatedBuilder(
                animation: _passwordController,
                builder: (context, child) {
            
            
                  final password = _passwordController.text;
            
            
                  return PasswordStrengthChecker(
                    onStrengthChanged: (bool value) {
            
            
                      setState(() {
                        _isStrong = value;
                      });
                    },
                    password: password,
                  );
                },
              ),
              const SizedBox(height: 24.0),
              Center(
                child: 
                
            
          
                ElevatedButton(
                 
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                 
                    minimumSize: const Size(200, 50),
                 
                    elevation: 10,
          
                  ),
                  onPressed: _isStrong ? () {
                  } : null,
                  child: const Text('Submit', style: TextStyle(fontSize: 20, color: Colors.deepPurple )),
                ),
              ),
          
              //Text
               SizedBox(height: size.height * 0.2),
              
              const Center(
                child: Text(
                  'Developed by Muhammed Ali Ud',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
