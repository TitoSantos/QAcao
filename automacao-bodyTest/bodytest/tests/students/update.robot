***Settings***
Documentation       Atualziar alunos

Resource            ${EXECDIR}/resources/base.robot
Suite Setup         Start Admin Session
Test Teardown       Take Screenshot
  

***Test Cases***
Cenario: Atualizar um aluno já cadastrado

    ${fixture}      Get JSON      students-update.json

    ${kamalakhan}   Set Variable    ${fixture['before']} 
    ${kamalakhan}   Set Variable    ${fixture['after']} 

    Insert Student  ${kamalakhan}