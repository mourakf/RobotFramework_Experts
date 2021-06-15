*** Settings ***
Documentation    exercicio arguments and returns

*** Variables ***
&{contact}    name=Ester    surname=Sandra    age=23

*** Test Cases ***
Logar no console o e-mail, nome e idade
    ${email}    Criar e-mail     ${contact.name}    ${contact.surname}    ${contact.age}
    Log To Console    seu email é


*** Keywords ***

Criar e-mail
    [Arguments]    ${name}    ${surname}    ${age}
    [Return]    ${name}_${surname}_${age}@robot.com