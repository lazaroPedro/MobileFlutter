void main() {
  String nome = "Acer Nitro 5";
  double preco = 3900.0;
  int quantidade = 10;
  bool disponivel = true;
  double imposto = 0.1;

  double valorTotalEstoque = preco * quantidade;
  double precoFinal = preco + (preco * imposto);
  bool verificacao = quantidade > 0 && preco < 100;

  print(valorTotalEstoque);
  print(precoFinal);
  print(verificacao);
}