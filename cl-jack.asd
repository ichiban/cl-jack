(in-package :cl-user)

(defpackage :cl-jack-asd
  (:use :cl :asdf))

(in-package :cl-jack-asd)

(defsystem :cl-jack
    :description "JACK Audio Connection Kit Wrapper."
    :version "0.1"
    :author "ICHIBANGASE Yutaka <yichiban@gmail.com>"
    :depends-on (:cffi :iterate)
    :components ((:file "packages")
		 (:file "jack" :depends-on ("packages"))
		 (:file "core" :depends-on ("packages" "jack"))))
