***Settings***
Documentation       Tudo começa aqui, meu arquivo base do projeto de automação 

#Importação das librarys do projeto
Library             Browser
Library             Collections
Library             OperatingSystem
Library             libs/DeloreanLibrary.py     #Importando a library customizada   

Resource            actions/authorization.robot
Resource            actions/nav.robot
Resource            actions/students.robot
Resource            actions/components.robot

***Keywords***
Start Browser Session
    New Browser                 chromium         false    
    #New Context                 viewport={'width': 1366, 'height': 768}    screen={'width': 1366, 'height': 768}
    New Page                    about:blank

Start Admin Session
    Start Browser Session
    Go To Login Page               
    Login With                  ${LOGINBOM}                         ${SENHABOA}
    User Should Be Logged In    Administrador

Clear LS And Take Screenshot
    LocalStorage Clear      #Limpa a sessão do usuário no navegador
    Take Screenshot

Thinking And Take Screenshot
    [Arguments]                ${timeout}
    Sleep                      ${timeout}
    Take Screenshot

### Helpers
Get JSON
    [Arguments]             ${file_name}

    #Get File é uma palavra chave da library OperatingSistem. Server para pegar o conteúdo de um arquivo    
    ${file}             Get File     ${EXECDIR}/resources/fixtures/${file_name}

    #Transformando o formato string em um formato json para que o robot consiga entender que é um json 
    ${json_object}      evaluate     json.loads($file)      json

    [Return]            ${json_object}

