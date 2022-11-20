//
//  UVLib.h
//  UVLib
//
//  Created by Raees Kattali on 11/11/2022.
//

#import <Foundation/Foundation.h>

//! Project version number for UVLib.
FOUNDATION_EXPORT double UVLibVersionNumber;

//! Project version string for UVLib.
FOUNDATION_EXPORT const unsigned char UVLibVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UVLib/PublicHeader.h>

void uv_start_echo_server(const char *ip, int port);
