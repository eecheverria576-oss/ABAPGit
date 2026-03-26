CLASS zcl_test_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      METHODS:
      create_double
        RETURNING
          VALUE(ro_double) TYPE REF TO zcl_service_double,
      prepare_data
        IMPORTING
          iv_value TYPE i RETURNING VALUE(rv_value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_test_helper IMPLEMENTATION.
  METHOD create_double.
    ro_double = NEW #(  ).
  ENDMETHOD.

  METHOD prepare_data.
      rv_value = iv_value * 2. "ejemplo de helper
  ENDMETHOD.

ENDCLASS.
