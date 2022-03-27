***Settings***
Documentation       Cadastro de alunos

Resource            ${EXECDIR}/resources/base.robot
Suite Setup         Start Admin Session
Test Teardown       Take Screenshot
  

***Test Cases***
Cenario: Novo aluno
    
    &{student}      Create Dictionary    name=Tiago Santos    email=tiagom.soft@gmail.com    age=37    weight=105    feet_tall=1.65
   
    Remove Student              ${student.email}
    Go To Students  
    Go To Form Student          
    New Student                 ${student}
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]                  Thinking And Take Screenshot        2

Cenario: Não deve permitir email duplicado
    
    &{student}      Create Dictionary    name=Alexandre de Moraes    email=alexandre.moraes@hotmail.com    age=51    weight=72    feet_tall=1.70
    
    Insert Student              ${student}
    Set Strict Mode             false
    Go To Students  
    Go To Form Student          
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]                  Thinking And Take Screenshot        2

Cenario: Todos os campos devem ser obrigatórios
    #Criei uma lista de alertas esperados 
    @{expected_alerts}      Set Variable   Nome é obrigatório  O e-mail é obrigatório  idade é obrigatória  o peso é obrigatório   a Altura é obrigatória
    
    #Criei uma lista para os alertas obtidos
    @{got_alerts}           Create List

    Go To Students  
    Go To Form Student
    Submit Student Form

    #FOR     ${alert}    IN      @{expected_alerts}
    #    Alert Text Should Be    ${alert}
    #END

    FOR     ${index}        IN RANGE    1   6 
        ${span}             Get Required alerts     ${index}
        Append To List      ${got_alerts}   ${span}
    END

    Log      ${expected_alerts}
    Log      ${got_alerts}

    #Copanrando as listas
    Lists Should Be Equal       ${expected_alerts}      ${got_alerts}

Cenario: Validação dos campos Numéricos
    [Template]                  Check Type Field On Student Form
    ${AGE_FIELD}                number
    ${WEIGHT_FIELD}             number
    ${FEET_TALL_FIELD}          number

Cenario: Validar campo do tipo email 
    [Template]                  Check Type Field On Student Form
    ${EMAIL_FIELD}              email

Cenario: Menor de 14 anos não pode realizar Cadastro

    &{student}      Create Dictionary    name=Livia da Silva    email=livia@hotmail.com    age=13    weight=50    feet_tall=1.65
    Set Strict Mode             false
    Go To Students  
    Go To Form Student          
    New Student                 ${student}
    Alert Text Should Be        A idade deve ser maior ou igual 14 anos


***Keywords***
#Template de comportamento por isso está dentro da suíte
Check Type Field On Student Form 
    [Arguments]                 ${element}      ${type}
    Set Strict Mode             false
    Go To Students  
    Go To Form Student
    Field Should Be Type        ${element}      ${type}

    
    
