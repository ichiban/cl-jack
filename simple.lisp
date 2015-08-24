(in-package :cl-user)
(defpackage :cl-jack-user
  (:use :cl-jack :cffi :iterate :cl))
(in-package :cl-jack-user)

(defvar *client* (jack-client-open "simple" (null-pointer) (null-pointer)))
(defvar *input-port* (jack-port-register *client* "in"
				    +jack-default-audio-type+
				    +jack-port-is-input+ 0))
(defvar *output-port* (jack-port-register *client* "out"
				     +jack-default-audio-type+
				     +jack-port-is-output+ 0))

(when (null-pointer-p *client*)
  (error "jack server not running?"))

(defcallback process :int ((nframes :uint32) (arg :pointer))
  (declare (ignore arg)
	   (optimize (speed 3)))
  (let ((in (jack-port-get-buffer *input-port* nframes))
	(out (jack-port-get-buffer *output-port* nframes)))
    (iter (for i from 0 below nframes)
        (setf (mem-aref out :float i)
              (coerce (process-sample (mem-aref in :float i))
                      'short-float))))
  0)

(defparameter *gain* 0.5)

(defparameter *rms* 0)

(defun process-sample (in)
  (setf *rms* (+ (* *rms* 0.9999)
                 (* in in 0.0001)))
  (* *gain* in))

(jack-set-process-callback *client* (callback process) (null-pointer))

(jack-activate *client*)

(defun stop-simple ()
  (jack-deactivate *client*)
  (jack-client-close *client*))
