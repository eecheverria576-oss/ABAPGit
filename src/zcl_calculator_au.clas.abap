CLASS zcl_calculator_au DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          io_service TYPE REF TO zif_conversion_service,
      add
        IMPORTING
          iv_a             TYPE i
          iv_b             TYPE i
        RETURNING
          VALUE(rv_result) TYPE i,
      convert
        IMPORTING
          iv_value TYPE i
         RETURNING
           VALUE(rv_result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mo_service TYPE REF TO zif_conversion_service.
ENDCLASS.

CLASS zcl_calculator_au IMPLEMENTATION.

  METHOD constructor.
    mo_service = io_service.
  ENDMETHOD.

  METHOD convert.
    rv_result = mo_service->convert_value( iv_value ).
  ENDMETHOD.

  METHOD add.
    rv_result = iv_a + iv_b.
  ENDMETHOD.

ENDCLASS.
