//
//  UMM2PATask_Data.m
//  ulibm2pa
//
//  Created by Andreas Fink on 02.12.14.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.

#import "UMM2PATask_Data.h"
#import "UMLayerM2PA.h"
#import "UMLayerM2PAUserProtocol.h"

@implementation UMM2PATask_Data
@synthesize data;
@synthesize ackRequest;

- (UMM2PATask_Data *)initWithReceiver:(UMLayerM2PA *)rx
                               sender:(id<UMLayerM2PAUserProtocol>)tx
                                 data:(NSData *)d
                           ackRequest:(NSDictionary *)ack;
{
    self = [super initWithName:[[self class]description]  receiver:rx sender:tx requiresSynchronisation:NO];
    if(self)
    {
        self.data = d;
        self.ackRequest = ack;
        self.receiver = rx;
    }
    return self;
}

- (void)main
{
    UMLayerM2PA *link = (UMLayerM2PA *)self.receiver;
    [link _dataTask:self];
}

@end
