(in-package :cl-jack)

(defun lispify (name flag &optional (package *package*))
  (swig-lispify (regex-replace "(?i)^jack_?" name "") flag package))
