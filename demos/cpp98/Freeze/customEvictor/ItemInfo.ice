//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#pragma once

//
// Data types persisted in the Freeze database
//
module Warehouse
{

struct ItemInfo
{
    string description;
    float unitPrice;
    int quantityInStock;
    string filler;
}

}
