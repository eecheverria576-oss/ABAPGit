*"* use this source file for your ABAP unit test classes
CLASS lcl_test DEFINITION FINAL FOR TESTING
                  DURATION SHORT
                  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: f_cut TYPE REF TO zcl_test_classes.

    METHODS:
      setup,
      teardown,
      add_two_numbers FOR TESTING.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.

  METHOD setup.
    f_cut = NEW #(  ).
  ENDMETHOD.

  METHOD add_two_numbers.

    DATA local_result TYPE i.

    local_result =
      f_cut->add_two_numbers(
        EXPORTING
          value1 = 2
          value2 = 2
      ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = local_result
        exp                  = 4
*          ignore_hash_sequence = abap_false
*          tol                  =
           msg                  = 'El metodo falló'
*          level                = if_abap_unit_constant=>severity-medium
*          quit                 = if_abap_unit_constant=>quit-test
*        RECEIVING
*          assertion_failed     =
    ).


  ENDMETHOD.



  METHOD teardown.
    " Se ejecuta después de cada test
    CLEAR f_cut. " Libera la referencia
    cl_abap_unit_assert=>assert_initial(
  EXPORTING
    act = f_cut
    msg = 'Objeto f_cut liberado en teardown'
).
  ENDMETHOD.

ENDCLASS.
