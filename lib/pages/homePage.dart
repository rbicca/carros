import 'package:flutter/material.dart';
import 'package:carros/widgets/drawer_list.dart';
import 'package:carros/widgets/carros_listivew.dart';
import 'package:carros/services/carros_api.dart';
import 'package:carros/utils/prefs.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  _initTabs() async {
    int tabIdx = await Prefs.getInt('tabIdx');
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = tabIdx;
    setState(() {
      _tabController.index = tabIdx;
    });
    _tabController.addListener((){
      Prefs.setInt('tabIdx', _tabController.index);
    });

  }

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'), 
        bottom: TabBar(
          controller: _tabController,
          tabs: [
          Tab(text: 'Clássicos',),
          Tab(text: 'Esportivos',),
          Tab(text: 'Luxo',),
        ]),
      ),
      drawer: DrawerList(),
      body: TabBarView(
        controller: _tabController,
        children: [
        CarrosListView(TipoCarro.classicos),
        CarrosListView(TipoCarro.esportivos),
        CarrosListView(TipoCarro.luxo),
      ]),
    );
  }
}