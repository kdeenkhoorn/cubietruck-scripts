broadcom-bluetooth
==================

Required: Bluetooth libraries

Like:

	apt-get install libbluetooth3 libbluetooth-dev

Comment:

This utility is derived from the broadcom-bluetooth tools on Google Code.
I have removed the following part from the code to prevent it from an allmost endless wait:

Original code:

        if (enable_hci) {
                proc_enable_hci();

                while (1) {
                        sleep(UINT_MAX);
                }
        }


New code:

        if (enable_hci) {
                proc_enable_hci();
        }

Reason:

UINT_MAX is a very big value and this results in an endless wait before the program ends if enable_hci is selected.
Why ths is done, don't know, i have asked a question about it on the site of the maker(s).
Meanwhile this is my way of resolving the problem.

Run make to compile.
