part of 'pages.dart';

class Book extends StatefulWidget {
  const Book({ Key? key }) : super(key: key);
  static const String routeName = '/book';
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  void initState() {
    super.initState();
  }

  final _loginKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlAddress = TextEditingController();
  bool isHide = true;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    ctrlPhone.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('book'),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _loginKey,
          child: Column(
            children: [ 
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "email",
                  prefixIcon: Icon(Icons.email)
                ),
                controller: ctrlEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  return !EmailValidator.validate(value.toString())
                   ? 'email tidak valid': null;
                },
              ),

              SizedBox(height: 16,),
              TextFormField(
                obscureText: isHide,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                    child: Icon(
                      isHide
                        ? Icons.visibility
                        : Icons.visibility_off
                    ),
                  )
                ),
                controller: ctrlPass,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  return value.toString().length < 8
                  ? 'password at least 8 character!': null;
                },
              ),

              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "phone",
                  prefixIcon: Icon(Icons.phone)
                ),
                controller: ctrlPhone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  return value.toString().length < 6
                  ? 'number at least 6 character!': null;
                },
              ),

              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "alamat",
                  prefixIcon: Icon(Icons.map)
                ),
                controller: ctrlAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 32,),
              ElevatedButton(onPressed: (){
                if(_loginKey.currentState!.validate()){
                  showDialog(
                    context: context, 
                    builder: (context)=>AlertDialog(
                      title: Text('congrats'),
                      content: Text(
                        'email : '+ctrlEmail.text.toString()+
                        ', password: '+ctrlPass.text.toString()+
                        ', phone : '+ctrlPhone.text.toString()+
                        ', address : '+ctrlAddress.text.toString(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                            (BuildContext){
                              return Index();
                            }));
                          }, 
                          child: Text("Return")
                        )
                      ],
                    )
                  );
                }else{
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                     title: Text('failed'),
                     content: Text(
                      'please fill all form'
                     ), 
                    )
                  );
                }
              }, child: Text('submit')),

              


            ],


          ),


        ),
      ),
    );
  }
}