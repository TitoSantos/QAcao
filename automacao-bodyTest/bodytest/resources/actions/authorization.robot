***Settings***
Documentation       Ações de autorização da página login, abertura da página e validações 

***Variables***
${LOGINBOM}                 admin@bodytest.com
${LOGINRUIM}                admin&bodytest.com  
${EMAIL_NAO_CADASTRADO}     tiagom.soft@gmail.com  
${SENHABOA}                 pwd123
${SENHARUIM}                pwd321


***Keywords***
Go To Login Page
    Go To                       https://bodytest-tiago.herokuapp.com/
    
Login With
    [Arguments]                 ${email}      ${pass}
    Fill Text                   css=input[name=email]              ${email}
    Fill Text                   css=input[placeholder*=senha]      ${pass}
    Click                       text=Entrar

