import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_to_word/word_converter/logic/cubit/converter_cubit.dart';
import 'package:flutter_number_to_word/word_converter/router/app_router.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConverterCubit>(
      create: (context) => ConverterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          fontFamily: 'Noto Sans',
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        onGenerateRoute: _appRouter.onGenerateRout,
      ),
    );
  }
}
