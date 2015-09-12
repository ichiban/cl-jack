%module jack

%feature("intern_function","1");

%insert("lisphead")
%{
(in-package :cl-jack)

(load-foreign-library "/usr/local/lib/libjack.so")
%}

%include "/home/rick/quicklisp/local-projects/cl-jack/jack.h"
%include "/home/rick/quicklisp/local-projects/cl-jack/midiport.h"
