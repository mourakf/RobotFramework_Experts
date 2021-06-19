*** Settings ***
Documentation     Suite de teste web Suite http://automationpractice.com/index.php

# declara o arquivo resource que consta a implementação das keywords
Resource          resourceWebTesting.robot
Suite Setup       Abrir o navegador
Suite Teardown    Fechar o navegador

*** Test Cases ***


Caso de teste 01: Pesquisar produto existente
    No Operation
    Acessar a página home do site Automation Pratice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Validar se o produto "Blouse" foi encontrado

# Desafio
Caso de teste 02: Pesquisar produto não existente
    Acessar a página home do automationpractice
    Pesquisar por "produto não existe" 
    Clicar no botão pesquisar
    Validar a mensagem "No results were found for your search "produto não existe""

# Desafio
Caso de Teste 03: Listar Produtos
    Na página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Validar sub-categoria "Summer Dresses" exibido na página

# Desafio
Caso de Teste 04: Adicionar Cliente
    Acessar o site
    Clicar em "Sign in"
    Informar um e-mail válido e clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Cadastro realizado com sucesso

