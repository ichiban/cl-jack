(in-package :cl-jack)

(defconstant +jack-port-is-input+ #x01)
(defconstant +jack-port-is-output+ #x02)
(defconstant +jack-port-is-physical+ #x04)

(defconstant +max-frames+ 4294967295)
(defconstant +load-init-limit+ 1024)

(defconstant +jack-default-audio-type+ "32 bit float mono audio")
(defconstant +jack-default-midi-type+ "8 bit raw midi")
