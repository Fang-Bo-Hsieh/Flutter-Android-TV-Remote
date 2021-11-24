import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TVRemoteDemo extends StatefulWidget {
  @override
  _TVRemoteDemoState createState() => _TVRemoteDemoState();
}

class _TVRemoteDemoState extends State<TVRemoteDemo> {

  static const String domain = "http://localhost:8079";
  static const String ip = "192.168.1.101";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // appBar: AppBar(
      //   leading: Icon(Icons.tv),
      //   title: Text('TV REMOTE'),
      //   titleSpacing: 2.0,
      //   backgroundColor: Colors.white24,
      // ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                        splashColor: Colors.white24,
                        child:SizedBox(
                          height: 56,
                          width: 56,
                          child: Icon(Icons.arrow_back),
                        ),
                        onTap: (){
                          String key = "KEYCODE_BACK";
                          sendKeyToTv(ip, key);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                        splashColor: Colors.white24,
                        child:SizedBox(
                          height: 56,
                          width: 56,
                          child: Icon(Icons.dialpad),
                        ),
                        onTap: (){},
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ClipOval(
                    child: Material(
                      color: Colors.red,
                      child: InkWell(
                        splashColor: Colors.white24,
                        child:SizedBox(
                          height: 56,
                          width: 56,
                          child: Icon(Icons.power_settings_new),
                        ),
                        onTap: (){
                          String key = "KEYCODE_POWER";
                          sendKeyToTv(ip, key);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                        splashColor: Colors.white24,
                        child:SizedBox(
                          height: 56,
                          width: 56,
                          child: Icon(Icons.bubble_chart),
                        ),
                        onTap: (){},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                        splashColor: Colors.white24,
                        child:SizedBox(
                          height: 56,
                          width: 56,
                          child: Icon(Icons.keyboard_arrow_left),
                        ),
                        onTap: (){
                          String key = "KEYCODE_DPAD_LEFT";
                          sendKeyToTv(ip, key);
                        },
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Colors.white24,
                            child:SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(Icons.keyboard_arrow_up),
                            ),
                            onTap: (){
                              String key = "KEYCODE_DPAD_UP";
                              sendKeyToTv(ip, key);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Colors.white24,
                            child:SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(Icons.offline_pin),
                            ),
                            onTap: (){
                              print('tap ok');
                              String key = "KEYCODE_DPAD_CENTER";
                              sendKeyToTv(ip, key);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: ClipOval(
                        child: Material(
                          child: InkWell(
                            splashColor: Colors.white24,
                            child:SizedBox(
                              height: 56,
                              width: 56,
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                            onTap: (){
                              String key = "KEYCODE_DPAD_DOWN";
                              sendKeyToTv(ip, key);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ClipOval(
                    child: Material(
                      child: InkWell(
                        splashColor: Colors.white24,
                        child:SizedBox(
                          height: 56,
                          width: 56,
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                        onTap: (){
                          String key = "KEYCODE_DPAD_RIGHT";
                          sendKeyToTv(ip, key);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 156,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_drop_up),
                        onPressed: () {
                          print('press vol up');
                          String key = "KEYCODE_VOLUME_UP";
                          sendKeyToTv(ip, key);
                        },
                      ),
                      Text('VOL',style: TextStyle(fontWeight: FontWeight.bold),),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          print('press vol down');
                          String key = "KEYCODE_VOLUME_DOWN";
                          sendKeyToTv(ip, key);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 156,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_drop_up),
                      Text('CH',style: TextStyle(fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       height: 40,
            //       width: 100,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         borderRadius: BorderRadius.circular(18.0),
            //         color: Colors.white,
            //       ),
            //       child: Padding(padding: EdgeInsets.all(2.0),
            //         child: Image.asset('assets/netflix.png'),
            //       ),
            //     ),
            //     Container(
            //       height: 40,
            //       width: 100,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         borderRadius: BorderRadius.circular(18.0),
            //         color: Colors.white,
            //       ),
            //       child: Padding(padding: EdgeInsets.all(8.0),
            //         child: Image.asset('assets/prime.png'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  static Future sendKeyToTv(String ip, String key) async{
    Uri url = Uri.parse("${domain}/api.php");

    Map data = {
      'ip': ip,
      'key': key
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print("${response.statusCode}");
    print("${response.body}");
  }
}