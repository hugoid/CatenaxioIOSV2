//
//  HIDCeldaTablaCalendarioCell.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/27/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIDCeldaTablaCalendarioCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelJornada;
@property (weak, nonatomic) IBOutlet UILabel *labelFecha;
@property (weak, nonatomic) IBOutlet UILabel *labelHora;
@property (weak, nonatomic) IBOutlet UILabel *labelRival;
@property (weak, nonatomic) IBOutlet UILabel *labelLugar;
@property (weak, nonatomic) IBOutlet UIView *vistaFondo;

+(CGFloat) cellHeight;

+(NSString *) cellId;

@end
