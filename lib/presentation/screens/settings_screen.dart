import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_to_word/logic/cubit/converter_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('British English Counting'),
              BlocBuilder<ConverterCubit, ConverterState>(
                builder: (context, state) {
                  return Switch(
                    value: state.britishCounting,
                    onChanged: (value) => {
                      BlocProvider.of<ConverterCubit>(context)
                          .switchBritish(value)
                    },
                    activeTrackColor: Colors.lightBlue[200],
                    activeColor: Colors.blue[700],
                  );
                },
              )
            ],
          ),
        ));
  }
}
