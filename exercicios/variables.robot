*** Settings ***
Documentation    uso de variaveis no robot

Library    Collections

*** Variables ***
#declaracao de variavel entre ${}
${message}    hello, robot!
# tipos de dados: int, string, list, dictionary, boolean

# int
${type_int}    ${20}

# list: @{}
@{type_list}    1    2    3

# booleanos
${type_boolean}    ${true}

# dictionary
&{type_dict_person}    id={1}    name=Karina

&{dict_person}    id=1    name=Ester    age=23    city=Blumenau    state=SC    email=teste@teste.com
*** Test Cases ***
# titulo do caso de teste
Logar no terminal a variavel message
    # passos do caso de teste
    Logar no terminal a variavel message

Logar no terminal o dicionário
    Logar no terminal o dicionário

Logar no terminal uma lista
    Logar no terminal uma lista

Logar no terminal cada elemento da lista
    Logar no terminal cada elemento da lista

Logar no console uma lista com 5 frutas
    Logar no console uma lista com 5 frutas

Logar no console informações de uma pessoa
    Logar informações de uma pessoa

*** Keywords ***
Logar no terminal a variavel message
    Log To Console     ${message}


Logar no terminal o dicionário
    Log To Console     ${type_dict_person.name}

Logar no terminal uma lista
    Log To Console     ${type_list}

Logar no terminal cada elemento da lista
#variavel de escopo do caso de teste - só é acessada nesse escopo 
    @{lista_compras}     Set Variable       1    avocado    3.50  
# variavel de escopo do teste
    Set Test Variable    ${compras2}    aveia
    Log To Console    ${lista_compras} - ${compras2}
    Log Many    @{lista_compras}


Logar no console uma lista com 5 frutas
    Set Test Variable    @{fruits}    morango    kiwi    carambola    abacate    lichia
    FOR    ${element}    IN    @{fruits}
        Log To Console    ${element}
        
    END

Logar informações de uma pessoa
    FOR    ${value}    IN    &{dict_person}
        Log To Console    ${value}
        
    END
    Log Dictionary    ${dict_person}