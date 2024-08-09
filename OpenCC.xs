#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <opencc/opencc.h>

MODULE = OpenCC     PACKAGE = OpenCC

PROTOTYPES: DISABLE

bool
opencc_is_valid(cc)
    opencc_t cc
  CODE:
    RETVAL = ((size_t)cc) == ((size_t)-1);
  OUTPUT:
    RETVAL

opencc_t
opencc_open(config)
    const char* config
  CODE:
    RETVAL = opencc_open(config);
  OUTPUT:
    RETVAL

void
opencc_close(cc)
    opencc_t cc
  CODE:
    opencc_close(cc);

SV*
opencc_convert_utf8(cc, input)
    opencc_t cc
    const char* input
  CODE:
    char* result = opencc_convert_utf8(cc, input, strlen(input));
    if (result == (const char*)-1) {
        XSRETURN_UNDEF;
    }
    RETVAL = newSVpv(result, 0);
    opencc_convert_utf8_free(result);
  OUTPUT:
    RETVAL
