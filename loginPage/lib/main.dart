import 'package:flutter/material.dart';
import 'package:loginpage/signup.dart';

void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
  '/signup': (context) => SignUp(),},
  home: Scaffold(
  resizeToAvoidBottomInset: true,
  body: MyStatefulWidget(),),);}}
  class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});
  @override
  State<MyStatefulWidget> createState() => _HomeState();}
  class CustomClipperBG extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
  Path path= Path();
  path.quadraticBezierTo(size.width, 0 , size.width,size.height*0.7);
  path.quadraticBezierTo(size.width, size.height, size.height, 0);
  return path;}
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;}
  class bgpaint extends CustomPainter{
  @override
  void paint(Canvas canvas , Size size) {
  Path path= Path();
  Paint paint= Paint();
  paint.style= PaintingStyle.fill;
  path.moveTo(0,size.height*0.1);
  path.quadraticBezierTo(size.width, 0, size.width, size.height*0.5);
  paint.color = Color(0xFF5834eb);
  path.quadraticBezierTo(size.width,size.height, 0, size.height*0.9);
  canvas.drawPath(path, paint);}
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
  }class _HomeState extends State<MyStatefulWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  /*final TextEditingController _signupController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();*/
  bool? _checkBox= false;
  final _formKey = GlobalKey<FormState>();
  // This widget is the root of your application.
  //ignore: prefer_const_constructors
  @override
  Widget build(BuildContext context) {
  return
  Form(key: _formKey,
  child: SafeArea(
  child: SingleChildScrollView(
  child: Container(
  color: Colors.black,
  child: CustomPaint(
  painter: bgpaint()
  ,child: Container(
  padding: EdgeInsets.fromLTRB(20,50,20,20),
  margin:EdgeInsets.all(10),
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(
  color: Colors.black),
  borderRadius: BorderRadius.circular(10) ,),
  child: Center(
  child: Column(mainAxisAlignment: MainAxisAlignment.center
  ,crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  const Text("Login",
  style: TextStyle(
  fontWeight: FontWeight.w900,
  color: Colors.black,
  fontSize: 32,)),                SizedBox(
  height:30,),
  TextButton(onPressed: () {Navigator.pushNamed(context, '/signup');},
  child: Text('Create an account',
  style: TextStyle(
  fontWeight: FontWeight.w300,
  color: Color(0xFF5834eb),
  fontSize: 15)),)
  ,SizedBox(
  height:30,)
  ,SizedBox(
  child: Text('Username',
  style: TextStyle(
  fontWeight: FontWeight.w800,
  color: Colors.black,
  fontSize:26),),
  width: MediaQuery.of(context).size.width*0.75,),
  SizedBox(
  width: MediaQuery.of(context).size.width*0.75,
  child: TextFormField(
  cursorHeight: 25,
  controller: _nameController,
  keyboardType: TextInputType.text,
  validator: (value){if(value== null || value.isEmpty|| value.length<3){
  return 'Username is invalid.';}
  return null;},
  decoration: InputDecoration(
  iconColor: Colors.black,
  border : OutlineInputBorder(
  borderRadius: BorderRadius.circular(10)),
  labelText: 'Enter your username',
  hintText: "Minimum 3 characters!",),),),
  SizedBox(height:30,),
  SizedBox(
  child: Text('Password',
  style: TextStyle(
  fontWeight: FontWeight.w900,
  color: Colors.black,
  fontSize:26),),
  width: MediaQuery.of(context).size.width*0.75,),
  SizedBox(width: MediaQuery.of(context).size.width*0.75,
  child: TextFormField(
  controller: _passController,
  onFieldSubmitted: (value){},
  validator: (value){
  if(value== null || value.isEmpty|| value.length<8){
  return 'Please enter a valid password';}
  return null;}
  ,obscureText: true,
  keyboardType: TextInputType.text,
  cursorHeight: 25
  , decoration: InputDecoration(
  iconColor: Colors.black,
  border : OutlineInputBorder(
  borderRadius: BorderRadius.circular(10)),
  hintText: "Must have at least 8 characters",
  labelText: "Enter your password ",),),)
  ,SizedBox(height:30,),
  SizedBox(
  child:  Container(
  width: MediaQuery.of(context).size.width*0.75,
  height: 50,
  decoration: BoxDecoration(
  color: Colors.black,
  borderRadius: BorderRadius.circular(5) ,),
  child: TextButton(
  onPressed: (){
  if (_formKey.currentState!.validate()){showDialog(context: context, builder: (BuildContext context){
  return AlertDialog(
  title: Text('SUCCESS'),
  content: Text('Successfully logged in!'),
  actions: [
  TextButton(onPressed:(){Navigator.of(context).pop();},
  child: Text("Done!")),],
  );});}},child: Text('Log In',
  textAlign: TextAlign.center,
  style: TextStyle(
  color: Colors.white,
  ), ), ),),),
  SizedBox(
  height:30,), SizedBox(
  width:MediaQuery.of(context).size.width*0.75,
  child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Checkbox(value: _checkBox,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  onChanged: (val){
  setState(() {
  _checkBox = val;});},
  activeColor: Colors.black,)
  ,Text(
  'Keep me logged in'
  , style: TextStyle(
  fontWeight: FontWeight.w700,),),],),),
  SizedBox(
  height: MediaQuery.of(context).size.height*0.20,),
  Container(child: TextButton( onPressed:() {
  showDialog(context: context, builder: (BuildContext context){
  return AlertDialog( title: Text("Password Change Request"),
  content: Text("Reset Link has been sent to the registered e-mail")
  ,actions:[
  TextButton( onPressed:(){Navigator.of(context).pop();},
  child:Text("Okay"),),],); } ); },
  child: Text(
  "Forgot Password?",
  style: TextStyle( fontWeight: FontWeight.w300,
  color: Color(0xFF5834eb),),
  ),),), Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [Icon(Icons.copyright_sharp),
  Text("2001-2020 All Rights Reserved" ),],),], ),),),),),),),);}}


