*** Settings ***
Documentation    Uso de if no Robot


*** Variables ***

@{countries}    Germany    England    Canada    Deenmark    The Netherlands



*** Test Cases ***
Imprimir apenas o pais Canada
    Loga no terminal o pais Canada

Imprimir no console somente o numero 5 ou 8
    Loga no console o numero 5 e 8

*** Keywords ***
Loga no terminal o pais Canada
    FOR     ${country}    IN    @{countries}
    # expressoes em string precisam ser colocados em aspas simples ''
        IF    '${country}' == 'Canada'
            Log To Console    ${country}
        END

    END

Loga no console o numero 5 e 8
    FOR    ${num}    IN RANGE    0    11
        IF    ${num} == ${5} or ${num} == ${8}
            Log To Console    ${\n} ${num}
        END 
    END