PREFIX	= /home/asiris/workbench/pi/wifi/rtl8192eu_rpi2/workbench/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-
CC	= $(PREFIX)g++
INC	= -I.
CFLAGS	= -Wall -O2 -fno-omit-frame-pointer
LIB	= -Lexternal/libconfig -lconfig -Lexternal/wiringPi -lwiringPi -lpthread
#CFLAGS+=-Wall -ggdb 

SRC=client_main.cpp config.cpp

OBJ=$(SRC:.cpp=.o)

%.o: %.cpp
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

.PHONY: all clean

all: shp_client

shp_client: $(OBJ)
	$(CC) -o $@ $^ $(LIB)

clean:
	rm -f *.o shp_client

config.o: config.hpp
client_main.o: config.hpp sensors/sensor_button.hpp sensors/sensor_led.hpp
