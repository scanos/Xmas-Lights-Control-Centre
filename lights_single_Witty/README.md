This program controls multiple lights on a single witty cloud rather than single lights on multiple witty clouds.
(You can also use multiple witty clouds with multiple lights)/

The Bootstrap / ccs files  may be installed in the app folder or to make it easier, you can use the CDN which I have chosen to do. 
See https://getbootstrap.com/docs/3.4/getting-started/ for options

As before, as well as powering LEDS etc from the output pin of a Witty Cloud , you can power ATTINY chips or similar 
However, for powering devices which draw more current,you should instead use a separate power source for say a motor etc
and use the Witty pin output to switch the devices using a transistor etc.

Also to configure the witty Cloud for multiple switches you need to configure respective pins with PWM types . You may need to run the command SetOption68 1
See https://tasmota.github.io/docs/Lights for more information
Also see https://www.w3schools.com/howto/howto_css_switch.asp for setting up ccs switches
