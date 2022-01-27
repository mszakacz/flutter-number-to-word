import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_to_word/logic/converter.dart';
import 'package:flutter_number_to_word/logic/cubit/converter_cubit.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  FutureOr<void> onGoBack() {
    BlocProvider.of<ConverterCubit>(context).convert(_text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/settings')
                  .whenComplete(() => onGoBack());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          labelText: 'Number',
                          hintText: '1234',
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    key: const Key('converterScreen_go_iconButton'),
                    onPressed: () => {
                      BlocProvider.of<ConverterCubit>(context).convert(_text),
                    },
                    child: Text('Convert'),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            BlocBuilder<ConverterCubit, ConverterState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    '${state.outputStringNumber}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
