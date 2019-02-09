PROGRAM = skimmer_sensor

EXTRA_COMPONENTS = \
	extras/http-parser \
	$(abspath ../../components/wolfssl) \
	$(abspath ../../components/cJSON) \
	$(abspath ../../components/homekit)

SENSOR_PIN ?= 4

FLASH_SIZE ?= 32

EXTRA_CFLAGS += -I../.. -DHOMEKIT_SHORT_APPLE_UUIDS -DSENSOR_PIN=$(SENSOR_PIN)

include $(SDK_PATH)/common.mk

monitor:
	$(FILTEROUTPUT) --port $(ESPPORT) --baud 9600 --elf $(PROGRAM_OUT)
