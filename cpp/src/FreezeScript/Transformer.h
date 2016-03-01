// **********************************************************************
//
// Copyright (c) 2003-2016 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef FREEZE_SCRIPT_TRANSFORMER_H
#define FREEZE_SCRIPT_TRANSFORMER_H

#include <Ice/Ice.h>
#include <Slice/Parser.h>
#include <Freeze/Connection.h>
#include <FreezeScript/Data.h>

class Db;
class DbTxn;

namespace FreezeScript
{

void
transformDatabase(const Ice::CommunicatorPtr&,
                  const FreezeScript::ValueFactoryPtr& valueFactory,
                  const Slice::UnitPtr&, const Slice::UnitPtr&,
                  Db*, Db*, DbTxn*, const Freeze::ConnectionPtr&, const std::string&, const std::string&, bool,
                  std::ostream&, bool, std::istream&);

} // End of namespace FreezeScript

#endif
