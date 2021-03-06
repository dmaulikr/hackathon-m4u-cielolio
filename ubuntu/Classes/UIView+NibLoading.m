//
//  UIView+NibLoading.m
//  Fuel
//
//  Created by Toshiro Sugii on 4/8/13.
//  Copyright (c) 2013 Toshiro Sugii. All rights reserved.
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+ (id)viewWithNibName:(NSString*)nibName
{
  NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
  if ([bundle count])
  {
    UIView *view = [bundle objectAtIndex:0];
    if ([view isKindOfClass:self])
    {
      return view;
    }
    NSLog(@"The object in the nib %@ is a %@, not a %@", nibName, [view class], self);
  }
  return nil;
}

@end
