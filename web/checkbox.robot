*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://training-wheels-protocol.herokuapp.com/
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_pantera}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com Id
    Open Browser                        ${url}                  chrome
    Go To                               ${url}/checkboxes
    Select Checkbox                     ${check_thor}
    Checkbox Should Be Selected         ${check_thor}
    Close Browser

Marcando opção com CSS Selector
    [Tags]                              iron
    Open Browser                        ${url}                  chrome
    Go To                               ${url}/checkboxes
    Select Checkbox                     ${check_iron}
    Checkbox Should Be Selected         ${check_iron}
    Close Browser

Marcando opção com Xpath
    [Tags]                              pantera
    Open Browser                        ${url}                  chrome
    Go To                               ${url}/checkboxes
    Select Checkbox                     ${check_pantera}
    Checkbox Should Be Selected         ${check_pantera}
    Close Browser