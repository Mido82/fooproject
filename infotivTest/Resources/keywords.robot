*** Keywords ***
Begin Web Test
    Open browser                           about:blank   ${BROWSER}
    Maximize Browser Window
    Load Page
    Verify Page Loaded

Load Page
    Go to                                  ${URL}
Verify Page Loaded
    Wait Until Page Contains        Infotiv Car Rental

End Web Test
   Close Browser