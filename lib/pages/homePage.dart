import 'package:carros/widgets/carros_page.dart';
import 'package:flutter/material.dart';
import 'package:carros/widgets/drawer_list.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/utils/prefs.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }


  _initTabs() async {
    int index = await Prefs.getInt("tabIdx");

    _tabController = TabController(length: 3, vsync: this);
    setState(() {
      _tabController.index = index;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    title: Text('Carros'), 
    bottom: _tabController == null ? null : TabBar(
      controller: _tabController,
      tabs: [
      Tab(text: 'Clássicos',),
      Tab(text: 'Esportivos',),
      Tab(text: 'Luxo',),
    ]),
        ),
        drawer: DrawerList(),
        body:  _tabController == null ? null :  TabBarView(
    controller: _tabController,
    children: [
    CarrosPage(TipoCarro.classicos),
    CarrosPage(TipoCarro.esportivos),
    CarrosPage(TipoCarro.luxo),
        ]),
      );
  }
}