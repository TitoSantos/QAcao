***Settings***
Documentation       Ações de componentes genéricos

***Keywords***
Toaster Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}        visible     10

Alert Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=form span >> text=${expected_text}        visible     5

Get Required alerts
    [Arguments]             ${index}    
    ${span}     Get Text    xpath=(//form//span)[${index}]
    [return]    ${span}

Field Should Be Type
    [Arguments]         ${element}      ${type}
    ${attr}     Get Attribute       ${element}        type
    Should Be Equal     ${attr}      ${type}

Total Items Should Be
    [Arguments]                 ${number}

    ${element}      Set Variable     css=#pagination .total

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      ==          Total: ${number}

Register Should Not Be Found             
    Wait For Elements State     css=div >> text=Nenhum registro encontrado.     visible     5
    Wait For Elements State     css=table       detached       5


