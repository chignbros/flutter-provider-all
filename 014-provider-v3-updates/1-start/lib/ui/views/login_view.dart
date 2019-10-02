import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/viewmodel/login_provider.dart';
import 'package:provider_arc/ui/shared/app_colors.dart' as prefix0;
import 'package:provider_arc/ui/views/base_view.dart';
import 'package:provider_arc/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginModel>(
      model: LoginModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller,),
      builder: (context,model,child)=>Scaffold(
        backgroundColor: prefix0.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            model.busy
            ? Center(child: CircularProgressIndicator(),)
            : FlatButton(
              child: Text('Login'),
              color: Colors.tealAccent,
              onPressed: ()async{
                var success=await model.login(_controller.text);
                if (success) {
                  Navigator.pushNamed(context, RoutePaths.Home); 
                }
              },
            )
          ],
        ),
      ),
    );
       
}
}