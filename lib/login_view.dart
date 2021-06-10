import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subscribe_data/home_view.dart';

class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = ScrollController();
  double offset = 0;
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController vhost = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: ScreenUtil.getInstance().setHeight(100),),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  loginCard(context),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(.15),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0
                              )
                            ]
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){
                                connectDevice();
                              },
                              child: Center(
                                child: Text('SIGN IN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginCard(BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0
            ),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Connect Device',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(45)
              ),
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
            Text('Username',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26)
              ),
            ),
            TextField(
              controller: user,
              decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0
                  )
              ),
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
            Text('Password',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26)
              ),
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0
                  )
              ),
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(30)),
            Text('VirtualHost',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(26)
              ),
            ),
            TextField(
              controller: vhost,
              decoration: InputDecoration(
                  hintText: "/VirtualHost",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0
                  )
              ),
            ),
            SizedBox(height: ScreenUtil.getInstance().setHeight(35)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void connectDevice(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView(user: user.text, pass: pass.text, vhost: vhost.text)));
  }
}


