*** Settings ***
Resource            base.robot

Test Setup          Nova sessão         #before
Test Teardown       Encerra sessão      #after

*** Test Cases ***
Deve validar o Tiulo
    Title Should Be     Training Wheels Protocol
