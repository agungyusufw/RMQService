import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:subscribe_data/value_model.dart';

class ContentCardView extends StatelessWidget {
  ValueModel device;
  ContentCardView({this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 220,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconStyle(),
                                SizedBox(height: 10),
                                NameStyle(),
                                Spacer(),
                                StatusStyle(),
                                SizedBox(width: 30),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                ValueStyle()
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget IconStyle(){
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: device.nama=="POMPA"?
        Icon(
          Icons.settings,
          color: Colors.grey,
          size: 40,
        ):Icon(
          Icons.waves,
          color: Colors.lightBlue,
          size: 40,
        ),
      ),
    );
  }

  Widget NameStyle(){
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${device.nama}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '${device.serial}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget StatusStyle(){
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${device.status}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 20
          ),
        ),
      ),
    );
  }

  Widget ValueStyle(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '${device.value}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'value',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
