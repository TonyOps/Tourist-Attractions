# Pontos Turísticos de cada localidade.

EM DESENVOLVIMENTO.

## Getting Started

Este projeto tem como objetivo mostrar os pontos turísticos e memoráveis de cada local onde o usuário está, com base em sua geolocalização. Ele fornecerá informações como a data de criação, anotações e uma breve descrição, além de um campo de mensagem onde o usuário pode compartilhar cada experiência individualmente com outros usuários.

Passo 1: Configuração do Firebase

    Acesse o Console do Firebase (https://console.firebase.google.com/) e crie um novo projeto.
    Dentro do projeto, vá para a seção "Configurações do projeto" e adicione um aplicativo Flutter.
    Siga as instruções para baixar o arquivo google-services.json, que contém as configurações do Firebase.

Passo 2: Configuração do Flutter

    No diretório do seu projeto Flutter, adicione o arquivo google-services.json baixado na etapa anterior à pasta android/app.
    Abra o arquivo android/build.gradle e adicione a seguinte dependência dentro de dependencies:

groovy

classpath 'com.google.gms:google-services:4.3.10'

    Abra o arquivo android/app/build.gradle e adicione a seguinte linha no final:

groovy

apply plugin: 'com.google.gms.google-services'

    No diretório do seu projeto Flutter, abra o arquivo pubspec.yaml e adicione as seguintes dependências:

yaml

dependencies:
  flutter:
    sdk: flutter
  firebase_auth: ^0.16.0
  cloud_firestore: ^0.13.0

    Execute o comando flutter pub get no terminal para baixar as dependências.

Passo 3: Configuração do código Flutter

    Importe as seguintes bibliotecas no arquivo Dart que deseja usar o Firebase:

dart

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

    Inicialize o Firebase adicionando o seguinte código no método main():

dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

<img src="https://media.discordapp.net/attachments/1046815809227468832/1046816343929913444/Captura_de_Tela_2022-11-28_as_10.52.42.png?width=781&height=439">
<br>
<img src="https://media.discordapp.net/attachments/1046815809227468832/1046816315983278100/Captura_de_Tela_2022-11-28_as_10.52.29.png?width=781&height=439">
<br>
<img src="https://media.discordapp.net/attachments/1046815809227468832/1046816506463408188/1669650580117.jpg?width=203&height=439">
<br> 
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
