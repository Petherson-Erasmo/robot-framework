*** Settings ***
Resource            base.robot

Test Setup          Nova sessão         #before
Test Teardown       Encerra sessão      #after

*** Test Cases ***
Login com sucesso
    Go To                               ${url}/login
    Login With                          stark           jarvis!
    
    Should See Logged User              Tony Stark

Senha inválida e validando a mensagem e se está sendo exibido no elemento certo
    [tags]                              login_error
    Go To                               ${url}/login
    Login With                          stark           abc123

    Should Contain Login Alert          Senha é invalida

Usuário não existente e validando a mensagem e se está sendo exibido no elemento certo
    [tags]                              login_error
    Go To                               ${url}/login
    Login With                          Pet123          abc123

    Should Contain Login Alert          O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]                         ${UName}                            ${Pass}
    Input Text                          css:input[name=username]            ${UName}
    Input Text                          css:input[name=password]            ${Pass}
    Click Element                       xpath://*[@id="login"]/button/i

Should Contain Login Alert
    [Arguments]                         ${expect_message}
    ${message}=                         Get WebElement                      id:flash
    Should Contain                      ${message.text}                     ${expect_message}

Should See Logged User
    [Arguments]                         ${user_logged}
    Page Should Contain                 Olá, ${user_logged}. Você acessou a área logada!