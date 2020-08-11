import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._current);


  double get porcentaje => (this._songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  AnimationController _controller;

  set controller(AnimationController valor) {
    this._controller = valor;
  }

  AnimationController get controller => this._controller;

  bool get playing => this._playing;

  set playing(bool valor) {
    this._playing = valor;
    notifyListeners();
  }

  set songDuration(Duration value) {
    this._songDuration = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set current(Duration value) {
    this._current = value;
    notifyListeners();
  }

  Duration get current => _current;

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSecons = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSecons";
  }
}
