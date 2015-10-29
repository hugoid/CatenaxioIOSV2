//
//  HIDCeldaEstadisticaCell.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/28/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIDCeldaEstadisticaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelPartidosTotales;
@property (weak, nonatomic) IBOutlet UILabel *labelPartidosJugados;
@property (weak, nonatomic) IBOutlet UILabel *labelPartidosGanados;
@property (weak, nonatomic) IBOutlet UILabel *labelGoles;
@property (weak, nonatomic) IBOutlet UILabel *labelPorcentajeGoles;
@property (weak, nonatomic) IBOutlet UILabel *labelAsistencias;
@property (weak, nonatomic) IBOutlet UIImageView *imagenPhoto;

+(CGFloat) cellHeight;

+(NSString *) cellId;
@end
