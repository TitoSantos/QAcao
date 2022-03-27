***Settings***
Documentation       Testes da página de login do Administrador do bodytest

Resource            ${EXECDIR}/resources/base.robot
Suite Setup         Start Browser Session
Suite Teardown      Take Screenshot


***Test Cases***
Cenario: Login do Administrador
    Go To Login Page               
    Login With                  ${LOGINBOM}                     ${SENHABOA}
    User Should Be Logged In    Administrador
    [Teardown]                  Clear LS And Take Screenshot      #Limpa a sessão do usuário no navegador e tira print
      
Cenario: Senha incorreta
    Go To Login Page
    Login With                  ${LOGINBOM}                      ${SENHARUIM}   
    Toaster Text Should Be      Usuário e/ou senha inválidos.  
    [Teardown]                  Thinking And Take Screenshot        2   

Cenario: Email não cadastrado
    Go To Login Page
    Login With                  ${EMAIL_NAO_CADASTRADO}          ${SENHARUIM}   
    Toaster Text Should Be      Usuário e/ou senha inválidos.  
    [Teardown]                  Thinking And Take Screenshot        2  

Cenario: Email incorreto 
    Go To Login Page
    Login With                  ${LOGINRUIM}                     ${SENHABOA} 
    Alert Text Should Be        Informe um e-mail válido
    
Cenario: Senha não informada
    Go To Login Page
    Login With                  ${LOGINBOM}                      ${EMPTY}
    Alert Text Should Be        A senha é obrigatória          
    
Cenario: Email não informada
    Go To Login Page
    Login With                  ${EMPTY}                         ${SENHABOA} 
    Alert Text Should Be        O e-mail é obrigatório          
    
Cenario: Email e senha não informados 
    Go To Login Page
    Login With                  ${EMPTY}                         ${EMPTY} 
    Alert Text Should Be        O e-mail é obrigatório           
    Alert Text Should Be        A senha é obrigatória           

