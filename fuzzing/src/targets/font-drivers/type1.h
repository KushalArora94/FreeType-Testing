// type1.h
//
//   Fuzz target for Type 1 faces.
//
// Copyright 2018 by
// Armin Hasitzka.
//
// This file is part of the FreeType project, and may only be used,
// modified, and distributed under the terms of the FreeType project
// license, LICENSE.TXT.  By continuing to use, modify, or distribute
// this file you indicate that you have read the license and
// understand and accept it fully.


#ifndef TARGETS_FONT_DRIVERS_TYPE_1_H_
#define TARGETS_FONT_DRIVERS_TYPE_1_H_


#include "targets/font-drivers/base.h"


  class Type1FuzzTarget
  : public FontDriverFuzzTarget
  {
  public:


    Type1FuzzTarget( void );
  };


#endif // TARGETS_FONT_DRIVERS_TYPE_1_H_