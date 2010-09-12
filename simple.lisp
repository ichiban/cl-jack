
(in-package :jack)

(defvar *client* (client-open "simple" 0 (null-pointer)))
(defvar *input-port* (port-register *client* "in"
				    +default-audio-type+
				    +port-is-input+ 0))
(defvar *output-port* (port-register *client* "out"
				     +default-audio-type+
				     +port-is-output+ 0))

(when (null-pointer-p *client*)
  (error "jack server not running?"))

(defcallback process :int ((nframes :uint32) (arg :pointer))
  (declare (ignore arg)
	   (optimize (speed 3)))
  (let ((in (port-get-buffer *input-port* nframes))
	(out (port-get-buffer *output-port* nframes)))
    (iter (for i from 0 below nframes)
	  (setf (mem-aref out :uint8 i) (mem-aref in :uint8 i))))
  0)

(set-process-callback *client* (callback process) (null-pointer))

(activate *client*)
