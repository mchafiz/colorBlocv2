import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_lighblue }

//state controler dan event controller sudah dibungkus package bloc
class ColorBloc extends Bloc<ColorEvent, Color> {
  //menset color awal
  Color _color = Colors.amber;

  ColorBloc(Color initialState) : super(initialState);

//hanya perlu membuat mapeventtostate yang mengembalikan Stream maka memerlukan async*
  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    //ifelse biasa beda format aja
    _color = (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
    //yield adalah perintah untuk memasukan data kedalam sistream / memasukan air (yield) ke selang (stream)
    yield _color;
  }
}
