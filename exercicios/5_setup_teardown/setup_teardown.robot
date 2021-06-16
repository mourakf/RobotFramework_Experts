*** Settings ***
Documentation    Criar keywords que recebem argumentos e retornam um resultado

Suite Setup        Keyword para executar no setup da suite 
Test Setup         Keyword para executar no setup de cada teste

Suite Teardown     Keyword para executar no teardown da suite
Test Teardown      Keyword para executar no teardown do teste


*** Test Cases ***

Somar dois numeros
    ${result_sum}    Somar dois numeros    2    3
    Log To Console    ${result_sum}

Somar dois numeros de forma embutida
    ${sum_2}    Somar os numeros "10" e "20"
    Log To Console    ${sum_2}
*** Keywords ***
Keyword para executar no setup da suite
    Log To Console    essa keyword foi executada antes de começar a suite

Keyword para executar no setup de cada teste 
    Log To Console    essa keyword foi executada antes de começar o teste

Keyword para executar no teardown da suite
    Log To Console    essa keyword  de teardown foi executada depois de começar a suite

Keyword para executar no teardown do teste
    Log To Console    essa keyword de teardown foi executada depois de começar o teste

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