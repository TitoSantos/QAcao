***Settings***
Documentation       Pesquisa de alunos

Resource            ${EXECDIR}/resources/base.robot
Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Busca Exata
    &{student}      Create Dictionary    name=Steve Jobs    email=jobs@apple.com    age=45    weight=80    feet_tall=1.80

    Remove Student By Name          ${student.name}
    Insert Student                  ${student}
    Set Strict Mode                 false
    Go To Students
    Search Student By name          ${student.name}
    Student Name Should Be Visible  ${student.name}
    Total Items Should Be           1

Cenario: Registro não encontrado

    ${name}     Set Variable        Barao Zemo 

    Remove Student By Name          ${name}
    Set Strict Mode                 false
    Go To Students
    Search Student By name          ${name} 
    Register Should Not Be Found

Cenario: Busca alunos por um único termo
    [Tags]                           json
       
    ${fixture}      Get JSON        students-search.json   
    ${students}     Set Variable    ${fixture['students']} 
    ${word}         Set Variable    ${fixture['word']} 
    ${total}        Set Variable    ${fixture['total']}

    Remove Student By Name          ${word}

    FOR     ${item}     IN      @{students}  #Tem que passar como uma lista usando @
        Insert Student      ${item}
    END

    Set Strict Mode                 false
    Go To Students
    Search Student By name          ${word}
    
    FOR     ${item}     IN      @{students}  
        Student Name Should Be Visible      ${item['name']}
    END

    Total Items Should Be           ${total}


    