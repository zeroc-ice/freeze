// **********************************************************************
//
// Copyright (c) 2003-2018 ZeroC, Inc. All rights reserved.
//
// **********************************************************************

#ifndef FREEZE_SCRIPT_FUNCTIONS_H
#define FREEZE_SCRIPT_FUNCTIONS_H

#include <FreezeScript/Data.h>

namespace FreezeScript
{

bool invokeGlobalFunction(const Ice::CommunicatorPtr&, const std::string&, const DataList&, DataPtr&,
                          const DataFactoryPtr&, const ErrorReporterPtr&);

bool invokeMemberFunction(const std::string&, const DataPtr&, const DataList&, DataPtr&, const DataFactoryPtr&,
                          const ErrorReporterPtr&);

}

#endif
