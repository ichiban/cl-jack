%module jack

%feature("intern_function","1");

%insert("lisphead")
%{
(in-package :cl-jack)

(load-foreign-library "/Library/Frameworks/Jackmp.framework/Jackmp")
%}

%include "/Library/Frameworks/Jackmp.framework/Headers/jack.h"