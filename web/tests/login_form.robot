*** Settings ***
Resource            base.robot

Test Setup          Nova sessão         #before
Test Teardown       Encerra sessão      #after

*** Test Cases ***
Login com sucesso
    Go To                       ${url}/login
    Input Text                  css:input[name=username]            stark
    Input Text                  css:input[name=password]            jarvis!
    Click Element               xpath://*[@id="login"]/button/i
    Page Should Contain         Olá, Tony Stark. Você acessou a área logada!