*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${HOMEPAGE}    https://www.cardiffrugby.wales/

*** Test Cases ***
ClosePopup
    Open Browser    https://www.cardiffrugby.wales/  Chrome
    Wait Until Element Is Visible    css=.close-banner-func    15s
    Click Element    css=.close-banner-func
    ${current_url}=    Get Location
    Log    Current URL is: ${current_url}
    Click Link And Check    css=a>img[alt='Cardiff Rugby']    ${HOMEPAGE}
    Click Link And Check    css=.top-link    ${HOMEPAGE}news
    #Click Link And Check    xpath=/html/body/form/main/div[3]/div/div/section/div/div[3]/a    ${HOMEPAGE}news
    Click Link And Check    xpath=/html/body/form/div[4]/header/div/div/div[3]/div[1]/a[2]    ${HOMEPAGE}events
    Click Link And Check    xpath=/html/body/form/div[4]/header/div/div/div[3]/div[1]/a[1]    ${HOMEPAGE}contact-us

*** Keywords ***
Click Link And Check
    [Arguments]    ${selector}    ${expected_url}
    Wait Until Element Is Visible    ${selector}    20
    Click Link    ${selector}
    ${current_url}=    Get Location
    Log    Current URL is: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${expected_url}

