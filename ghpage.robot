*** Settings ***
Library        Collections
Library        RequestsLibrary   WITH NAME    Req
Library        OperatingSystem


*** Test Cases ***

Get version of config service
    Req.Create Session           lw-ghpage                            http://lukaswoodtli.github.io
    ${resp}=                     Req.Get request                      lw-ghpage              /linux_system_calls.html
    Should Be Equal As Strings   ${resp.status_code}                  200
    Log                          "${resp.text}"
    Create File                  ${CURDIR}/downld/sys_calls.html    ${resp.text}l
