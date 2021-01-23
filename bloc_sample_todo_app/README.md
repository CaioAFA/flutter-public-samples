# bloc_sample_todo_app

Aplicação de Exemplo Utilizando BLoC.

# Requisitos
- Conhecer o funcionamento de Streams.

# Considerações Sobre O BLoC Pattern
- Separe toda a lógica de negócio da Interface: seus códigos devem apenas chamar as funções definidas
no BLoC.

- Lembre-se:
    - **sink** => entrada da Stream.
    - **stream** => saída da Stream.

- Não crie Widgets Statefull! Não é necessário: **crie apenas Stateless**.

- Recuperamos os dados vindos das Streams pelo Widget StreamBuilder!

- Todo dado a ser compartilhado na aplicação deve ter sua própria Stream.
Além disso, é necessário expor sua saída através de um método de Get.

# Vantagens do BLoC Pattern
- Não é necessário utilizar o setState, logo não é necessário redesenhar toda a tela. Apenas o que é
alterado é redesenhado!

# Observações
- A Stream do RxDart **BehaviorSubject** é um tipo especial: ela **armazena o último dado enviado pela Stream**.
Dessa forma, quando um Widget é renderizado posteriormente ao envio do dado, ele **não perde informação**.
Isso é muito útil **quando algum dado é enviado à alguma Stream logo no início do App**, antes dos Widgets
serem renderizados. Quando eles forem desenhados, receberão o último dado enviado!

# Plugins Utilizados
- **Shared Preferences**: utilizado para persistir os dados.

- **Bloc Pattern**: utilizado para a implementação do BLoC Pattern.

- **RxDart**: implementa tipos especiais de Stream.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
