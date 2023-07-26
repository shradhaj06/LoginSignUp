import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _signupController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordreenterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(title: Text('Registration Page'),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,),
        body:
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.lightBlueAccent,
                      Colors.white]
                    , begin: Alignment.centerRight,
                    end: Alignment.centerLeft))
            ,child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center
              , crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(height: 40,),
                const Text("E-mail:",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,)),
                SizedBox(height: 10,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(cursorHeight: 20,
                    controller: _signupController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email)=> email!=null && !EmailValidator.validate(email)? 'Enter a valid email':null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_sharp),
                      iconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'e-mail',
                      hintText: "Enter Your e-mail",),),),
                SizedBox(height: 40,)
                , const Text("Verify your e-mail:",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,)), SizedBox(
                  height: 10,), SizedBox(width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(
                    cursorHeight: 20,
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null ||value.isEmpty|| value.length!=5){
                        return 'Please enter a valid OTP';}
                      return null;}, decoration: InputDecoration(
                    iconColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: ' OTP on email',
                    hintText: 'OTP must be of 5 digits',),),),
                SizedBox(height: 40,), const Text("New Username:",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,)),SizedBox(height: 10,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(cursorHeight: 20,
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value == null ||value.isEmpty|| value.length<3){
                        return 'Username should not be less than 3 in length';}
                      return null;}
                    ,decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      iconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'username',
                      hintText: "Minimum three characters ",),),),
                SizedBox(height: 50,), const Text("Password you want:",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,)),
                SizedBox(height: 10), SizedBox(width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(cursorHeight: 20,
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,validator: (value){
                      if(value== null || value.isEmpty|| value.length<8){
                        return 'Please enter a valid password';}
                      return null;}, decoration: InputDecoration(
                      iconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: " Must be of 8 characters atleast",
                      labelText: "Enter your password ",),),)
                , SizedBox(height: 50,), const Text("Confirm your password",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24,)),
                SizedBox(height: 10), SizedBox(width: MediaQuery.of(context).size.width * 0.75,
                  child: TextFormField(cursorHeight: 20,
                    controller: _passwordreenterController,
                    keyboardType: TextInputType.text,
                    obscureText: true,validator: (val){
                      if(val== null || val.isEmpty|| val.length<8||val!= _passwordController.text){
                        return 'Password does not match';}
                      return null;},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      iconColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Must be same as password!",
                      labelText: "Re-enter your password ",),),)
                , SizedBox(height: 30,),
                TextButton(onPressed: () {if (_formkey.currentState!.validate()){
                  showDialog(context: context, builder: (BuildContext context) { return
                    AlertDialog(title: Text('SUCCESS'),
                      content: Text('Successfully registered!!'),
                      actions: [TextButton(onPressed: () {
                        Navigator.of(context).pop();},
                          child: Text("Done!")),
                      ],);});}},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      side: BorderSide(color: Colors.pinkAccent),
                      shape: RoundedRectangleBorder()),
                  child: Text("Next",
                      style: TextStyle( fontSize:24,
                        color: Colors.white,)),),],),),),),),);}}
