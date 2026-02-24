import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const String nameRoute = 'ui_controls';

  const UiControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls + Tiles'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation {
  car,
  bus,
  train,
  plane,
}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile.adaptive(
          title: Text('Diseño adaptable'),
          subtitle: Text('Activa o desactiva el diseño adaptable'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        RadioListTile(
            value: Transportation.car,
            title: Text('Carro'),
            subtitle: Text('Transporte por carro'),
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() => selectedTransportation = Transportation.car),
          ),
        RadioListTile(
            title: Text('Bus'),
            subtitle: Text('Transporte por bus'),
            value: Transportation.bus,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() => selectedTransportation = Transportation.bus),
          ),
        RadioListTile(
            title: Text('Tren'),
            subtitle: Text('Transporte por tren'),  
            value: Transportation.train,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() => selectedTransportation = Transportation.train),
          ),
        RadioListTile(
            title: Text('Avión'),
            subtitle: Text('Transporte por avión'),
            value: Transportation.plane,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() => selectedTransportation = Transportation.plane),
          ),
      ],
    );
  }
}