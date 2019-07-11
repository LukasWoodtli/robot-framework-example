*** Settings ***
Library        REST                            https://petstore.swagger.io/v2
#...           spec=${CURDIR}/ref/petstore.swagger.json

*** Variables ***
${ref_dir}  ${CURDIR}/ref/


*** Test Cases ***

Get the created config file
    Expect response body      ${ref_dir}/store_inventory_schema.json
    GET                  /store/inventory
    Integer                   response status           200
    Output                    response body
    # This can be used to show the JSON schema which can be 
    # used for future testing (see `Expect response body`)
    Output schema         response body
    Object                    response body
    Integer                    response body sold
    Integer                    response body placed
    [Teardown]                Output        response body               ${OUTPUTDIR}/store_inventory.json
