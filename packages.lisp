(in-package :cl-user)

(defpackage :cl-jack
  (:use :cl
	:cffi)
  (:export :jack-client-open
           :jack-port-register
           :jack-port-get-buffer
           :jack-set-process-callback
           :jack-activate
           :jack-deactivate
           :jack-client-close
           :+jack-default-audio-type+
           :+jack-port-is-output+
           :+jack-port-is-input+))
