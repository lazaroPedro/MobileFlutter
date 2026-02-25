class ControleRemoto {
  int _volume = 0;

  void aumentar() {
    if (_volume < 100) {
      _volume++;
    }
  }

  void diminuir() {
    if (_volume > 0) {
      _volume--;
    }
  }

  int get volume => _volume;
}

void main() {
  ControleRemoto controle = ControleRemoto();

  controle.aumentar();
  controle.aumentar();
  controle.diminuir();

  print(controle.volume);
}