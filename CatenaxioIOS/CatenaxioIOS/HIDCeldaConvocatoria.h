//
//  HIDCeldaConvocatoria.h
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/8/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIDCeldaConvocatoria : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *fotoJugador;
@property (weak, nonatomic) IBOutlet UIImageView *fotoIcono;


+(CGFloat) cellHeight;
+(NSString *) cellId;

@end
