# Ferramenta de construção de manuais de aprendizado institucional 

Este é um projeto personalizado do GitBook-CLI e faz parte do Trabalho de Conclusão de Curso (TCC) de Geovanne Atanazio, seus contatos são: [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/fagnerpsantos/)](https://www.linkedin.com/in/geovanne-atanazio-42292a15a), [![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white&link=https://github.com/fagnerpsantos)](https://github.com/GeovanneAtanazio), [![Twitter Badge](https://img.shields.io/badge/-Twitter-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/fagnerpsantos)](https://twitter.com/Geovanne_S_A).

## O que é o GitBook-CLI

[ GitBook Command-Line Interface ](https://github.com/GitbookIO/gitbook) — também conhecido como GitBook-CLI ou, simplesmente, GitBook — é uma ferramenta de linha de comando utilizada para construir documentações de forma colaborativa e compartilhar seus conteúdos por meio de uma interface amigável.

O Gitbook-CLI funciona com o auxílio do *Distributed Version Control System* (*DVCS*) *[GitHub](https://github.com/)*/*[Git](https://git-scm.com/)* e da linguagem de marcação de texto [Markdown](https://www.markdownguide.org/getting-started/). O GitBook-CLI é baseada em [Node.js](https://nodejs.org/), uma plataforma para desenvolver aplicações *web* escaláveis e de alta performance, e está sob a [Licença Apache, Versão 2.0](https://www.apache.org/licenses/LICENSE-2.0).

> ### ⚠️ Aviso: 
> Até o momento de criação deste repositório, o GitBook-CLI parou de ser atualizado na versão 3.2.3. 
> A equipe do GitBook está focando seus esforços na plataforma [GitBook.com](https://www.gitbook.com/).
> Apesar disso, o GitBook-CLI continua sendo bastante utilizado por diferentes comunidades.

## Como utilizar esta ferramenta

### O ambiente de desenvolvimento

Para utilizar este projeto é preciso criar um ambiente de desenvolvimento que tenha o Git e o GitBook-CLI instalados. O Git está disponível para os três principais sistemas operacionais utilizados em _desktops_ e _notebooks_ — GNU/Linux, Windows e MacOS. O tutorial de instalação para todos os sistemas operacionais compatíveis pode ser encontrado na página [https://git-scm.com/downloads](https://git-scm.com/downloads). 

Quanto a execução do GitBook-CLI, você não precisa se preocupar em instalá-lo. Está contido neste repositório os arquivos Docker necessários para executar o projeto. Caso prefira, é possível instalar o GitBook-CLI direto no Sistema Operacional (SO) utilizando o gerenciador de pacotes [NPM](https://docs.npmjs.com/about-npm).

#### Ambiente Docker

O Docker é uma plataforma aberta, criada com o objetivo de facilitar o desenvolvimento, a implantação e a execução de aplicações por meio de containers — ambiente isolado que executa o agrupamento de aplicações, bem como suas dependências, utilizando o *kernel* do SO do *host*. 

É possível instalar o Docker nos três principais sistemas operacionais utilizados em _desktops_ e _notebooks_ — GNU/Linux, Windows e MacOS. O tutorial de instalação para todos os sistemas operacionais compatíveis pode ser encontrado na página <https://docs.docker.com/get-started/#download-and-install-docker>.

O arquivo Docker necessário para a execução do container é o `Dockerfile`, sendo possível complementá-lo com o `docker-compose.yml`.

##### Utilização do `Dockerfile`

Trata-se do arquivo que contém todos os comandos e variáveis de ambiente que serão chamados por linha de comando para montar a imagem. Através dele já é possível rodar os comandos padrões do Docker e definir as configurações do container que será executado.

###### Utilizando comandos Docker em sua rotina de desenvolvimento

Para executar um container com a aplicação, siga os passos a seguir:

1. Na primeira vez que for executar a aplicação, é necessário construir a imagem — esse processo será necessário apenas uma vez. Execute o seguinte comando Docker:
	```
	docker build -t nome_imagem:tag .
	```
	O nome da imagem gerada (`nome_imagem`) e da versão da imagem (`tag`) devem ser informados pelo executor do comando.
2. Para executar a aplicação, deverá subir um container da imagem que criou. Para isso, basta executar o comando:
	```
	docker run -ti -p 4000:4000 -v diretorio_host:diretorio_container --name nome_container nome_imagem:tag 
	```
	O caminho para o diretório do projeto no host (`diretorio_host`), o caminho para o diretório do projeto no container (`diretorio_container`), o nome da imagem (`nome_imagem`), a versão da imagem (`tag`) e o nome do container (`nome_container`) devem ser informados pelo executor do comando.  
3. Quando quiser atualizar a aplicação de acordo com as mudanças que realizou, execute o comando:
	```
	docker restart -t 1 nome_container
	```
	O nome do container (`nome_container`) deve ser informado pelo executor do comando.  
4. Para desativar o container, será necessário executar o comando a seguir: 
	```
	docker stop nome_container
	```
	O nome do container (`nome_container`) deve ser informado pelo executor do comando.  

##### Utilização do `docker-compose.yml`

Trata-se do arquivo que define configurações a serem aplicadas ao container após ser iniciado, através de diversos atributos. Com ele configurado, é possível utilizar comandos do Docker Compose, que são equivalentes aos do Docker, porém menos verbosos — pois os argumentos necessários já são passados como atributos nesse arquivo.

###### Utilizando comandos Docker Compose em sua rotina de desenvolvimento 
Para executar um container com a aplicação, siga os passos a seguir:

1. Na primeira vez que for executar a aplicação, é necessário construir a imagem — esse processo será necessário apenas uma vez. Execute o seguinte comando Docker:
	```
	docker build -t nome_imagem:tag .
	```
	O nome da imagem gerada (`nome_imagem`) e da versão da imagem (`tag`) devem ser informados pelo executor do comando.
2. Para executar a aplicação, deverá subir um container da imagem que criou. Para isso, basta executar o comando:
	```
	docker-compose up
	```
3. Quando quiser atualizar a aplicação de acordo com as mudanças que realizou, execute o comando:
	```
	docker-compose restart -t 1
	```
4. Para desativar o container, será necessário executar o comando a seguir:
	```
	docker-compose down
	```

##### Espelhamento de arquivos

Para usar o Docker como ambiente de desenvolvimento, é importante saber que há um espelhamento entre os arquivos que estão no diretório do *host* e os que estão dentro do container em execução. Isso acontece graças ao _bind-mount_, que é a montagem do diretório do host no container. Dessa forma, independe alterar um arquivo no diretório do *host* ou do container, em ambos os lugares os arquivos serão iguais. Porém, é importante ressaltar que no presente momento o _bind-mount_ apenas funciona ao utilizar os comandos do Docker Compose.

##### Criação de eBooks 	<a id="pdfdocker"></a>

Com o GitBook-CLI também é possível gerar eBooks nos formatos PDF, Epub ou Mobi, bastando seguir os passos abaixo:

1. Abra um terminal do container com o comando:
   ```
    docker container attach nome_container
   ```
2. Existe um comando para geração de cada um dos eBook's suportados. Para gerá-los, basta informar o formato desejado e o nome do arquivo que será gerado.
	2.1.   Geração de PDF: 	
	```
	gitbook pdf ./ ./pages/public/ebook.pdf
	```
	2.2.   Geração de Epub:
	``` 
	gitbook epub ./ ./pages/public/ebook.epub 
	```	
	2.3.   Geração de Mobi:
	``` 
	gitbook mobi ./ ./pages/public/ebook.mobi
	``` 
Por conta do _bind-mount_ o eBook gerado dentro do container irá aparecer no diretório do *host*.

#### Ambiente NPM

Para instalar o GitBook-CLI diretamente na sua máquina, basta seguir os passos abaixo:
1. O Node.js, plataforma de desenvolvimento de aplicações web, e o NPM, gerenciador de pacotes para Node.js, são pré-requisitos para conseguir trabalhar com o  GitBook-CLI. Instale-os em sua máquina utilizando os respectivos links: [https://nodejs.org/](https://nodejs.org/), [https://docs.npmjs.com/downloading-and-installing-node-js-and-npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm).
2. Também é preciso instalar o GitBook-CLI. Para isso, utilize o comando:
	```
	npm install gitbook-cli -g
	```
3. Em sua máquina, dentro do diretório que contém os arquivos presentes neste repositório, é preciso instalar as dependências do projeto. Para isso, execute o comando:
	```
	gitbook install
	```
4. Agora é possível visualizar o manual localmente. Dentro do diretório que contém os arquivos presentes neste repositório, é possível inicializar um servidor local para o projeto por meio do comando:
	```
	gitbook serve
	```
##### Criação de eBooks <a id="pdfnpm"></a>

Com o GitBook-CLI também é possível gerar eBooks nos formatos PDF, Epub ou Mobi, bastando seguir os passos abaixo:
1. O [Calibre eBook Management](https://calibre-ebook.com/) é pré-requisito para conseguir gerar qualquer eBooks do GitBook-CLI. Para instalá-lo, é preciso: 
1.1 Instalar o Python3 e o PyQt5 utilizando o link: <https://pythonbasics.org/install-pyqt/>; 
1.2 Instalar o Calibre eBook Management em sua máquina utilizando o link: <https://calibre-ebook.com/download/>.
2. Existe um comando para geração de cada um dos eBook's suportados. Para gerá-los, basta informar o formato desejado e o nome do arquivo que será gerado.
    2.1.   Geração de PDF:
	```
	gitbook pdf ./ ./pages/public/ebook.pdf
	```
	2.2.   Geração de Epub:
	``` 
	gitbook epub ./ ./pages/public/ebook.epub 
	```	
	2.3.   Geração de Mobi:
	``` 
	gitbook mobi ./ ./pages/public/ebook.mobi
	```

### Configurações iniciais

As configurações do GitBook-CLI são definidas pelo arquivo `book.json`. Nele é possível configurar uma série de atributos da ferramenta. A seguir mostraremos alguns deles, para mais informações acesse <https://github.com/GitbookIO/gitbook/tree/master/docs>. 

#### root
Define o diretório padrão, nele estarão todos os arquivos do projeto, exceto o `book.json`. Caso esse atributo não seja definido, o diretório `./`  será utilizado por padrão.  
- Exemplo: 
	```
	"root": "./pages"
	```
#### structure
Define o nome dos arquivos considerados estruturais. Neste projeto, a estrutura foi definida da seguinte forma:
| Atributo | Descrição |
| :--------: | :-----------: |
|`readme`|Página inicial do projeto, obrigatório para o funcionamento do GitBook-CLI. Caso esse atributo não seja definido, o arquivo com o nome `README.md` será utilizado por padrão. Caso ele não esteja definido e não exista o arquivo `README.md`, o projeto não será executado.|
|`summary`|Arquivo responsável por ordenar as páginas do projeto, obrigatório para o funcionamento do GitBook-CLI. Caso esse atributo não seja definido, o arquivo com o nome `SUMMARY.md` será utilizado por padrão. Caso ele não esteja definido e não exista o arquivo `SUMMARY.md`, o projeto não será executado.|
- Exemplo:
	```
	"structure": {
		"readme": "apresentacao.md",
		"summary": "sumario.md"
	}
	```

#### language
Define o idioma do projeto.
- Exemplo: 
	```
	"language": "pt"
	```

#### title
Define o título do projeto. 
- Exemplo: 
	```
	"title": "Ferramenta de Aprendizado Institucional"
	```

#### description
Define uma breve descrição do projeto.
- Exemplo: 
	```
  	"description": "Projeto base da ferramenta de aprendizado institucional"
	```

#### cover
Define a capa dos eBooks gerados. Recomenda-se utilizar um arquivo no formato JPEG com a resolução 1800x2360.
- Exemplo: 
	```
	"cover": "public/cover.jpg"
	```
#### variables
Define variáveis globais que podem ser chamadas nos arquivos Markdown.
- Exemplo: 
	- Instanciação no arquivo `book.json`
	```
	"variables": {
    	"theme": "ferramenta de aprendizado institucional"
    }
	```
	- Chamada da variável em arquivo Markdown
	```
	 Ele condensa o conhecimento acumulado a respeito de {{  book.theme }} e o disponibiliza para todos os membros da organização. 
	```
	- Resultado final
	 ```
	 Ele condensa o conhecimento acumulado a respeito de ferramenta de aprendizado institucional e o disponibiliza para todos os membros da organização.
	 ```

#### plugins
Define a lista de plugins — extensões utilizadas para adicionar novas funcionalidades ao projeto — que serão utilizados ou desativados. Por padrão 6 plugins já vem instalados com o GitBook-CLI, são eles: `"search"`, `"lunr"`, `"highlight"`, `"sharing"`, `"fontsettings"`, `"livereload"`.
| Plugin | Descrição |
| :--------: | :-----------:|
|`"search"`|Adiciona uma barra de pesquisa interativa.|
|`"lunr"`|Fornece um backend para o plugin `"search"`.|
|`"highlight"`|Adiciona destaque em blocos de código.|
|`"sharing"`|Adiciona botões de compartilhamento na barra de ferramentas do site GitBook-CLI para compartilhar livros nas redes sociais.|
|`"fontsettings"`|Disponibiliza estilização da fonte e do tema do GitBook-CLI.|
|`"livereload"`|Recarrega o GitBook-CLI em tempo real.|

Alguns plugins padrões precisaram ser desativados para possibilitar o uso de outros similares, mas com novas funcionalidades. Neste projeto, os seguintes plugins precisaram ser desativados:

| Plugin Nativo | Plugin Substituto |
| :--------: |:-----------: |
|`"lunr"`|`"search-pro"`|
|`"search"`|`"search-pro"`|
|`"sharing"`|`"sharing-plus"`|

Além dos citados acima foram utilizados os seguintes plugins:
| Plugin | Descrição |
| :--------: | :-----------: |
|`"anchor-navigation-ex"`|Adiciona âncoras de navegação em cada um dos capítulos.|
|`"code"`|Numera as linhas dos blocos de código e adiciona o botão "Copiar Código".|
|`"download-pdf-link"`|Adiciona um *link* em cada página para baixar PDF.|
|`"github"`|Adiciona o ícone do github no canto superior direito.|
|`"search-pro"`|Fornece pesquisa em qualquer caractere (utf-8) e destaca o resultado da busca no GitBook-CLI.|
|`"mermaid-gb3"`|Renderiza código Mermaid — útil para criar e visualizar diagramas usando texto e código —  detectados no markdown do livro. O plugin não funciona quando gerado o PDF, seja no [Docker](<#pdfdocker>) ou no ambiente [NPM](<#pdfnpm>).|
|`"sharing-plus"`|Adiciona botões de compartilhamento na barra de ferramentas do site GitBook para compartilhar livros nas redes sociais, sendo seu diferencial o maior número de redes quando comparado ao seu antecessor, o plugin `"sharing"`.|
|`"splitter"`|Torna a largura da barra lateral ajustável.|
|`"tbfed-pagefooter"`|Adiciona um rodapé a página.|

Para instalar novos plugins, basta adicionar seus nomes dentro da lista de plugins e executar o comando:
 
 ```
 gitbook install
 ```

### pluginsConfig

Define a configuração do plugin quando for necessário — não são todos os plugins que necessitam dessa configuração adicional. O bloco de configuração começa com `"pluginsConfig": { }` onde dentro das chaves se inicia um novo bloco, esse agora com o nome do plugin, com uma estrutura de chave e valor para definir os seus parâmetros.

- Exemplo:
	```
	"pluginsConfig": {
		"download-pdf-link": {
			"base": "https://github.com/GeovanneAtanazio/ferramenta_aprendizado_institucional/blob/main/pages/public/ebook.pdf"
		},
		"fontsettings": {
			"theme": "sepia"
		},
		"sharing": {
			"douban":false,
			"facebook":false,
			"google":false,
			"line":false,
			"qq":false,
			"qzone":false,
			"weibo":false,
			"whatsapp":false,
			"all": ["twitter","linkedin","whatsapp","facebook"]
		},
		"github":{
			"url": "https://github.com/GeovanneAtanazio/ferramenta_aprendizado_institucional"
		},
		"tbfed-pagefooter": {
			"copyright":"Copyright &copy 2022 Geovanne Atanazio",
			"modify_label": "Arquivo revisado pela última vez em",
			"modify_format": "DD/MM/YYYY"
		}
  	}
	```


#### download-pdf-link: 
A chave ``"base"`` define o link para o download do pdf.

- Exemplo:
	```
		"download-pdf-link": {
			"base": "https://github.com/GeovanneAtanazio/ferramenta_aprendizado_institucional/blob/main/pages/public/ebook.pdf"
		}
	```

#### fontsettings: 
A chave ``"theme"`` define o tema padrão do gitbook caso o usuário não tenha selecionado anteriormente.
- Exemplo:
	```
		"fontsettings": {
			"theme": "sepia"
		}
	```

#### sharing: 

A chave ``"nome_da_rede_social"`` pode assumir ``"true"`` para ativo e assim será exibida na barra de ferramentas do site e ``"false"`` para desativado quando não precisar ser exibida. Já para a chave ```"all"``` deve ser usado um array com todas as redes que serão exibidas ao clicar no botão *share* localizado na barra de ferramentas.

- Exemplo:
	```
		"sharing": {
			"douban":false,
			"facebook":false,
			"google":false,
			"line":false,
			"qq":false,
			"qzone":false,
			"weibo":false,
			"whatsapp":false,
			"all": ["twitter","linkedin","whatsapp","facebook"]
    	}
	```

#### github: 
A chave ``"url"`` define um link para ser adicionado ao ícone do GitHub na barra de ferramentas do site GitBook.
- Exemplo:
	```
		"github":{
      		"url": "https://github.com/GeovanneAtanazio/ferramenta_aprendizado_institucional"
    	}
	```

#### tbfed-pagefooter:
 A chave ``"copyright"`` define a mensagem de Copyright que será exibida no rodapé da página. As chaves ``"modify_label"`` e  ``"modify_format"`` definem o texto e a data com a última revisão do arquivo também a ser exibida no rodapé da página.

 - Exemplo:
	```
		"tbfed-pagefooter": {
			"copyright":"Copyright &copy 2022 Geovanne Atanazio",
			"modify_label": "Arquivo revisado pela última vez em",
			"modify_format": "DD/MM/YYYY"
    	}
	```

### Produzindo capítulos 

Cada capítulo deverá ser escrito em um arquivo Markdown — arquivos Markdown são definidos pela extensão `.md` — salvos no diretório `./pages`, como foi definido no arquivo ``book.json``. Para que o GitBook-CLI consiga enxergar o capítulo criado, é preciso adicioná-lo ao arquivo responsável pelo sumário, usando a seguinte notação:
```
# Summary 

* [Nome do Manual](apresentacao.md)
* [Introdução](introducao.md)
```
 O texto informado dentro dos colchetes é a forma com que o capítulo será referenciado no menu do GitBook-CLI. Já o texto contido nos parenteses é o nome do arquivo referente ao capítulo. Neste projeto existem dois capítulos criados previamente: `apresentacao.md` e `introducao.md`. O primeiro, tem o objetivo de explicar de forma rápida a existência do manual criado. Já o segundo, guarda o conteúdo que introduz o tema central do manual criado — recomenda-se, que novos capítulos sejam criados somente após esses.  

Seja para uso de algum recurso do GitBook-CLI ou para facilitar a compreensão do assunto abordado por determinado capítulo, é interessante ter um lugar que permita salvar arquivos, para isso existe o diretório `./pages/public/`. Dentro dele, é possível criar sub-diretórios que ajudem na organização dos arquivos utilizados pelo projeto.

#### Escrevendo com Markdown

Markdown é uma linguagem de marcação usada para padronizar e facilitar formatação de textos na web. Para utilizar o GitBook-CLI, mais especificamente para escrever capítulos, é importante saber trabalhar com Markdown. A seguir, serão apresentados comandos e alguns exemplos de uso.

##### Titulação 
A titulação em Markdown é graduada em 6 níveis e é feita utilizando o símbolo de cerquilha `#` a frente do texto e com espaçamento; a cada cerquilha adicionada o texto varia do maior tamanho, apenas uma cerquilha, até o menor, com 6 cerquilhas. Essas graduações de títulos geralmente são utilizadas para gerar seções e subseções.

- Exemplo da escrita: 
	```
	# Título 1
    ## Título 2
    ### Título 3
    #### Título 4
    ##### Título 5
    ###### Título 6
	```
- Exemplo da saída: 
    # Título 1
    ## Título 2
    ### Título 3
    #### Título 4
    ##### Título 5
    ###### Título 6

&nbsp;    

<a id="enfase"></a>
##### Ênfase (Negrito ou Itálico)


Para adicionar ênfase ao conteúdo que será escrito, usa-se o asterisco `*` ou traço-baixo (underline) `_`:

- Exemplo da escrita: 
	```
	*Usa-se apenas um asterisco para itálico*
    _Usa-se apenas um underline para itálico_

    **Usa-se dois asteriscos para negrito**
    __Usa-se dois underlines para negrito__
	```
- Exemplo da saída: 

    *Usa-se apenas um asterisco para itálico*
    _Usa-se apenas um underline para itálico_

&nbsp;     

     **Usa-se dois asteriscos para negrito**
    __Usa-se dois underlines para negrito__

&nbsp;    

##### Links 

Existem duas formas de inserir link em Markdown, através de um link direto ou usando um texto-âncora:
 
###### Link direto
Envolva o endereço da web entre `<` e `>`. O endereço ficará visível e será clicável pelo usuário.

- Exemplo da escrita: 
	```
	Este é um link direto <https://pipz.com/>.
	```
- Exemplo da saída: 

    Este é um link direto <https://pipz.com/>. 

&nbsp;

###### Texto-âncora
 Utilize os caracteres `[]()`, adicionando entre chaves o texto que você quer que apareça, e entre os parênteses, o endereço de destino.

- Exemplo da escrita: 
	```
	Este é um [link em formato de texto](https://exemplo.com/).
	```
- Exemplo da saída: 
    Este é um [link em formato de texto](https://exemplo.com/).

&nbsp;  

###### Referência cruzada (âncora nomeada)

Trata-se de outra forma de texto âncora, utilizada para fazer referência a outros elementos do próprio arquivo Markdown. Para isso, basta inserir uma tag `<a>` com o id para identificar aquela seção e então usá-lo entre os parenteses como "endereço interno de destino".

- Exemplo da escrita: 
  Ao utilizar a linha de código abaixo  (_Escrita da âncora_) próximo do título da Seção "_Ênfase_", podemos então usar o seu id entre `<` e `>` (_Chamada_) para navegar até ela.
  

  ###### _Escrita da âncora_
	```
    <a id="enfase"></a>
	```
    ###### _Chamada_
    ```
    Este é uma [referência cruzada que leva para a seção ênfase](<#enfase>).
	```

- Exemplo da saída: 

  Este é uma [referência cruzada que leva para a seção ênfase](<#enfase>).
##### Listas de itens

No Markdown existem dois tipos de listas, as não ordenadas e as ordenadas.

###### Listas não ordenadas

Para listas não ordenadas, utilize um asterisco `*` ou `-` na frente do item da lista. Nas listas em Markdown a indentação do item gera subitens.
- Exemplo da escrita:
	```
    * Item 1
    * Item 2
    	* Item 3	
	* Item 4
	```
- Exemplo da saída: 
  
    * Item 1
    * Item 2
    	* Item 3	
	* Item 4
  
###### Listas ordenadas

Para listas ordenadas, utilize o número do item seguido de ponto `.`. Nas listas em Markdown a indentação do item gera subitens  :

- Exemplo da escrita:

    ```
    1. Item 1
    2. Item 2
    3. Item 3
    4. Item 4
    ```
- Exemplo da saída: 
  
  1. Item 1 
  2. Item 2
  3. Item 3    
  4. Item 4
   
##### Imagens

O código para inserir uma imagem no conteúdo é semelhante ao código de inserir links-âncora, adicionando um ponto de exclamação `!` no início do código.


- Exemplo da escrita:
   
    ```
      ![titulo_da_imagem](https://dtdsgp.com/wp-content/uploads/2020/05/news1.png)
    ```

- Exemplo da saída: 
  
    ![Esta é uma imagem inserida a partir do link](https://dtdsgp.com/wp-content/uploads/2020/05/news1.png)

 ##### Citação (Quote)

 Para transformar um texto em uma citação ou comentário, semelhante ao código HTML `<blockquote>`, utilize o sinal `>` no início da linha que será formatada.

 - Exemplo da escrita:

    ```
    >Este é um *blockquote*. O sinal usado abre e fecha este código no HTML. 
    >Para adicionar mais uma linha à citação, basta teclar Enter para um novo
    >código sinal. Isso gerará um novo parágrafo dentro do *blockquote*.
    >Códigos de **negrito**, _itálico_ e <https://links.com> funcionam aqui.    
    ```
- Exemplo da saída: 
    >Este é um *blockquote*. O sinal usado abre e fecha este código no HTML. 
    >Para adicionar mais uma linha à citação, basta teclar Enter para um novo
    >código sinal. Isso gerará um novo parágrafo dentro do *blockquote*.
    >Códigos de **negrito**, _itálico_ e <https://links.com> funcionam aqui.  

##### Código (Code Highlight)

Há dois modos de adicionar trechos de código ao Markdown, por código em linha ou múltiplas linhas de código.

###### *Código em linha (inline)* 
Adicione um acento grave `ˋ` no início e no final do código.

- Exemplo da escrita: 
   	```
	Esta é uma linha que contém um `código`.
	```
- Exemplo da saída: 
Esta é uma linha que contém um `código`.

 &nbsp;

###### *Múltiplas linhas de código*
Envolva as linhas de código com três acentos graves ``ˋˋˋ`` ou três tils ``~~~``.


 - Exemplo da escrita:

 	```
		```
		Esta é uma linha de código, códigos de **negrito**, _itálico_ e <https://links.com> não funcionam aqui.  
		```
	```
	
    
- Exemplo da saída: 
  
    ```
    	Esta é uma linha de código, códigos de **negrito**, _itálico_ e <https://links.com> não funcionam aqui.
    ```

##### Salto de linha

Para gerar uma quebra de linha no documento existem algumas alternativas, uma delas que funciona muito bem tanto para o site do GitBook como para a geração do PDF é demonstrada a seguir.

- Exemplo da escrita:
  
	```
	O Lorem Ipsum é um texto modelo da indústria tipográfica e de impressão.
    
	&nbsp; 

	O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500.
	```

- Exemplo da saída:
	
	O Lorem Ipsum é um texto modelo da indústria tipográfica e de impressão.

    &nbsp; 

	O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500.


##### Tabela

Para criar tabelas utiliza-se ``|`` para delimitar as colunas e o hífen ``-`` na segunda linha para indicar que a primeira linha contém os títulos das colunas.
 - Exemplo da escrita:
    ```
    Exemplo   | Valor do exemplo
    --------- | ------
    Exemplo 1 | R$ 10
    Exemplo 2 | R$ 8
    Exemplo 3 | R$ 7
    Exemplo 4 | R$ 8
    ```
 - Exemplo da saída: 

    Exemplo   | Valor do exemplo
    --------- | ------
    Exemplo 1 | R$ 10
    Exemplo 2 | R$ 8
    Exemplo 3 | R$ 7
    Exemplo 4 | R$ 8

Para especificar o tipo de alinhamento que deseja ter nas tabelas, utilize `:` ao lado do campo horizontal de hifens `---`, na segunda linha da sua tabela. Veja abaixo:

###### *Alinhado à esquerda*:

 Usar `:` no lado esquerdo (alinhamento padrão).
  - Exemplo da escrita:
    ```
    | Alinhado à esquerda |
    | :---------- |
    | Valor |
    ```
 - Exemplo da saída: 
	| Alinhado à esquerda |
	| :---------- |
	| Valor |


###### *Alinhado à direita*: 
Usar `:` no lado direito.
 
 - Exemplo da escrita:
    ```
    | Alinhado à direita |
    | -------: |
    | Valor |
    ```
 - Exemplo da saída: 

    | Alinhado à direita |
    | -------: |
    | Valor |

###### *Centralizado*: 
Usar `:` dos dois lados.

 - Exemplo da escrita:
    ```
    | Centralizado | 
    | :------: |
    | Valor |
    ```
 - Exemplo da saída: 
    | Centralizado | 
    | :------: |
    | Valor |

### Regras para produção de manuais

Para conseguir um bom uso desta ferramenta, algumas regras foram criadas, veja:
- Todo projeto criado a partir desse deve estar salvo em algum *Version Control System* (*VCS*);
- Os capítulos usados no projeto deverão ser salvos no diretório `./pages/public/`;
- Imagens ou outros arquivos usados no projeto deverão ser salvos no diretório `./pages/public/`;
- Cada capítulo adicionado deve ser referido no arquivo responsável pelo `summary`;
- O arquivo responsável pelo `readme` deve ser o `apresentacao.md`;
- Todo projeto criado a partir desse deve ter os parâmetros do atributo `"title"`, `"cover"`,`"description"` do arquivo `book.json` readequados de acordo com a necessidade;
- O link para o PDF do projeto deve ser passado como parâmetro do atributo `"base"` do arquivo `book.json`;
- O link para o repositório do projeto deve ser passado como parâmetro do atributo `"url"` do arquivo `book.json`;
- Para editar este repositório ou algum projeto derivado dele é preciso:
	- Criar uma issue;
	- Criar uma branch do tipo `feature/`;
	- Efetuar o commit das alterações realizadas para o repositório principal;
	- Criar um Pull Request (PR) para a branch `main` do repositório original;
	- [Publicar as alterações feitas](#publicacao_do_manual).
- Para manter um fork sincronizado com o repositório original, execute os comandos:
	```
	git pull upstream main
	git push origin main
	```
	
### Publicação do manual 
<a id="publicacao_do_manual"></a>

Para criar um página estática para ser usada em um ambiente de produção, basta utilizar o comando:

```
 gitbook build
```

Outra forma de publicar o projeto é utilizando o GitHub como servidor da página. Para isso, é preciso seguir a seguinte sequencia de passos:

1. Certifique-se que o projeto está hospedado em um repositório publico;
2. Crie uma nova *branch* chamaga `gh-pages` contendo apenas o arquivo `README.md`;
3. Dentro do repositório, no GitHub, entre na aba `Settings`. Em seguida selecione a opção `pages`;
4. Em `Source` selecione a branch `gh-pages` e o diretório `/(root)`, Com isso o GitHub automaticamente irá criar um link de acesso ao seu projeto do GitBook-CLI;
5. Para publicar uma nova versão do GitBook-CLI, basta executar o arquivo [
publish.sh](publish.sh) com permissões de administrador. Nele, encontra-se um *sript* que irá publicar o projeto na *branch* `gh-pages`, que será utilizada pelo link gerado na etapa 4. 

## Fontes

- <https://github.com/GitbookIO/gitbook/>. Acesso em: jan. 2022.
- <https://www.gitbook.com/>. Acesso em: jan. 2022.
- <https://github.com/ftslorgbr/book>. Acesso em: jan. 2022.
- <https://arctype.com/blog/gitbook-technical-documentation-guide/>. Acesso em: jan. 2022.
- <https://nodejs.org/>. Acesso em: jan. 2022.
- <https://www.apache.org/licenses/LICENSE-2.0>. Acesso em: jan. 2022.
- <https://www.markdownguide.org/getting-started/>. Acesso em: jan. 2022.
- <https://github.com/>. Acesso em: jan. 2022.
- <https://git-scm.com/>. Acesso em: jan. 2022.
- <https://calibre-ebook.com/>. Acesso em: jan. 2022.
- <https://medium.com/@richdayandnight/simple-tutorial-on-hosting-your-gitbook-documentation-on-github-pages-bonus-with-gitbook-editor-f27f60d5d408>. Acesso em: jan. 2022.
- <https://developpaper.com/gitbook-introductory-tutorial-using-gitbook-cli-to-develop-e-books/>. Acesso em: jan. 2022.
- <https://www.programmersought.com/article/7860529648/>. Acesso em: jan. 2022.
- <https://docs.pipz.com/central-de-ajuda/learning-center/guia-basico-de-markdown#open>. Acesso em: jan. 2022.
- <https://github.com/badtuxx/DescomplicandoDocker>. Acesso em: jan. 2022.
- <https://docs.docker.com/>. Acesso em: jan. 2022.