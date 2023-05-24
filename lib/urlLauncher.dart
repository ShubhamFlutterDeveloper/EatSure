import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage3 extends StatefulWidget {
  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  final String lat = "30.697082";
  final String lng = " 76.689472";
  final Uri _url = Uri.parse('https://www.instagram.com/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Url Launcher Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.open_in_browser, color: Colors.white,),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: _launchURL,
                      child: Text('Open Web url',style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ),

           /* Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined, color: Colors.white,),

                    SizedBox(width: 5,),
                    InkWell(
                      onTap:  _launchEmail,
                      child: Text('Open email',style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ),*/

            /*Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.navigation_outlined, color: Colors.white,),

                    SizedBox(width: 5,),
                    InkWell(
                      onTap:  _launchMap,
                      child: Text('Open map',style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ),*/
          ],
        ));
  }

  /*_launchMap() async {
    final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
    final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

    if (await launchUrl(googleMapsUrl as Uri)) {
      await launchUrl(googleMapsUrl as Uri);
    }
    if (await launchUrl(appleMapsUrl as Uri)) {
      await launchUrl(appleMapsUrl as Uri,  webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),);
    } else {
      throw "Couldn't launch URL";
    }
  }
*/
  /*_launchEmail() async {
    launchUrl(
        "mailto:rakhi@aeologic.com?subject=TestEmail&body=How are you%20plugin" as Uri);
  }*/

  _launchURL() async {
    const url = 'instagram.com/its_shubham_422/ ';
    if (await  launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
