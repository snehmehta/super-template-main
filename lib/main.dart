import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_template/template_page.dart';

import 'firebase_options.dart';
import 'dart:html' as html;

Future<void> main() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super template',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomePage(),
        '/': (context) => const TemplatePage(),
      },
      theme: ThemeData(primarySwatch: Colors.grey).copyWith(
          inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(8.0),
        border: OutlineInputBorder(),
      )),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128.0),
        child: Column(
          children: const [
            SizedBox(height: 16.0),
            Navbar(),
            Expanded(child: HeroSection()),
          ],
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text(
            'Flutter Template',
            style: textTheme.headline4
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('Code generating'),
                      content: SizedBox(
                        height: 100,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  },
                );

                final data = Config.toJson();

                const url =
                    'https://zillion.potmoney.in/super/api/v1/generate/';

                final response = await Dio().post(
                  url,
                  data: data,
                  options: Options(headers: {
                    "Access-Control-Allow-Origin": "*",
                    'Content-Type': 'application/json',
                    'Accept': '*/*'
                  }),
                );

                if (response.statusCode != 200) return;

                Navigator.pop(context);

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Download link is ready'),
                      content: TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            html.AnchorElement anchorElement =
                                html.AnchorElement(
                                    href: response.data['download_link']);
                            anchorElement.download = url;
                            anchorElement.click();
                            Navigator.pop(context);
                          } else {
                            await Clipboard.setData(ClipboardData(
                                text: response.data['download_link']));
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Copied to clipboard')));
                          }
                        },
                        child: Text(response.data['download_link']),
                      ),
                    );
                  },
                );
              },
              child: const Text('Generate code'),
            ),
          ],
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Build PRO app, Faster 😎',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 92.0,
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              Text(
                'Power, Custom, high quality templates for your next project.',
                style: textTheme.headline5,
              ),
              Text('Flutter, React, Vue and more.', style: textTheme.headline5),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            onPressed: () {
              if (kIsWeb) {
                FirebaseAnalytics analytics = FirebaseAnalytics.instance;
                analytics.logEvent(name: 'template');
              }
              Navigator.pushNamed(context, '/template');
            },
            child: const Text('Let\'s get started'),
          )
        ],
      ),
    );
  }
}
