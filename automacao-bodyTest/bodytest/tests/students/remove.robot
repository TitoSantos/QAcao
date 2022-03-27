***Settings***
Documentation       Remover alunos

Resource            ${EXECDIR}/resources/base.robot
Test Setup          Start Admin Session
Test Teardown       Take Screenshot
  

***Test Cases***
Cenario: Remover aluno cadastrado

    &{student}      Create Dictionary    name=Robert Correia    email=robert.correia@yahoo.com.br    age=39    weight=135    feet_tall=1.69

    Insert Student              ${student}
    Set Strict Mode             false
    Go To Students
    Search Student By name      ${student.name}
    Request Removal By Email    ${student.email}
    Confirm Removal
    Toaster Text Should Be      Aluno removido com sucesso.
    Student Should Not Visible  ${student.email}

    [Teardown]                  Thinking And Take Screenshot        2

Cenario: Desistir da exclusão

    &{student}      Create Dictionary    name=Anderson Galvao    email=galvao.master@gmail.com    age=39    weight=95    feet_tall=1.82

    Insert Student              ${student}
    Set Strict Mode             false
    Go To Students
    Search Student By name      ${student.name}
    Request Removal By Email    ${student.email}
    Cancel Removal
    Student Should Be Visible   ${student.email}

