import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_to_word/word_converter/logic/cubit/converter_cubit.dart';
import 'package:flutter/services.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
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
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings').whenComplete(
                    () => onGoBack(),
                  );
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                    child: const Text('Convert'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            BlocBuilder<ConverterCubit, ConverterState>(
              builder: (context, state) {
                return Visibility(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          state.outputStringNumber,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: state.outputStringNumber,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Text has been copied to clipboard.',
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  visible: state.visible,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
