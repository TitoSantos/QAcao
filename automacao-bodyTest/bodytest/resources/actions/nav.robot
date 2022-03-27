***Settings***
Documentation       Ações do menu superior de navegação 

***Keywords***
Go To Students
    Click                       css=a[href$=alunos]
    Wait For Elements State     xpath=//h1[contains(text(), "Gestão de Alunos")]    visible     5

User Should Be Logged In
    [Arguments]                 ${user_name}
    Get Text                    css=aside strong    should be   ${user_name}
