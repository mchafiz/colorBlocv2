import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc.dart';

void main() {
  runApp(MyApp());
}

//kenapa pake stateless karena sudah memakai BlocProvider
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //BlocProvider ini bertanggung jawab masalah dispose apabila bloc sudah tidak dipakai
        //kalau pake blocprovider tidak perlu pakai dispose lagi untuk meringankan memori
        home: BlocProvider<ColorBloc>(
      create: (context) => ColorBloc(Colors.amber),
      child: MainPage(),
    ));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.add(ColorEvent.to_lighblue);
            },
            backgroundColor: Colors.lightBlue,
          )
        ],
      ),
      appBar: AppBar(title: Text("Bloc dengan package/library")),
      body: Center(
          //buat masang state ada parameter bloc nya sama state nya
          child: BlocBuilder<ColorBloc, Color>(
        //currentcolor itu color yang udh di set awal
        builder: (context, currentColor) => AnimatedContainer(
          width: 100,
          height: 100,
          color: currentColor,
          duration: Duration(milliseconds: 500),
        ),
      )),
    );
  }
}
