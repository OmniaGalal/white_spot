import 'package:flutter/material.dart';

class customField extends StatelessWidget {
   customField({
     required this.label,
     required this.hinttext,
     required this.icon,
     @required this.onchange,
     required this.validate,
     @required this.suffix,
     @required this.obsecure=false,
     @required this.controller,

   });
final String label;
final String hinttext;
final IconData icon;
Function(String)? onchange;
String?Function(String?) validate;
bool obsecure;
var suffix;
TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        validator:validate,
        onChanged: onchange,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: '$hinttext',
          prefixIcon: Icon(icon),
          suffixIcon: Icon(suffix),
          label: Text('$label'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}
class custompassField extends StatefulWidget {
  custompassField({
    required this.label,
    required this.hinttext,
    @required this.onchange,
    required this.validate,
    @required this.suffix,
    required this.controller
  });
  final String label;
  final String hinttext;
  Function(String)? onchange;
  String?Function(String?) validate;
  var suffix;
  TextEditingController? controller;


  @override
  State<custompassField> createState() => _custompassFieldState();
}

class _custompassFieldState extends State<custompassField> {
  bool obsecure=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller:widget.controller ,
        validator:widget.validate,
        onChanged: widget.onchange,
        obscureText:obsecure,
        decoration: InputDecoration(
          hintText: '${widget.hinttext}',
          prefixIcon: Icon(Icons.lock),
          suffixIcon:
          IconButton(
            icon:Icon( obsecure
                ?Icons.visibility_off
                :Icons.visibility),
            onPressed: (){
              setState(() {
                obsecure=!obsecure;

              });

            },
          ),
          label: Text('${widget.label}'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          contentPadding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}
