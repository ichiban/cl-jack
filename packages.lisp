(in-package :cl-user)

(defpackage :cl-jack
  (:use :cl
	:cffi)
  (:export :jack-client-open
           :jack-port-register
           :jack-port-unregister
           :jack-port-get-buffer
           :jack-set-process-callback
           :jack-set-xrun-callback
           :jack-cpu-load
           :jack-port-name
           :jack-port-type
           :jack-port-type-id
           :jack-port-is-mine
           :jack-port-connected
           :jack-port-connected-to
           :jack-port-get-connection
           :jack-port-get-all-connections
           :jack-port-set-name
           :jack-connect
           :jack-disconnect
           :jack-port-get-latency
           :jack-get-ports
           :jack-port-by-name
           :jack-port-by-id
           :jack-get-time
           :jack-free

           :jack-nframes-t
           :size-t
           :jack-midi-data-t
           :uint32-t
           :uint-64-t
           :jack-time-t

           :jack-deactivate
           :jack-client-close
           :+jack-default-audio-type+
           :+jack-port-is-output+
           :+jack-port-is-input+

           :jack-midi-get-event-count
           :jack-midi-event-get
           :jack-midi-clear-buffer
           :jack-midi-reset-buffer
           :jack-midi-max-event-size
           :jack-midi-event-reserve
           :jack-midi-event-write
           :jack-midi-get-lost-event-count
           ))
