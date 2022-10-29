import 'package:flutter/material.dart';

import 'main.dart';

class Config {
  static String? projectName;
  static String? orgName;
  static String? description;

  static toJson() {
    return {
      'project_name': projectName,
      'org_name': orgName,
      'description': description,
    };
  }
}

List<String> templateItems = [
  'App Detail',
  'Theme',
  'Firebase',
  'Networking',
  'Routing',
  'Notification',
  'Event tracker',
  'Error tracker',
  'CI / CD',
];

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  final controller = PageController();
  final nameController = TextEditingController();
  final organizationController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    nameController.text = Config.projectName ?? '';
    organizationController.text = Config.orgName ?? '';
    descriptionController.text = Config.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: MediaQuery.of(context).size.width / 3,
        color: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            const Navbar(),
            const SizedBox(height: 8.0),
            const Divider(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: templateItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text('${index + 1}'),
                          title: Text(templateItems[index]),
                          focusColor: Colors.green,
                          onTap: () {
                            controller.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                        );
                      },
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            itemCount: templateItems.length,
                            controller: controller,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: nameController,
                                        onChanged: (value) =>
                                            Config.projectName = value,
                                        decoration: const InputDecoration(
                                          hintText: 'Name',
                                        ),
                                        autofocus: true,
                                      ),
                                      const SizedBox(height: 16.0),
                                      TextField(
                                        controller: organizationController,
                                        onChanged: (value) =>
                                            Config.orgName = value,
                                        decoration: const InputDecoration(
                                          hintText:
                                              'Organization (com.example)',
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      TextField(
                                        controller: descriptionController,
                                        onChanged: (value) =>
                                            Config.description = value,
                                        decoration: const InputDecoration(
                                          hintText: 'Description',
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }

                              return index % 2 == 0
                                  ? Container(
                                      color: Colors.redAccent,
                                      child: Center(
                                        child: Text(index.toString()),
                                      ),
                                    )
                                  : Container(
                                      color: Colors.yellowAccent,
                                      child: Center(
                                        child: Text(index.toString()),
                                      ),
                                    );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: const Text('Previous'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: const Text('Next'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
