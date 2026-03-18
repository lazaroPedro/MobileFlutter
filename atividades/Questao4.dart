class Usuario {
  String login;
  String senha;

  Usuario(this.login, this.senha);
}

void main() {
  Usuario user1 = Usuario("bill", "1234");
  Usuario user2 = Usuario("mr bill", "abcd");

  print(user1.login);
  print(user2.login);
}