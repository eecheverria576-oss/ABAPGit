CLASS zcl_test_classes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS add_two_numbers
      IMPORTING
                value1        TYPE i
                value2        TYPE i
      RETURNING VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_classes IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write(
      EXPORTING
        data   =  add_two_numbers(
                      EXPORTING
                        value1 = 2
                        value2 = 3
                    )
    ).
  ENDMETHOD.
  METHOD add_two_numbers.
    result = value1 + value2.
  ENDMETHOD.

ENDCLASS.
