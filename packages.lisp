(in-package :cl-user)

(defpackage :cl-jack
  (:use :cl
	:cffi)
  (:export :*error-function*
	   :*info-function*
	   :jack-client))