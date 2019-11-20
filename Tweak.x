//
//  Tweak.m
//
//  Created by Joshua Seltzer on 11/19/19.
//
//

#ifndef kCFCoreFoundationVersionNumber_iOS_13_0
#define kCFCoreFoundationVersionNumber_iOS_13_0 1665.15
#endif

#define kSLSystemVersioniOS13 kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_13_0

%group iOS13

%hook CRSApplicationIcon

+ (NSString *)localizedDisplayName
{
    return @"";
}

%end

%end // %group iOS13

%group iOS7iOS8iOS9iOS10iOS11iOS12

%hook SBStarkIconView

+ (CGSize)maxLabelSize
{
	return CGSizeZero;
}

%end

%end // %group iOS7iOS8iOS9iOS10iOS11iOS12

%ctor {
    // check which version we are running to determine which group to initialize
    if (kSLSystemVersioniOS13)  {
        %init(iOS13);
    } else {
        %init(iOS7iOS8iOS9iOS10iOS11iOS12);
    }
}