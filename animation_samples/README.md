# animation_samples

Flutter Animation Samples.

## Linear Animation

<img src="https://raw.githubusercontent.com/CaioAFA/flutter-public-samples/master/animation_samples/images/animations_preview/linear-animation.gif" width="200" height="400" />

## Ping Pong Animation

<img src="https://raw.githubusercontent.com/CaioAFA/flutter-public-samples/master/animation_samples/images/animations_preview/ping-pong-animation.gif" width="200" height="400" />

## Curve Animation

<img src="https://raw.githubusercontent.com/CaioAFA/flutter-public-samples/master/animation_samples/images/animations_preview/curve-animation.gif" width="200" height="400" />

## Hero Animation

<img src="https://raw.githubusercontent.com/CaioAFA/flutter-public-samples/master/animation_samples/images/animations_preview/hero-animation.gif" width="200" height="400" />

## Considerações e Observações

- É possível criar uma classe com animações facilmente através do atalho stanim.

- A animação deve estar dentro de um Widget AnimatedBuilder (exceto animações Hero)!

- Toda animação deve ser vinculada a um AnimationController.

- É possível ter mais de uma animação vinculada a um AnimationController, inclusive sendo executada ao mesmo tempo.

- Quando não passamos valores de início e fim para uma animação, ela começa com valor 0 e termina com valor 1.

- É possível acessar o estado da animação. Por exemplo, quando um Container possuir tamanho menor que 600 durante alguma animação, é possível realizar algo.

- É possível debugar animações fazendo com que elas passem mais devagar.

- É possível fazer com que alguma animação seja iniciada no meio de outra e termine inclusive antes de outra. Podemos definir intervalos para início e fim.

- Podemos criar animações com curvas ao invés de lineares. Isso fará com que a animação, por exemplo, comece rápido e termine devagar. Para mais informações sobre as curvas disponíveis, consulte esse link:
https://api.flutter.dev/flutter/animation/Curves-class.html

- Cuidado com curvas que ultrapassem o valor de 1.0! Isso pode gerar alguns problemas quando, por exemplo, estamos animando a opacidade de algum Widget (que vai no máximo até 1.0). Para resolver isso, utilize a função .clamp(), onde passamos o menor e o maior valor possível.

- Sempre dê .dispose() na animação para liberar recursos!

- Para animações que cobrem a tela inteira, coloque ela dentro do Widget IgnorePointer! Dessa forma, mesmo que a animação cubra a tela, os toque nela serão ignorados e ainda será possível manusear o App.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
