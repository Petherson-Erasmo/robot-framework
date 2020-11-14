*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Deve validar o Tiulo
    Open Browser        https://training-wheels-protocol.herokuapp.com/        chrome
    Title Should Be     Training Wheels Protocol
    Close Browser
