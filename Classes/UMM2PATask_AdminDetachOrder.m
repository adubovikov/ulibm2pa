//
//  UMM2PATask_AdminDetachOrder.m
//  ulibm2pa
//
//  Created by Andreas Fink on 03/12/14.
//  Copyright (c) 2016 Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.

#import <ulibsctp/ulibsctp.h>
#import "UMM2PATask_AdminDetachOrder.h"
#import "UMLayerM2PA.h"
#import "UMLayerM2PAUserProtocol.h"

@implementation UMM2PATask_AdminDetachOrder

@synthesize userId;

- (UMM2PATask_AdminDetachOrder *)initWithReceiver:(UMLayerM2PA *)rx
                                           sender:(id<UMLayerM2PAUserProtocol>)tx
                                           userId:(id)uid
{
    self = [super initWithName:[[self class]description]  receiver:rx sender:tx requiresSynchronisation:NO];
    if(self)
    {
        self.userId = uid;
    }
    return self;
}

- (void)main
{
    UMLayerM2PA *link = (UMLayerM2PA *)self.receiver;
    [link _adminDetachOrderTask:self];
}

@end
