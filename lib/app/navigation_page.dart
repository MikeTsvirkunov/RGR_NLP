import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/widgets_container.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = ContainerExtractor.extract(widgetsContainer, 'main_pages_list');
    return DefaultTabController(
      length: pages.length, 
      child: Scaffold(
        body: TabBarView(children: pages,),
        bottomNavigationBar: TabBar(
          indicator: const BoxDecoration(
            color: Colors.transparent
          ),
          tabs: ContainerExtractor.extract(widgetsContainer, 'main_tabs_list'),
        ),
      )
    );
  }
}
