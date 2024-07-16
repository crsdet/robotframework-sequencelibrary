*** Settings ***
Documentation       Sequence Keywords tests
Library             String
Library             FakerLibrary
Library             SequenceLibrary


*** Test Cases ***
Test Keywords Can Be Run In Sequence - Log Random String
    Run Sequence            Generate Random String
    ...                     AND
    ...                     Log

Test Keywords Can Be Run In Sequence - Int To String
    ${str_number}           Run Sequence
    ...                     Random Int              18                      100
    ...                     AND
    ...                     Convert To String
    Should Be String        ${str_number}

Test Keywords Can Be Run In Sequence - Catenate Strings
    ${number}               Run Sequence            Random Int              18                      100
    ...                     AND
    ...                     Log
    ...                     AND
    ...                     Set Test Variable       $RANDOM_NUMBER
    Should Be Equal         ${number}               ${RANDOM_NUMBER}

Test AND Is The Only Valid Separator
    ${result}               Run Keyword And Return Status                   Run Sequence
    ...                     Random Int              18                      100
    ...                     ->
    ...                     Convert To String
    Should Not Be True      ${result}

Test Separator Cannot Be The First Argument
    Run Keyword And Expect Error                    AND must have a keyword before and after.       Run Sequence
    ...                     AND
    ...                     Generate Random String

Test Separator Cannot Be The Last Argument
    Run Keyword And Expect Error                    AND must have a keyword before and after.       Run Sequence
    ...                     Random Int              18                      100
    ...                     AND
    ...                     Convert To String
    ...                     AND

Test Separators Cannot Be Together
    Run Keyword And Expect Error                    AND must have a keyword before and after.       Run Sequence
    ...                     Random Int              18                      100
    ...                     AND
    ...                     AND
    ...                     Convert To String
