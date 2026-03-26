INTERFACE zif_conversion_service PUBLIC.
  METHODS:
    convert_value
      IMPORTING iv_value TYPE i
      RETURNING VALUE(rv_result) TYPE i.
ENDINTERFACE.
