# Lista de Tarefas (To-Do List)

## Descrição

Este é um projeto do modulo 4 - "Formulário de navegação" da Growdev, um aplicativo mobile de Lista de Tarefas desenvolvido com Flutter, permitindo aos usuários gerenciar suas tarefas diárias de forma eficiente. O aplicativo oferece uma interface intuitiva para adicionar, visualizar, editar e excluir tarefas.

## Funcionalidades

*   Adicionar novas tarefas com título e descrição.
*   Visualizar todas as tarefas em uma lista organizada.
*   Marcar tarefas como concluídas.
*   Editar detalhes de tarefas existentes.
*   Excluir tarefas.

## Tecnologias Utilizadas

*   **Flutter**: Framework de UI para construir aplicativos compilados nativamente para celular, web e desktop a partir de uma única base de código.
*   **Dart**: Linguagem de programação utilizada pelo Flutter.
*   **intl**: Pacote para internacionalização e localização, utilizado para formatação de datas.

## Estrutura do Projeto

O projeto segue uma estrutura modular para facilitar a organização e manutenção do código:

```
lib/
├── models/             # Definições dos modelos de dados (ex: Task)
├── screens/            # Telas principais do aplicativo (ex: HomeScreen, TaskDetailScreen)
├── widgets/            # Componentes de UI reutilizáveis (ex: AddTaskWidget)
├── main.dart           # Ponto de entrada do aplicativo
└── my_app.dart         # Configuração principal do aplicativo ( MaterialApp, temas, rotas)
```

## Como Rodar o Projeto

Para configurar e executar este projeto localmente, siga os passos abaixo:

### Pré-requisitos

Certifique-se de ter o Flutter SDK instalado em sua máquina. Você pode seguir as instruções de instalação na [documentação oficial do Flutter](https://flutter.dev/docs/get-started/install).

### Instalação

1.  Clone o repositório:
    ```bash
    git clone https://github.com/geovannifranca/todo_list.git
    ```
2.  Navegue até o diretório do projeto:
    ```bash
    cd todo_list
    ```
3.  Obtenha as dependências do Flutter:
    ```bash
    flutter pub get
    ```

### Execução

1.  Conecte um dispositivo Android ou iOS, ou inicie um emulador.
2.  Execute o aplicativo:
    ```bash
    flutter run
    ```


## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Autor

[Geovanni França](https://github.com/geovannifranca)

