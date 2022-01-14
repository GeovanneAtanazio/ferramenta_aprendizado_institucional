# Ferramenta de construção de manuais de aprendizado institucional 

Este é um projeto personalizado do GitBook-CLI e faz parte do Trabalho de Conclusão de Curso (TCC) de Geovanne Atanazio, seus contatos são: [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/fagnerpsantos/)](https://www.linkedin.com/in/geovanne-atanazio-42292a15a), [![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white&link=https://github.com/fagnerpsantos)](https://github.com/GeovanneAtanazio), [![Twitter Badge](https://img.shields.io/badge/-Twitter-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/fagnerpsantos)](https://twitter.com/Geovanne_S_A).

## O que é o GitBook-CLI

[ GitBook Command-Line Interface ](https://github.com/GitbookIO/gitbook) — também conhecido como GitBook-CLI ou, simplesmente, GitBook — é uma ferramenta de linha de comando utilizada para construir documentações de forma colaborativa e compartilhar seus conteúdos por meio de uma interface amigável.

O Gitbook-CLI funciona com o auxílio do *Distributed Version Control System* (*DVCS*) *[GitHub](https://github.com/)*/*[Git](https://git-scm.com/)* e da linguagem de marcação de texto [Markdown](https://www.markdownguide.org/getting-started/). O GitBook-CLI é baseada em [Node.js](https://nodejs.org/), uma plataforma para desenvolver aplicações *web* escaláveis e de alta performance, e está sob a [Licença Apache, Versão 2.0](https://www.apache.org/licenses/LICENSE-2.0).

> ### ⚠️ Aviso: 
> Até o momento de criação deste repositório, o GitBook-CLI parou de ser atualizado na versão 3.2.3. 
> A equipe do GitBook está focando seus esforços na plataforma [GitBook.com](https://www.gitbook.com/).
> Apesar disso, o GitBook-CLI continua sendo bastante utilizado por diferentes comunidades.

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



