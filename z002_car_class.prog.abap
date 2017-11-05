*&---------------------------------------------------------------------*
*& Report Z002_CAR_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z002_CAR_CLASS.

CLASS car DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA: numOfCars TYPE i.       " Static Attributes

    METHODS constructor                 " Instance Constructor
      IMPORTING
        make     TYPE c
        model    TYPE c
        numSeats TYPE i
        maxSpeed TYPE i.

    METHODS viewcar.


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

CLASS car IMPLEMENTATION.

  METHOD constructor.
*    make = make.
*    model = model.
*    numseats = numseats.
*    maxspeed = maxspeed.
    me->make = make.
    me->model = model.
    me->numseats = numseats.
    me->maxspeed = maxspeed.
    numOfCars = numOfCars + 1.
  ENDMETHOD.

  METHOD viewcar.                              " Add this as a check and DEBUG the code
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

  DATA car1 TYPE REF TO car.

  CREATE OBJECT car1
    EXPORTING
      make     = 'Mercedes'
      model    = 'E350'
      numseats = 5
      maxspeed = 150.
