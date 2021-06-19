*** Settings ***
Documentation    Resource com a implementação das keywords de suiteWebTesting

# instanciar a selenium library
Library    SeleniumLibrary
Library    AutoRecorder     mode=suite,test



*** Variables ***
${URL}    http://automationpractice.com/index.php
${produto}         Blouse
${password}        Password
${city}            Portland
${state}           Oregon
${country}         United States
${first_name}      Annie
${last_name}       K Martinez
${email}           si2uvs@temporary-mail.net
${address}         937  Virginia Street
${zip_code}        30213
${phone_num}       404-354-7153
#locators

${img_logo}      //img[contains(@class,'logo img-responsive')]

${search_box}    search_query_top

${search_button}    submit_search

*** Keywords ***


# Setup
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

# Teardown
Fechar o navegador
    Close All Browsers



# Steps

# Caso de test 01
Acessar a página home do site Automation Pratice
    Go To    ${URL}
    Wait Until Element Is Visible    xpath=//img[contains(@class,'logo img-responsive')]

Digitar o nome do produto "${produto}" no campo de pesquisa
    Input Text    id=search_query_top    ${produto}
    
Clicar no botão pesquisa
    Click Button    name=${search_button}

Validar se o produto "${produto}" foi encontrado
    Wait Until Element Is Visible    xpath=//img[contains(@alt,'${produto}')]
    
# Adicionar o produto "${produto}" no carrinho
#     Mouse Over       xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]
#     Click Element    xpath=//span[contains(.,'Add to cart')]
#     Wait Until Element Is Visible    xpath=//span[contains(.,'Proceed to checkout')]
#     Click Element    xpath=//span[contains(.,'Proceed to checkout')]

# Conferir se o produto "${produto}" foi adicionado no carrinho
#     Wait Until Element Is Visible    xpath=(//a[contains(.,'${produto}')])[4]



# Caso de teste 02
    
Acessar a página home do automationpractice
        Go To    ${URL}
        Wait Until Element Is Visible    xpath=${img_logo}

Pesquisar por "${nao_existe}"
    Input Text    id=${search_box}     ${nao_existe}

Clicar no botão pesquisar
    Click Button    name=${search_button}

Validar a mensagem "No results were found for your search "${nao_existe}""
    Wait Until Element Is Visible    xpath=//p[@class='alert alert-warning'][contains(.,'No results were found for your search "${nao_existe}"')]



# Caso de teste 03:     

Na página home do site
    Go To    ${URL}
    Wait Until Element Is Visible    xpath=${img_logo}
    #Click Element    class=logo.img-responsive

Passar o mouse por cima da categoria "${Women}" no menu principal superior de categorias
    Mouse Over       xpath=//a[@title='Women']
Clicar na sub categoria "${Summer_Dresses}"
    Click Element    xpath=(//a[@title='${Summer_Dresses}'])[1]

Validar sub-categoria "${Summer_Dresses}" exibido na página
    # Wait Until Element Contains    css=span.cat-name    ${Summer_Dresses}     8s
    Wait Until Element Is Visible    css=span.cat-name


# Caso de Teste 04: Adicionar Cliente

Acessar o site
    Go To    ${URL}
    Wait Until Element Is Visible    xpath=${img_logo}

Clicar em "Sign in"
    Click Element    class=login
    Wait Until Element Is Visible    xpath=//h3[@class='page-subheading'][contains(.,'Create an account')]
    #xpath=//h3[@class='page-subheading'][contains(.,'Create an account')]

Informar um e-mail válido e clicar em "Create an account"
    Input Text                       id=email_create    ${email}    true
    Click Button                     id=SubmitCreate
    Wait Until Element Is Visible    class=page-heading
     #Wait Until Element Is Visible    xpath=//h3[@class='page-subheading'][contains(.,'Your personal information')]

Preencher os dados obrigatórios
    Sleep    8s
    Input Text    id=customer_firstname    ${first_name}
    Input Text    id=customer_lastname     ${last_name}
    Textfield Should Contain    xpath=//input[@value='${email}']    ${email}
    Input Password    id=passwd    ${password}
    Input Text    id=firstname    ${first_name}    true
    Input Text    id=lastname    ${last_name}    true    
    Input Text    id=address1    ${address}    true
    Input Text    id=city        ${city} true
    Click Element    id=uniform-id_state
    Select From List By Value    id=id_state    37
    Input Text        id=postcode    ${zip_code}
    List Selection Should Be    id=id_country    ${country}
    Input Text    id=phone_mobile    ${phone_num}    true
    Input Text    id=alias    ${address}    true
   

Submeter cadastro
     Click Button    id=submitAccount

Cadastro realizado com sucesso
    Element Should Contain    xpath=//span[contains(.,'${first_name} ${last_name}')]    ${first_name} ${last_name}

