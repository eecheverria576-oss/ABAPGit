*"* use this source file for your ABAP unit test classes
CLASS ltcl_calculator_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      cut    TYPE REF TO zcl_calculator_au,
      helper TYPE REF TO zcl_test_helper,
      double TYPE REF TO zcl_service_double.
    METHODS:
      setup,
      teardown,
      test_add             FOR TESTING,
      test_convert         FOR TESTING,
      test_add_with_helper FOR TESTING.
ENDCLASS.


CLASS ltcl_calculator_test IMPLEMENTATION.

  METHOD setup.

    helper = NEW #(  ).
    double = helper->create_double( ).
    cut = NEW #( double ).

  ENDMETHOD.

  METHOD teardown.
    CLEAR cut.
    CLEAR double.
    CLEAR helper.
  ENDMETHOD.

  METHOD test_add.

    DATA(result) =
      cut->add(
        iv_a = 2
        iv_b = 3
      ).

    cl_abap_unit_assert=>assert_equals( act = result exp = 5 ).

  ENDMETHOD.

  METHOD test_add_with_helper.

    "Usamos el helper para preparar datos
    DATA(prepared_a) = helper->prepare_data( 2 ). "devuelve 4
    DATA(prepared_b) = helper->prepare_data( 3 ). "devuelve 6

    DATA(result) =
      cut->add(
        iv_a = prepared_a
        iv_b = prepared_b
      ).
    cl_abap_unit_assert=>assert_equals( act = result exp = 10 ).

  ENDMETHOD.

  METHOD test_convert.

    double->set_mocked_value( 42 ).
    DATA(result) = cut->convert( 10 ).
    cl_abap_unit_assert=>assert_equals( act = result exp = 42 ).

  ENDMETHOD.

ENDCLASS.
