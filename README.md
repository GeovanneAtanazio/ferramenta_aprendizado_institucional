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

##### Criação de eBooks

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
##### Criação de eBooks

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



