import 'package:admin_loja_virtual/blocs/orders_bloc.dart';
import 'package:admin_loja_virtual/blocs/user_bloc.dart';
import 'package:admin_loja_virtual/tabs/orders_tab.dart';
import 'package:admin_loja_virtual/tabs/users_tab.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(const HomeScreen());

/// This is the main application widget.
class HomeScreen extends StatelessWidget {
  const HomeScreen({key}) : super(key: key);

  static const String _title = 'Gerenciamento Loja';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  UserBloc _userBloc;
  OrdersBloc _ordersBloc;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    UsersTab(),
    OrdersTab(),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc();
    _ordersBloc = OrdersBloc();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 42, 38, 1.0),
      body: SafeArea(
        child: BlocProvider<UserBloc>(
          bloc: _userBloc,
          child: BlocProvider<OrdersBloc>(
            bloc: _ordersBloc,
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFloating(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(255, 199, 44, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Clientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Produtos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  // ignore: missing_return
  Widget _buildFloating() {
    switch(_selectedIndex){
      case 0:
        return null;
        break;
      case 1:
        return SpeedDial(
          child: Icon(Icons.sort),
          backgroundColor: Color.fromRGBO(255, 199, 44, 1.0),
          overlayOpacity: 0.4,
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(
              child: Icon(Icons.arrow_downward, color: Theme.of(context).primaryColor,),
              backgroundColor: Colors.black,
              label:  'Concluídos Abaixo',
              labelStyle: TextStyle(fontSize: 14),
              onTap: (){
                _ordersBloc.setOrderCriteria(SortCriteria.READY_LAST);
              }
            ),
            SpeedDialChild(
                child: Icon(Icons.arrow_upward, color: Theme.of(context).primaryColor,),
                backgroundColor: Colors.black,
                label:  'Concluídos Acima',
                labelStyle: TextStyle(fontSize: 14),
                onTap: (){
                  _ordersBloc.setOrderCriteria(SortCriteria.READY_FIRST);
                }
            )
          ],
        );
        break;
    }
  }
}
