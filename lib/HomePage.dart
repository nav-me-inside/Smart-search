import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController value = new TextEditingController();
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  String url =
      'guide OR tutorial OR course OR example OR build OR create OR started -site:github.com -site:github.io -site:npmjs.com -site:openbase.io -site:stackoverflow.com -site:codota.com -site:pika.dev -site:bountysource.com -site:unpkg.com -site:snyk.io -site:gitter.im';
  String resultvalue = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Smart Search",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Search what you need',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                TextField(
                  controller: value,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        resultvalue = "${value.text} $url";
                      });
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                Text(resultvalue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
