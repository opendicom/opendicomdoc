//
//  UID.m
//  httpdicom
//
//  Created by jacquesfauquex on 20180412.
//  Copyright © 2018 opendicom.com. All rights reserved.
//

#import "UID.h"
#import "ODLog.h"

@implementation UID

static unsigned char shorthand[12][12]={
    {0x00,0x00,0x23,0x24,0x25,0x26,0x27,0x28,0x29,0x2A,0x2B,0x2E},
    {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00},
    {0x40,0x41,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x4B,0x4E},
    {0x50,0x51,0x53,0x54,0x55,0x56,0x57,0x58,0x59,0x5A,0x5B,0x5E},
    {0x60,0x61,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x6B,0x6E},
    {0x70,0x71,0x73,0x74,0x75,0x76,0x77,0x78,0x79,0x7A,0x7B,0x7E},
    {0xA0,0xA1,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAE},
    {0xB0,0xB1,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBE},
    {0xC0,0xC1,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCE},
    {0xD0,0xD1,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDE},
    {0xE0,0xE1,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEE},
    {0xF0,0xF1,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFE}
};

static NSString *pair[]={
    @"  ",@" " ,@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",
    @"  ",@" " ,@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",
    @"  ",@" " ,@"  ",@".0",@".1",@".2",@".3",@".4",@".5",@".6",@".7",@".8",@"  ",@"  ",@".9",@"  ",
    @"  ",@" " ,@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",
    @"0.",@"0" ,@"  ",@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"  ",@"  ",@"09",@"  ",
    @"1.",@"1" ,@"  ",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"  ",@"  ",@"19",@"  ",
    @"2.",@"2" ,@"  ",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"  ",@"  ",@"29",@"  ",
    @"3.",@"3" ,@"  ",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"  ",@"  ",@"39",@"  ",
    @"  ",@" " ,@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",
    @"  ",@" " ,@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",@"  ",
    @"4.",@"4" ,@"  ",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"  ",@"  ",@"49",@"  ",
    @"5.",@"5" ,@"  ",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"  ",@"  ",@"59",@"  ",
    @"6.",@"6" ,@"  ",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"  ",@"  ",@"69",@"  ",
    @"7.",@"7" ,@"  ",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"  ",@"  ",@"79",@"  ",
    @"8.",@"8" ,@"  ",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"  ",@"  ",@"89",@"  ",
    @"9.",@"9" ,@"  ",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"  ",@"  ",@"99",@"  "
};


NSData *latin1squeezeuid(char *uid)
{
    //padding
    char *paddeduid=NULL;
    if (strlen(uid)%2)
    {
        paddeduid = malloc(strlen(uid)++);
        strcat(paddeduid,uid);
        strcat(paddeduid,"-");
    }
    else paddeduid=strdup(uid);
    
    NSUInteger length=strlen(paddeduid);
    unsigned char *latin1 = malloc(length/2);
    for (NSUInteger pairindex=0; pairindex<length; pairindex+=2)
    {
        
        latin1[pairindex/2]=shorthand[paddeduid[pairindex]-0x2E][paddeduid[pairindex+1]-0x2E];
    }
    
    
    NSData *result=[NSData dataWithBytes:latin1 length:(length/2)];
    free(paddeduid);
    free(latin1);
    return result;
}


+(NSData*)latin1squeezeofuids:(NSArray*)uidstrings
{
    if (!uidstrings)
    {
        LOG_WARNING(@"[UID latin1squeezeduids:nil]");
        return nil;
    }
    NSUInteger uidcount=[uidstrings count];
    if (!uidcount)
    {
        LOG_WARNING(@"[UID latin1squeezeduids:@[]]");
        return [NSData data];
    }
    NSMutableData *squeezedData=[NSMutableData data];
    unsigned char separator=',';
    //first UID
    [squeezedData appendData:latin1squeezeuid((char*)[[uidstrings[0] dataUsingEncoding:NSISOLatin1StringEncoding]bytes])];
    //next UIDs
    for (NSUInteger i=1; i<uidcount; i++)
    {
        [squeezedData appendBytes:&separator length:1];
        [squeezedData appendData:latin1squeezeuid((char*)[[uidstrings[i] dataUsingEncoding:NSISOLatin1StringEncoding]bytes])];
    }
    return [NSData dataWithData:squeezedData];
}

+(NSString*)stringsqueezeofuids:(NSArray*)uidstrings
{
    return [[NSString alloc]initWithData:[self latin1squeezeofuids:uidstrings] encoding:NSISOLatin1StringEncoding];
}



+(NSArray*)uidsexpandedfromlatin1:(NSData*)latin1data
{
    if (!latin1data) return nil;
    
    NSUInteger latin1length=[latin1data length];
    unsigned char *latin1=(unsigned char *)[latin1data bytes];
    
    
    NSMutableArray *uids=[NSMutableArray array];
    NSMutableString *uidstring = [NSMutableString string];
    for (NSUInteger i=0;i<latin1length;i++)
    {
        //NSLog(@"%X",latin1[i]);
        if (*(latin1+i)==',')
        {
            [uids addObject:[NSString stringWithString:uidstring]];
            [uidstring setString:@""];
        }
        else [uidstring appendString:pair[latin1[i]]];
    }
    [uids addObject:[NSString stringWithString:uidstring]];
    return [NSArray arrayWithArray:uids];
}

+(NSArray*)uidsexpandedfromstring:(NSString*)string
{
    return [self uidsexpandedfromlatin1:[string dataUsingEncoding:NSISOLatin1StringEncoding]];
}
@end
