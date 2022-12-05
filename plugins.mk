THIS := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

SOURCES += $(THIS)nif_helpers.c
$(C_SRC_OUTPUT_FILE): $(THIS)nif_helpers.o

ifeq ($(PLATFORM),msys2)
CFLAGS += -I"$(THIS)/compat/"
endif

CFLAGS += -I"$(THIS)"
ifneq (, $(shell which uname))
  UNAME_A := $(shell uname -a)
  ifneq ($(filter Darwin%, $(UNAME_A)),)
    CFLAGS += -Wno-implicit-function-declaration
  endif
endif
