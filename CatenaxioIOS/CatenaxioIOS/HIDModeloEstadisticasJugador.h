//
//  HIDModeloEstadisticasJugador.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/29/15.
//  Copyright © 2015 Hugo Izquierdo. All rights reserved.
//

#import "JSONModel.h"

@interface HIDModeloEstadisticasJugador : JSONModel

@property (assign, nonatomic) NSNumber <Optional> *PJ;
@property (assign, nonatomic) NSNumber <Optional> *Goles;
@property (assign, nonatomic) NSNumber <Optional> *Asistencias;
@property (assign, nonatomic) NSNumber <Optional> *PT;
@property (assign, nonatomic) NSNumber <Optional> *PG;
@property (strong, nonatomic) NSString <Optional>* Nombre;


@end
