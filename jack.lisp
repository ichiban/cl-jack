
(in-package :cl-jack)

(load-foreign-library "/Library/Frameworks/Jackmp.framework/Jackmp")



;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (&body enums)
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
  (options :pointer)
  (status :pointer)
  &rest)

(cffi:defcfun ("jack_client_new" #.(swig-lispify "jack_client_new" 'function)) :pointer
  (client_name :string))

(cffi:defcfun ("jack_client_close" #.(swig-lispify "jack_client_close" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_client_name_size" #.(swig-lispify "jack_client_name_size" 'function)) :int)

(cffi:defcfun ("jack_get_client_name" #.(swig-lispify "jack_get_client_name" 'function)) :string
  (client :pointer))

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
  (arg0 :pointer))

(cffi:defcfun ("jack_is_realtime" #.(swig-lispify "jack_is_realtime" 'function)) :int
  (client :pointer))

(cffi:defcfun ("jack_thread_wait" #.(swig-lispify "jack_thread_wait" 'function)) :pointer
  (arg0 :pointer)
  (status :int))

(cffi:defcfun ("jack_cycle_wait" #.(swig-lispify "jack_cycle_wait" 'function)) :pointer
  (client :pointer))

(cffi:defcfun ("jack_cycle_signal" #.(swig-lispify "jack_cycle_signal" 'function)) :void
  (client :pointer)
  (status :int))

(cffi:defcfun ("jack_set_process_thread" #.(swig-lispify "jack_set_process_thread" 'function)) :int
  (client :pointer)
  (thread_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_thread_init_callback" #.(swig-lispify "jack_set_thread_init_callback" 'function)) :int
  (client :pointer)
  (thread_init_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_on_info_shutdown" #.(swig-lispify "jack_on_info_shutdown" 'function)) :void
  (client :pointer)
  (shutdown_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_process_callback" #.(swig-lispify "jack_set_process_callback" 'function)) :int
  (client :pointer)
  (process_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_freewheel_callback" #.(swig-lispify "jack_set_freewheel_callback" 'function)) :int
  (client :pointer)
  (freewheel_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_buffer_size_callback" #.(swig-lispify "jack_set_buffer_size_callback" 'function)) :int
  (client :pointer)
  (bufsize_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_sample_rate_callback" #.(swig-lispify "jack_set_sample_rate_callback" 'function)) :int
  (client :pointer)
  (srate_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_client_registration_callback" #.(swig-lispify "jack_set_client_registration_callback" 'function)) :int
  (arg0 :pointer)
  (registration_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_port_registration_callback" #.(swig-lispify "jack_set_port_registration_callback" 'function)) :int
  (arg0 :pointer)
  (registration_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_port_connect_callback" #.(swig-lispify "jack_set_port_connect_callback" 'function)) :int
  (arg0 :pointer)
  (connect_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_port_rename_callback" #.(swig-lispify "jack_set_port_rename_callback" 'function)) :int
  (arg0 :pointer)
  (rename_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_graph_order_callback" #.(swig-lispify "jack_set_graph_order_callback" 'function)) :int
  (arg0 :pointer)
  (graph_callback :pointer)
  (arg2 :pointer))

(cffi:defcfun ("jack_set_xrun_callback" #.(swig-lispify "jack_set_xrun_callback" 'function)) :int
  (arg0 :pointer)
  (xrun_callback :pointer)
  (arg :pointer))

(cffi:defcfun ("jack_set_freewheel" #.(swig-lispify "jack_set_freewheel" 'function)) :int
  (client :pointer)
  (onoff :int))

(cffi:defcfun ("jack_set_buffer_size" #.(swig-lispify "jack_set_buffer_size" 'function)) :int
  (client :pointer)
  (nframes :pointer))

(cffi:defcfun ("jack_get_sample_rate" #.(swig-lispify "jack_get_sample_rate" 'function)) :pointer
  (arg0 :pointer))

(cffi:defcfun ("jack_get_buffer_size" #.(swig-lispify "jack_get_buffer_size" 'function)) :pointer
  (arg0 :pointer))

(cffi:defcfun ("jack_engine_takeover_timebase" #.(swig-lispify "jack_engine_takeover_timebase" 'function)) :int
  (arg0 :pointer))

(cffi:defcfun ("jack_cpu_load" #.(swig-lispify "jack_cpu_load" 'function)) :float
  (client :pointer))

(cffi:defcfun ("jack_port_register" #.(swig-lispify "jack_port_register" 'function)) :pointer
  (client :pointer)
  (port_name :string)
  (port_type :string)
  (flags :unsigned-long)
  (buffer_size :unsigned-long))

(cffi:defcfun ("jack_port_unregister" #.(swig-lispify "jack_port_unregister" 'function)) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_port_get_buffer" #.(swig-lispify "jack_port_get_buffer" 'function)) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_port_name" #.(swig-lispify "jack_port_name" 'function)) :string
  (port :pointer))

(cffi:defcfun ("jack_port_short_name" #.(swig-lispify "jack_port_short_name" 'function)) :string
  (port :pointer))

(cffi:defcfun ("jack_port_flags" #.(swig-lispify "jack_port_flags" 'function)) :int
  (port :pointer))

(cffi:defcfun ("jack_port_type" #.(swig-lispify "jack_port_type" 'function)) :string
  (port :pointer))

(cffi:defcfun ("jack_port_type_id" #.(swig-lispify "jack_port_type_id" 'function)) :pointer
  (port :pointer))

(cffi:defcfun ("jack_port_is_mine" #.(swig-lispify "jack_port_is_mine" 'function)) :int
  (arg0 :pointer)
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

(cffi:defcfun ("jack_port_tie" #.(swig-lispify "jack_port_tie" 'function)) :int
  (src :pointer)
  (dst :pointer))

(cffi:defcfun ("jack_port_untie" #.(swig-lispify "jack_port_untie" 'function)) :int
  (port :pointer))

(cffi:defcfun ("jack_port_get_latency" #.(swig-lispify "jack_port_get_latency" 'function)) :pointer
  (port :pointer))

(cffi:defcfun ("jack_port_get_total_latency" #.(swig-lispify "jack_port_get_total_latency" 'function)) :pointer
  (arg0 :pointer)
  (port :pointer))

(cffi:defcfun ("jack_port_set_latency" #.(swig-lispify "jack_port_set_latency" 'function)) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_recompute_total_latency" #.(swig-lispify "jack_recompute_total_latency" 'function)) :int
  (arg0 :pointer)
  (port :pointer))

(cffi:defcfun ("jack_recompute_total_latencies" #.(swig-lispify "jack_recompute_total_latencies" 'function)) :int
  (arg0 :pointer))

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
  (arg0 :pointer)
  (source_port :string)
  (destination_port :string))

(cffi:defcfun ("jack_disconnect" #.(swig-lispify "jack_disconnect" 'function)) :int
  (arg0 :pointer)
  (source_port :string)
  (destination_port :string))

(cffi:defcfun ("jack_port_disconnect" #.(swig-lispify "jack_port_disconnect" 'function)) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_port_name_size" #.(swig-lispify "jack_port_name_size" 'function)) :int)

(cffi:defcfun ("jack_port_type_size" #.(swig-lispify "jack_port_type_size" 'function)) :int)

(cffi:defcfun ("jack_get_ports" #.(swig-lispify "jack_get_ports" 'function)) :pointer
  (arg0 :pointer)
  (port_name_pattern :string)
  (type_name_pattern :string)
  (flags :unsigned-long))

(cffi:defcfun ("jack_port_by_name" #.(swig-lispify "jack_port_by_name" 'function)) :pointer
  (arg0 :pointer)
  (port_name :string))

(cffi:defcfun ("jack_port_by_id" #.(swig-lispify "jack_port_by_id" 'function)) :pointer
  (client :pointer)
  (port_id :pointer))

(cffi:defcfun ("jack_frames_since_cycle_start" #.(swig-lispify "jack_frames_since_cycle_start" 'function)) :pointer
  (arg0 :pointer))

(cffi:defcfun ("jack_frame_time" #.(swig-lispify "jack_frame_time" 'function)) :pointer
  (arg0 :pointer))

(cffi:defcfun ("jack_last_frame_time" #.(swig-lispify "jack_last_frame_time" 'function)) :pointer
  (client :pointer))

(cffi:defcfun ("jack_frames_to_time" #.(swig-lispify "jack_frames_to_time" 'function)) :pointer
  (client :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_time_to_frames" #.(swig-lispify "jack_time_to_frames" 'function)) :pointer
  (client :pointer)
  (arg1 :pointer))

(cffi:defcfun ("jack_get_time" #.(swig-lispify "jack_get_time" 'function)) :pointer)

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


