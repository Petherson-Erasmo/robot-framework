
*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=     welcome          Petherson
    Should Be Equal     ${result}       Olá Petherson, bem vindo ao curso básico de Robot Framework!!!