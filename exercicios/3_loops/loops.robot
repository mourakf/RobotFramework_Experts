*** Settings ***
Documentation    Exercicios de loops
Library    String

*** Variables ***
@{veggies}    lettuce    onions    zuchini
@{countries}    Germany    England    Canada    Deenmark    The Netherlands


*** Test Cases ***

Fazer loop de "1" a "10"
    logar no console de "${1}" a "${10}"
Fazer loop em uma lista
    logar no console uma lista

Imprimir nome de 5 paises
    logar no console uma lista de paises

*** Keywords ***

logar no console uma lista
    FOR    ${value}    IN    @{veggies}
        Log To Console    ${value}
    END   

logar no console de "${1}" a "${10}"
    FOR    ${counter}    IN RANGE    ${0}   ${11}
        Log To Console   ${counter}
        
    END

logar no console uma lista de paises
    FOR     ${country}    IN    @{countries}
        Log To Console    ${country}
    END