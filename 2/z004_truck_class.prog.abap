*&---------------------------------------------------------------------*
*& Report Z004_TRUCK_CLASS
*&---------------------------------------------------------------------*
*&KS Comment 12-04-2017
*&---------------------------------------------------------------------*
REPORT Z004_TRUCK_CLASS.

CLASS truck DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA: numOfTrucks TYPE i.       " Static Attributes

    METHODS constructor                 " Instance Constructor
      IMPORTING
        make     TYPE c
        model    TYPE c
        numSeats TYPE i
        maxSpeed TYPE i.

    METHODS viewtruck.


    METHODS setnumseats
      IMPORTING
        newseatnum TYPE i.
*      EXPORTING
*      CHANGING
*      RETURNING

    METHODS gofaster
      IMPORTING
        increment TYPE i
      EXPORTING
        result    TYPE i.

    METHODS goslower
      IMPORTING
        increment     TYPE i
      RETURNING
        VALUE(result) TYPE i.

* Functional Method
*    METHODS getstatustext
*      IMPORTING VALUE(statcode) TYPE c
*      RETURNING value(stattext) TYPE string.


  PRIVATE SECTION.

    DATA: make     TYPE c LENGTH 20,
          model    TYPE c LENGTH 20,
          numSeats TYPE i,
          speed    TYPE i,
          maxSpeed TYPE i.

*    DATA: loginid TYPE c LENGTH 20,
*          pwd     TYPE c LENGTH 15.

ENDCLASS.

CLASS truck IMPLEMENTATION.

  METHOD constructor.
*    make = make.
*    model = model.
*    numseats = numseats.
*    maxspeed = maxspeed.
    me->make = make.
    me->model = model.
    me->numseats = numseats.
    me->maxspeed = maxspeed.
    numOfTrucks = numOfTrucks + 1.
  ENDMETHOD.

  METHOD viewtruck.                              " Add this as a check and DEBUG the code
    WRITE: / 'Make = ', 19 make.
    WRITE: / 'Model = ', 19 model.
    WRITE: / 'Number of Seats = ', 19 numseats LEFT-JUSTIFIED.
    WRITE: / 'Max Speed = ', 19 maxspeed LEFT-JUSTIFIED.
    WRITE: / 'Speed = ', 19 speed LEFT-JUSTIFIED.
  ENDMETHOD.

  METHOD setnumseats.
    numSeats = newseatnum.
  ENDMETHOD.

  METHOD gofaster.

    DATA tmpspeed TYPE i.
    tmpspeed = speed + increment.

    IF tmpspeed <= maxspeed.
      speed = speed + increment.
    ENDIF.

    result = speed.

  ENDMETHOD.

  METHOD goslower.

    DATA tmpspeed TYPE i.
    tmpspeed = speed - increment.

    IF tmpspeed >= 0.
      speed = speed - increment.
    ENDIF.

    result = speed.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA truck1 TYPE REF TO truck.

  CREATE OBJECT truck1
    EXPORTING
      make     = 'Ford'
      model    = 'F350'
      numseats = 5
      maxspeed = 145.
