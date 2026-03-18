class Usuario {
  String login;
  String senha;

  Usuario(this.login, this.senha);

  Usuario.convidado()
      : login = "Guest",
        senha = "123456";
}

void main() {
  Usuario convidado = Usuario.convidado();
  print(convidado.login);
  print(convidado.senha);
}