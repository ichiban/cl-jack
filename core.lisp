(in-package :cl-jack)

(defconstant +jack-port-is-input+ #x01)
(defconstant +jack-port-is-output+ #x02)
(defconstant +jack-port-is-physical+ #x04)

(defconstant +max-frames+ 4294967295)
(defconstant +load-init-limit+ 1024)

(defconstant +jack-default-audio-type+ "32 bit float mono audio")
(defconstant +jack-default-midi-type+ "8 bit raw midi")

(cffi:defctype uint32-t :uint32)
(cffi:defctype uint64-t :uint64)

(cffi:defctype size-t uint32-t)
(cffi:defctype jack-midi-data-t :uchar)

(cffi:defctype jack-nframes-t uint32-t)
(cffi:defctype jack-time-t uint64-t)

(cffi:defctype jack-thread-callback :pointer)
(cffi:defctype jack-thread-init-callback :pointer)
(cffi:defctype jack-shutdown-callback :pointer)
(cffi:defctype jack-process-callback :pointer)
(cffi:defctype jack-buffer-size-callback :pointer)
(cffi:defctype jack-sample-rate-callback :pointer)
(cffi:defctype jack-client-registration-callback :pointer)
(cffi:defctype jack-port-registration-callback :pointer)
(cffi:defctype jack-port-connect-callback :pointer)
(cffi:defctype jack-port-rename-callback :pointer)
(cffi:defctype jack-graph-order-callback :pointer)
(cffi:defctype jack-xrun-callback :pointer)
(cffi:defctype jack-latency-callback :pointer)
(cffi:defctype jack-info-shutdown-callback :pointer)
(cffi:defctype jack-freewheel-callback :pointer)

(cffi:defctype jack-uuid-t :uint64)
(cffi:defctype jack-port-type-id-t :uint64)


(cffi:defctype jack-latency-callback-mode-t :pointer);;FIXME - probably borked
(cffi:defctype jack-options-t :pointer)
