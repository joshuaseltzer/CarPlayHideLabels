//
//  Tweak.m
//
//  Created by Joshua Seltzer on 11/19/19.
//
//

#import <UIKit/UIKit.h>
#import <version.h>

%group modern

%hook CARIconView

+ (CGSize)maxLabelSizeForIconImageSize:(CGSize)imageSize
{
    return CGSizeZero;
}

%end

%end // %group modern

%group legacy

%hook SBStarkIconView

+ (CGSize)maxLabelSize
{
	return CGSizeZero;
}

%end

%end // %group legacy


%ctor {
    if (IS_IOS_OR_NEWER(iOS_13_0)) {
        %init(modern);
    } else {
        %init(legacy);
    }
}