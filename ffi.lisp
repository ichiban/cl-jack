

(in-package :cl-jack)

(defun lispify (name flag &optional (package *package*))
  (swig-lispify (regex-replace "(?i)^jack_?" name "") flag package))

(load-foreign-library "/Library/Frameworks/Jackmp.framework/Jackmp")

(defconstant +max-frames+ 4294967295)
(defconstant +load-init-limit+ 1024)

(defconstant +jack-default-audio-type+ "32 bit float mono audio")
(defconstant +jack-default-midi-type+ "8 bit raw midi")


  