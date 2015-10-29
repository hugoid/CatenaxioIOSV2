//
//  HIDObjetoEstadisticas.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/28/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIDObjetoEstadisticas : NSObject

@property (nonatomic,strong) NSString *totales2;
@property (nonatomic,strong) NSString *jugados2;
@property (nonatomic,strong) NSString *ganados2;
@property (nonatomic,strong) NSString *goles2;
@property (nonatomic,strong) NSString *porcentaje2;
@property (nonatomic,strong) NSString *asistencia2;
@property (nonatomic,strong) UIImage *jugador2;

-(id) initWithJugador:(UIImage *) Jugador
          withTotales:(NSString *) PartidosTotales
          withJugados:(NSString *) PartidosJugados
          withGanados:(NSString *) PartidosGanados
            withGoles:(NSString *) Goles
       withPorcentaje:(NSString *) Porcentaje
       withAsistencia:(NSString *) Asistencia;

-(void) modificowithTotales:(NSString *) PartidosTotales
          withJugados:(NSString *) PartidosJugados
          withGanados:(NSString *) PartidosGanados
            withGoles:(NSString *) Goles
       withPorcentaje:(NSString *) Porcentaje
       withAsistencia:(NSString *) Asistencia;
-(void) calcularPorcentajeWithGoles:(float) goles;
@end
