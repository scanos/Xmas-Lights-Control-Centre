The code is different from the main program as it control different lights on a single witty cloud rather than individual wifi chips.
The ccs files  / cgi-bin folder etc are teh same as the main xmas_lights program. As before, you can power ATTINY chips from the output pin of a Witty although, 
for powering devices which draw more current, you should connect the Witty pin output to the base of a transistor and use a separate powe source.

Also to configure the witty Cloud for multiple switches you need to configure respective pins with PWM types . You may need to run the command SetOption68 1
See https://tasmota.github.io/docs/Lights for more information
