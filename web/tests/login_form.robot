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

Senha inválida e validando a mensagem e se está sendo exibido no elemento certo
    [tags]                      login_error
    Go To                       ${url}/login
    Input Text                  css:input[name=username]            stark
    Input Text                  css:input[name=password]            abc123
    Click Element               xpath://*[@id="login"]/button/i
    
    ${message}=                 Get WebElement                      id:flash
    Should Contain              ${message.text}                     Senha é invalida

Usuário não existente e validando a mensagem e se está sendo exibido no elemento certo
    [tags]                      login_error
    Go To                       ${url}/login
    Input Text                  css:input[name=username]            pet
    Input Text                  css:input[name=password]            abc123
    Click Element               xpath://*[@id="login"]/button/i
    
    ${message}=                 Get WebElement                      id:flash
    Should Contain              ${message.text}                      O usuário informado não está cadastrado!
