<h2 align="center"><font color="#800080">Criar conexão com banco de dados Oracle usando cx_Oracle e python</font></h2>



![](https://github.com/TitoSantos/QAcao/blob/master/criarConexaoUtilizando-CX_Oracle/img/cx_Oracle_arch.png)

<h4><font color="#800080">CX_ORACLE:</font></h4>

<h5>cx_Oracle é um módulo que permite o acesso ao Oracle Database e está em conformidade com a especificação da API do banco de dados Python. Este módulo é atualmente testado no Oracle Client 21c, 19c, 18c, 12c e 11.2 e Python 3.6, 3.7, 3.8, 3.9 e 3.10. Versões mais antigas do cx_Oracle podem ser usadas com versões anteriores do Python. Utilizamos esse módulo nos projetos de automação web com robot framework.</h5>

<h4><font color="#800080">Instalação do cx_oracle:</font></h4>

<h5>Para instalar o módulo cx_Oracle basta abrir o prompt de comando como administrador e executar o comando abaixo: <font color="#800080">pip install cx_Oracle --upgrade</font>

<h4><font color="#800080">Como criar a conexão?</font></h4> 

![](https://github.com/TitoSantos/QAcao/blob/master/criarConexaoUtilizando-CX_Oracle/img/conexao.png)

<h5>A imagem acima monstra uma maneira bem simples de criar a conexão. Para isso foi criada a classe DBConnect e dentro dela foi criado um métono que retorna a conexão. Para que a conexão seja realizada, temos que passar os parâmetros user, password e dsn. Seguem exemplos de uso dentro dentro da biblioteca DBConect para auxiliar no entendimento.</h5>



