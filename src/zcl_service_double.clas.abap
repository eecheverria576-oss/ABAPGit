CLASS zcl_service_double DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_conversion_service .
    METHODS:
      set_mocked_value
        IMPORTING
          iv_value TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA gv_mocked TYPE i.
ENDCLASS.

CLASS zcl_service_double IMPLEMENTATION.
  METHOD zif_conversion_service~convert_value.
    rv_result = gv_mocked.
  ENDMETHOD.
  METHOD set_mocked_value.
    gv_mocked = iv_value.
  ENDMETHOD.

ENDCLASS.
