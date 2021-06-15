*** Settings ***
Documentation    Criar keywords que recebem argumentos e retornam um resultado

*** Test Cases ***

Somar dois numeros
    ${result_sum}    Somar dois numeros    2    3
    Log To Console    ${result_sum}

Somar dois numeros de forma embutida
    ${sum_2}    Somar os numeros "10" e "20"
    Log To Console    ${sum_2}
*** Keywords ***

Somar dois numeros
    [Arguments]    ${num_a}    ${num_b}
    Log To Console    ${num_a}+${num_b}
    ${result_sum}    Evaluate    ${num_a}+${num_b}
    Log To Console    o resultado é ${result_sum}
    [Return]    ${result_sum}

# argumento é passado embutido no caso de teste
Somar os numeros "${num1}" e "${num2}"
    Log To Console    ${num1} + ${num2}
    ${sum_2}    Evaluate    ${num1} + ${num2}
    [Return]    ${sum2}