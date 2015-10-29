//
//  HIDCeldaResultados.m
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/7/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDCeldaResultados.h"

@implementation HIDCeldaResultados

+(CGFloat) cellHeight{
    return 58.f;
}
+(NSString *) cellId{
    return NSStringFromClass(self);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
