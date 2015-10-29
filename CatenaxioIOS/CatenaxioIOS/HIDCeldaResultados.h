//
//  HIDCeldaResultados.h
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/7/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIDCeldaResultados : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nombreRival;
@property (weak, nonatomic) IBOutlet UILabel *resultado;
@property (weak, nonatomic) IBOutlet UIImageView *imagenResultado;

+(CGFloat) cellHeight;
+(NSString *) cellId;
@end
