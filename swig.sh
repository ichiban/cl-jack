# generate cffi wrapper
cp /usr/local/include/jack/jack.h ./
sed -i -e s/JACK_OPTIONAL_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_DEPRECATED_EXPORT// -e s/JACK_WEAK_EXPORT// -e s/JACK_OPTIONAL_WEAK_DEPRECATED_EXPORT// jack.h
swig -cffi -module jack jack.i
