***Settings***
Documentation  Ações da feature de gestão de alunos

***Variables***
${NAME_FIELD}           css=input[name=name]
${EMAIL_FIELD}          css=input[name=email]
${AGE_FIELD}            css=input[name=age]
${WEIGHT_FIELD}         css=input[name=weight]
${FEET_TALL_FIELD}      css=input[name=feet_tall]

***Keywords*** 
Go To Form Student
    CLick                       css=a[href$="alunos/new"]
    Wait For Elements State     xpath=//h1[contains(text(), "Novo aluno")]          visible     5

Submit Student Form
    Click                       css=button[type=submit]

New Student
    [Arguments]                 ${student}     
    Fill Text                   ${NAME_FIELD}        ${student.name}  
    Fill Text                   ${EMAIL_FIELD}       ${student.email}  
    Fill Text                   ${AGE_FIELD}         ${student.age}  
    Fill Text                   ${WEIGHT_FIELD}      ${student.weight}  
    Fill Text                   ${FEET_TALL_FIELD}   ${student.feet_tall}  

    Submit Student Form

Request Removal By Email
    [Arguments]        ${email}
    CLick              xpath=//td[contains(text(),"${email}")]/../td//button[@id="trash"]

Confirm Removal
    Click              text=SIM, pode apagar!

Cancel Removal
    CLick              text=NÃO

Student Should Not Visible
    [Arguments]        ${email}
    Wait For Elements State     xpath=//td[contains(text(),"${email}")]     detached    5 

Student Should Be Visible
    [Arguments]        ${email}
    Wait For Elements State     xpath=//td[contains(text(),"${email}")]     visible    5 

Search Student By name
    [Arguments]                 ${name}
    Fill Text                   css=input[placeholder="Buscar aluno"]       ${name}

Student Name Should Be Visible
    [Arguments]                 ${name}
    Wait For Elements State     css=table tbody tr >> text=${name}      visible     5


