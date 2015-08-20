(in-package :cl-jack)

(defconstant +jack-port-is-input+ #x01)
(defconstant +jack-port-is-output+ #x02)
(defconstant +jack-port-is-physical+ #x04)

(defconstant +max-frames+ 4294967295)
(defconstant +load-init-limit+ 1024)

(defconstant +jack-default-audio-type+ "32 bit float mono audio")
(defconstant +jack-default-midi-type+ "8 bit raw midi")

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
    (foo in out nframes))
  0)

(defun foo (in out nframes)
  (iter (for i from 0 below nframes)
        (setf (mem-aref out :float i) (bar (mem-aref in :float i)))))

(defun bar (in)
  (* in 0.0))

(jack-set-process-callback *client* (callback process) (null-pointer))

(jack-activate *client*)
