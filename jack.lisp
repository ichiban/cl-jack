;;; This file was automatically generated by SWIG (http://www.swig.org).
;;; Version 3.0.3
;;;
;;; Do not make changes to this file unless you know what you are doing--modify
;;; the SWIG interface file instead.

(in-package :cl-jack)

(load-foreign-library "/usr/local/lib/libjack.so")



;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (cl:&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:eval-when (:compile-toplevel :load-toplevel)
  (cl:unless (cl:fboundp 'swig-lispify)
    (cl:defun swig-lispify (name flag cl:&optional (package cl:*package*))
      (cl:labels ((helper (lst last rest cl:&aux (c (cl:car lst)))
                    (cl:cond
                      ((cl:null lst)
                       rest)
                      ((cl:upper-case-p c)
                       (helper (cl:cdr lst) 'upper
                               (cl:case last
                                 ((lower digit) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:lower-case-p c)
                       (helper (cl:cdr lst) 'lower (cl:cons (cl:char-upcase c) rest)))
                      ((cl:digit-char-p c)
                       (helper (cl:cdr lst) 'digit
                               (cl:case last
                                 ((upper lower) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:char-equal c #\_)
                       (helper (cl:cdr lst) '_ (cl:cons #\- rest)))
                      (cl:t
                       (cl:error "Invalid character: ~A" c)))))
        (cl:let ((fix (cl:case flag
                        ((constant enumvalue) "+")
                        (variable "*")
                        (cl:t ""))))
          (cl:intern
           (cl:concatenate
            'cl:string
            fix
            (cl:nreverse (helper (cl:concatenate 'cl:list name) cl:nil cl:nil))
            fix)
           package))))))

;;;SWIG wrapper code ends here


(cffi:defcfun ("jack_get_version" #.(swig-lispify "jack_get_version" 'function)) :void
  (major_ptr :pointer)
  (minor_ptr :pointer)
  (micro_ptr :pointer)
  (proto_ptr :pointer))

(cffi:defcfun ("jack_get_version_string" #.(swig-lispify "jack_get_version_string" 'function)) :string)

(cffi:defcfun ("jack_client_open" #.(swig-lispify "jack_client_open" 'function)) :pointer
  (client_name :string)
  (options jack-options-t)
  (status :pointer)
  &rest)

(cffi:defcfun ("jack_client_close" #.(swig-lispify "jack_client_close" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_client_name_size" #.(swig-lispify "jack_client_name_size" 'function)) :int)

(cffi:defcfun ("jack_get_client_name" #.(swig-lispify "jack_get_client_name" 'function)) :string
  (client :pointer))

(cffi:defcfun ("jack_get_uuid_for_client_name" #.(swig-lispify "jack_get_uuid_for_client_name" 'function)) :string
  (client :pointer)
  (client_name :string))

(cffi:defcfun ("jack_get_client_name_by_uuid" #.(swig-lispify "jack_get_client_name_by_uuid" 'function)) :string
  (client :pointer)
  (client_uuid :string))

(cffi:defcfun ("jack_internal_client_new" #.(swig-lispify "jack_internal_client_new" 'function)) :int
  (client_name :string)
  (load_name :string)
  (load_init :string))

(cffi:defcfun ("jack_internal_client_close" #.(swig-lispify "jack_internal_client_close" 'function)) :void
  (client_name :string))

(cffi:defcfun ("jack_activate" #.(swig-lispify "jack_activate" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_deactivate" #.(swig-lispify "jack_deactivate" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_get_client_pid" #.(swig-lispify "jack_get_client_pid" 'function)) :int
  (name :string))

(cffi:defcfun ("jack_client_thread_id" #.(swig-lispify "jack_client_thread_id" 'function)) :pointer
  (client :pointer))

(cffi:defcfun ("jack_is_realtime" #.(swig-lispify "jack_is_realtime" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_thread_wait" #.(swig-lispify "jack_thread_wait" 'function)) jack-nframes-t
  (client :pointer)
  (status :int))

(cffi:defcfun ("jack_cycle_wait" #.(swig-lispify "jack_cycle_wait" 'function)) jack-nframes-t
  (client :pointer))

(cffi:defcfun ("jack_cycle_signal" #.(swig-lispify "jack_cycle_signal" 'function)) :void
  (client :pointer)
  (status :int))

(cffi:defcfun ("jack_set_process_thread" #.(swig-lispify "jack_set_process_thread" 'function)) :int
  (client :pointer)
  (thread_callback jack-thread-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_thread_init_callback" #.(swig-lispify "jack_set_thread_init_callback" 'function)) :int
  (client :pointer)
  (thread_init_callback jack-thread-init-callback)
  (arg :pointer))

(cffi:defcfun ("jack_on_shutdown" #.(swig-lispify "jack_on_shutdown" 'function)) :void
  (client :pointer)
  (shutdown_callback jack-shutdown-callback)
  (arg :pointer))

(cffi:defcfun ("jack_on_info_shutdown" #.(swig-lispify "jack_on_info_shutdown" 'function)) :void
  (client :pointer)
  (shutdown_callback jack-info-shutdown-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_process_callback" #.(swig-lispify "jack_set_process_callback" 'function)) :int
  (client :pointer)
  (process_callback jack-process-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_freewheel_callback" #.(swig-lispify "jack_set_freewheel_callback" 'function)) :int
  (client :pointer)
  (freewheel_callback jack-freewheel-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_buffer_size_callback" #.(swig-lispify "jack_set_buffer_size_callback" 'function)) :int
  (client :pointer)
  (bufsize_callback jack-buffer-size-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_sample_rate_callback" #.(swig-lispify "jack_set_sample_rate_callback" 'function)) :int
  (client :pointer)
  (srate_callback jack-sample-rate-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_client_registration_callback" #.(swig-lispify "jack_set_client_registration_callback" 'function)) :int
  (client :pointer)
  (registration_callback jack-client-registration-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_port_registration_callback" #.(swig-lispify "jack_set_port_registration_callback" 'function)) :int
  (client :pointer)
  (registration_callback jack-port-registration-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_port_connect_callback" #.(swig-lispify "jack_set_port_connect_callback" 'function)) :int
  (client :pointer)
  (connect_callback jack-port-connect-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_port_rename_callback" #.(swig-lispify "jack_set_port_rename_callback" 'function)) :int
  (client :pointer)
  (rename_callback jack-port-rename-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_graph_order_callback" #.(swig-lispify "jack_set_graph_order_callback" 'function)) :int
  (client :pointer)
  (graph_callback jack-graph-order-callback)
  (arg2 :pointer))

(cffi:defcfun ("jack_set_xrun_callback" #.(swig-lispify "jack_set_xrun_callback" 'function)) :int
  (client :pointer)
  (xrun_callback jack-xrun-callback)
  (arg :pointer))

(cffi:defcfun ("jack_set_latency_callback" #.(swig-lispify "jack_set_latency_callback" 'function)) :int
  (client :pointer)
  (latency_callback jack-latency-callback)
  (arg2 :pointer))

(cffi:defcfun ("jack_set_freewheel" #.(swig-lispify "jack_set_freewheel" 'function)) :int
  (client :pointer)
  (onoff :int))

(cffi:defcfun ("jack_set_buffer_size" #.(swig-lispify "jack_set_buffer_size" 'function)) :int
  (client :pointer)
  (nframes jack-nframes-t))

(cffi:defcfun ("jack_get_sample_rate" #.(swig-lispify "jack_get_sample_rate" 'function)) jack-nframes-t
  (client :pointer))

(cffi:defcfun ("jack_get_buffer_size" #.(swig-lispify "jack_get_buffer_size" 'function)) jack-nframes-t
  (client :pointer))

(cffi:defcfun ("jack_engine_takeover_timebase" #.(swig-lispify "jack_engine_takeover_timebase" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_cpu_load" #.(swig-lispify "jack_cpu_load" 'function)) :float
  (client :pointer))

(cffi:defcfun ("jack_port_register" #.(swig-lispify "jack_port_register" 'function)) :pointer  (client :pointer)
  (port_name :string)
  (port_type :string)
  (flags :unsigned-long)
  (buffer_size :unsigned-long))

(cffi:defcfun ("jack_port_unregister" #.(swig-lispify "jack_port_unregister" 'function)) :int
  (client :pointer)
  (port :pointer))

(cffi:defcfun ("jack_port_get_buffer" #.(swig-lispify "jack_port_get_buffer" 'function)) :pointer
  (port :pointer)
  (nframes jack-nframes-t))

(cffi:defcfun ("jack_port_uuid" #.(swig-lispify "jack_port_uuid" 'function)) jack-uuid-t
  (port :pointer))

(cffi:defcfun ("jack_port_name" #.(swig-lispify "jack_port_name" 'function)) :string
  (port :pointer))

(cffi:defcfun ("jack_port_short_name" #.(swig-lispify "jack_port_short_name" 'function)) :string
  (port :pointer))

(cffi:defcfun ("jack_port_flags" #.(swig-lispify "jack_port_flags" 'function)) :int
  (port :pointer))

(cffi:defcfun ("jack_port_type" #.(swig-lispify "jack_port_type" 'function)) :string
  (port :pointer))

(cffi:defcfun ("jack_port_type_id" #.(swig-lispify "jack_port_type_id" 'function)) jack-port-type-id-t
  (port :pointer))

(cffi:defcfun ("jack_port_is_mine" #.(swig-lispify "jack_port_is_mine" 'function)) :int
  (client :pointer)
  (port :pointer))

(cffi:defcfun ("jack_port_connected" #.(swig-lispify "jack_port_connected" 'function)) :int
  (port :pointer))

(cffi:defcfun ("jack_port_connected_to" #.(swig-lispify "jack_port_connected_to" 'function)) :int
  (port :pointer)
  (port_name :string))

(cffi:defcfun ("jack_port_get_connections" #.(swig-lispify "jack_port_get_connections" 'function)) :pointer
  (port :pointer))

(cffi:defcfun ("jack_port_get_all_connections" #.(swig-lispify "jack_port_get_all_connections" 'function)) :pointer
  (client :pointer)
  (port :pointer))

(cffi:defcfun ("jack_port_set_name" #.(swig-lispify "jack_port_set_name" 'function)) :int
  (port :pointer)
  (port_name :string))

(cffi:defcfun ("jack_port_set_alias" #.(swig-lispify "jack_port_set_alias" 'function)) :int
  (port :pointer)
  (alias :string))

(cffi:defcfun ("jack_port_unset_alias" #.(swig-lispify "jack_port_unset_alias" 'function)) :int
  (port :pointer)
  (alias :string))

(cffi:defcfun ("jack_port_get_aliases" #.(swig-lispify "jack_port_get_aliases" 'function)) :int
  (port :pointer)
  (aliases :pointer))

(cffi:defcfun ("jack_port_request_monitor" #.(swig-lispify "jack_port_request_monitor" 'function)) :int
  (port :pointer)
  (onoff :int))

(cffi:defcfun ("jack_port_request_monitor_by_name" #.(swig-lispify "jack_port_request_monitor_by_name" 'function)) :int
  (client :pointer)
  (port_name :string)
  (onoff :int))

(cffi:defcfun ("jack_port_ensure_monitor" #.(swig-lispify "jack_port_ensure_monitor" 'function)) :int
  (port :pointer)
  (onoff :int))

(cffi:defcfun ("jack_port_monitoring_input" #.(swig-lispify "jack_port_monitoring_input" 'function)) :int
  (port :pointer))

(cffi:defcfun ("jack_connect" #.(swig-lispify "jack_connect" 'function)) :int
  (client :pointer)
  (source_port :string)
  (destination_port :string))

(cffi:defcfun ("jack_disconnect" #.(swig-lispify "jack_disconnect" 'function)) :int
  (client :pointer)
  (source_port :string)
  (destination_port :string))

(cffi:defcfun ("jack_port_disconnect" #.(swig-lispify "jack_port_disconnect" 'function)) :int
  (client :pointer)
  (port :pointer))

(cffi:defcfun ("jack_port_name_size" #.(swig-lispify "jack_port_name_size" 'function)) :int)

(cffi:defcfun ("jack_port_type_size" #.(swig-lispify "jack_port_type_size" 'function)) :int)

(cffi:defcfun ("jack_port_type_get_buffer_size" #.(swig-lispify "jack_port_type_get_buffer_size" 'function)) size-t
  (client :pointer)
  (port_type :string))

(cffi:defcfun ("jack_port_set_latency" #.(swig-lispify "jack_port_set_latency" 'function)) :void
  (port :pointer)
  (nframes :pointer))

(cffi:defcfun ("jack_port_get_latency_range" #.(swig-lispify "jack_port_get_latency_range" 'function)) :void
  (port :pointer)
  (mode jack-latency-callback-mode-t)
  (range :pointer))

(cffi:defcfun ("jack_port_set_latency_range" #.(swig-lispify "jack_port_set_latency_range" 'function)) :void
  (port :pointer)
  (mode jack-latency-callback-mode-t)
  (range :pointer))

(cffi:defcfun ("jack_recompute_total_latencies" #.(swig-lispify "jack_recompute_total_latencies" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_port_get_latency" #.(swig-lispify "jack_port_get_latency" 'function)) jack-nframes-t
  (port :pointer))

(cffi:defcfun ("jack_port_get_total_latency" #.(swig-lispify "jack_port_get_total_latency" 'function)) :pointer
  (client :pointer)
  (port :pointer))

(cffi:defcfun ("jack_recompute_total_latency" #.(swig-lispify "jack_recompute_total_latency" 'function)) :int
  (client :pointer)
  (port :pointer))

(cffi:defcfun ("jack_get_ports" #.(swig-lispify "jack_get_ports" 'function)) :pointer
  (client :pointer)
  (port_name_pattern :string)
  (type_name_pattern :string)
  (flags :unsigned-long))

(cffi:defcfun ("jack_port_by_name" #.(swig-lispify "jack_port_by_name" 'function)) :pointer
  (client :pointer)
  (port_name :string))

(cffi:defcfun ("jack_port_by_id" #.(swig-lispify "jack_port_by_id" 'function)) :pointer
  (client :pointer)
  (port_id :pointer))

(cffi:defcfun ("jack_frames_since_cycle_start" #.(swig-lispify "jack_frames_since_cycle_start" 'function)) :pointer
  (client :pointer))

(cffi:defcfun ("jack_frame_time" #.(swig-lispify "jack_frame_time" 'function)) jack-nframes-t
  (client :pointer))

(cffi:defcfun ("jack_last_frame_time" #.(swig-lispify "jack_last_frame_time" 'function)) :pointer
  (client :pointer))

(cffi:defcfun ("jack_get_cycle_times" #.(swig-lispify "jack_get_cycle_times" 'function)) :int
  (client :pointer)
  (current_frames :pointer)
  (current_usecs :pointer)
  (next_usecs :pointer)
  (period_usecs :pointer))

(cffi:defcfun ("jack_frames_to_time" #.(swig-lispify "jack_frames_to_time" 'function)) :pointer
  (client :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_time_to_frames" #.(swig-lispify "jack_time_to_frames" 'function)) jack-time-t
  (client :pointer)
  (nframes jack-nframes-t))

(cffi:defcfun ("jack_get_time" #.(swig-lispify "jack_get_time" 'function)) jack-time-t)

(cffi:defcvar ("jack_error_callback" #.(swig-lispify "jack_error_callback" 'variable))
 :pointer)

(cffi:defcfun ("jack_set_error_function" #.(swig-lispify "jack_set_error_function" 'function)) :void
  (func :pointer))

(cffi:defcvar ("jack_info_callback" #.(swig-lispify "jack_info_callback" 'variable))
 :pointer)

(cffi:defcfun ("jack_set_info_function" #.(swig-lispify "jack_set_info_function" 'function)) :void
  (func :pointer))

(cffi:defcfun ("jack_free" #.(swig-lispify "jack_free" 'function)) :void
  (ptr :pointer))

(cffi:defcstruct #.(swig-lispify "jack_midi_event_t" 'classname)
	(#.(swig-lispify "time" 'slotname) jack-nframes)
	(#.(swig-lispify "size" 'slotname) size-t)
	(#.(swig-lispify "buffer" 'slotname) jack-midi-data-t))

(cffi:defcfun ("jack_midi_get_event_count" #.(swig-lispify "jack_midi_get_event_count" 'function)) uint32-t
  (port_buffer :pointer))

(cffi:defcfun ("jack_midi_event_get" #.(swig-lispify "jack_midi_event_get" 'function)) :int
  (event :pointer)
  (port_buffer :pointer)
  (event_index uint32-t))

(cffi:defcfun ("jack_midi_clear_buffer" #.(swig-lispify "jack_midi_clear_buffer" 'function)) :void
  (port_buffer :pointer))

(cffi:defcfun ("jack_midi_reset_buffer" #.(swig-lispify "jack_midi_reset_buffer" 'function)) :void
  (port_buffer :pointer))

(cffi:defcfun ("jack_midi_max_event_size" #.(swig-lispify "jack_midi_max_event_size" 'function)) size-t
  (port_buffer :pointer))

(cffi:defcfun ("jack_midi_event_reserve" #.(swig-lispify "jack_midi_event_reserve" 'function)) :pointer
  (port_buffer :pointer)
  (time jack-nframes-t)
  (data_size size-t))

(cffi:defcfun ("jack_midi_event_write" #.(swig-lispify "jack_midi_event_write" 'function)) :int
  (port_buffer :pointer)
  (time jack-nframes-t)
  (data :pointer)
  (data-size size-t))

(cffi:defcfun ("jack_midi_get_lost_event_count" #.(swig-lispify "jack_midi_get_lost_event_count" 'function)) uint32-t
  (port_buffer :pointer))
