# generate cffi wrapper
cp /usr/local/include/jack/jack.h ./
cp /usr/local/include/jack/midiport.h ./
sed -i -e s/JACK_OPTIONAL_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_DEPRECATED_EXPORT// -e s/JACK_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_DEPRECATED_EXPORT// jack.h
sed -i -e s/JACK_OPTIONAL_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_DEPRECATED_EXPORT// -e s/JACK_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_DEPRECATED_EXPORT// midiport.h
swig -cffi -module jack jack.i
