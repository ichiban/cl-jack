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
        (setf (mem-aref out :float i) (coerce (bar (mem-aref in :float i))
                                              'short-float))))

(defun make-thingy ()
  (let ((i 0))
    (lambda ()
      (incf i 0.0001))))

(defparameter *gain* -3dB)

(defparameter *filter* (aplay-hack::combine (lambda (x)
                                              (* x *gain*))
                                            ;; (aplay-hack::make-biquad-lpf 10k 0.5)
                                            ))
#+nil
(setf *filter*
      (let ((st (make-stereo-limiter :limit -50dB
                                     :release (round (* 100 44.1))
                                     :attack (round (* 0 44.1))
                                     :lookahead (* 10 44.1)))
            (pregain 50dB))
        (combine (lambda (x)
                   (funcall st
                            (* pregain x)
                            (* pregain x))))))

(defparameter *rms* 0)

(defun bar (in)
  (setf *rms* (+ (* *rms* 0.9999)
                 (* in in 0.0001)))
  (* 1.0 (funcall *filter* in)))

(Jack-set-process-callback *client* (callback process) (null-pointer))

(jack-activate *client*)
