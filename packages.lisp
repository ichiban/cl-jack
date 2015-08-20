(in-package :cl-user)

(defpackage :cl-jack
  (:use :cl
	:cffi
        :iterate)
  (:export :*error-function*
	   :*info-function*
	   :jack-client))
