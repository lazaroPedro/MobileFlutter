void exibirDetalhes(String nome, {required double preco, double desconto = 0}) {
  double precoFinal = preco - desconto;
  print("Produto: $nome");
  print("Preço: $preco");
  print("Desconto: $desconto");
  print("Preço Final: $precoFinal");
}

void main() {
  exibirDetalhes("Notebook", preco: 3500.0, desconto: 200.0);
}