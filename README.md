Here are some rudimentary common lisp cffi bindings for jack audio connection toolkit.  This worked for me using clozure common lisp on a 32 bit linux machine with jack2 installed from source https://github.com/jackaudio/jack2.git revision 3eb0ae6affbe4cd5038e846ad8e804c80e9cc012 .

Try loading simple.lisp - it should create a simple through client visible using qjackctl or similar which accepts mono audio on the input, then echoes the audio to output a little bit quieter.

* Gain can be adjusted by modifiying cl-jack::*gain*.

* RMS signal level can be monitored by examining cl-jack::*rms*

* Can define #'cl-jack::process-sample to be some other arbitrary function without restarting the jack client.  Try:

(setf *gain* 0)
(defun process-sample (in)
   (* (incf *gain* (/ 441000.0))
      in))

Note: bindings extracted by running swig.sh using swig compiled from:

https://github.com/rick-monster/swig

This may or may not work using swig main branch I haven't tested...