//
//  HIDObjetoEstadisticas.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/28/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDObjetoEstadisticas.h"

@implementation HIDObjetoEstadisticas

-(id) initWithJugador:(UIImage *) Jugador
          withTotales:(NSString *) PartidosTotales
          withJugados:(NSString *) PartidosJugados
          withGanados:(NSString *) PartidosGanados
            withGoles:(NSString *) Goles
       withPorcentaje:(NSString *) Porcentaje
       withAsistencia:(NSString *) Asistencia


{
    
    if(self=[super init]){
        _jugador2=Jugador;
        _totales2=PartidosTotales;
        _jugados2=PartidosJugados;
        _ganados2=PartidosGanados;
        _goles2=Goles;
        _porcentaje2=Porcentaje;
        _asistencia2=Asistencia;
        
    }
    return self;
}

-(void) modificowithTotales:(NSString *) PartidosTotales
              withJugados:(NSString *) PartidosJugados
              withGanados:(NSString *) PartidosGanados
                withGoles:(NSString *) Goles
           withPorcentaje:(NSString *) Porcentaje
           withAsistencia:(NSString *) Asistencia{
    self.totales2=PartidosTotales;
    self.ganados2=PartidosGanados;
    self.jugados2=PartidosJugados;
    self.porcentaje2=Porcentaje;
    self.goles2=Goles;
    self.asistencia2=Asistencia;
    
    
}
-(void) calcularPorcentajeWithGoles:(float) goles{
    float porcentaje=[self.goles2 floatValue] /goles;
    NSString *stringPorcentaje=[NSString stringWithFormat:@"%.1f",porcentaje];
    self.porcentaje2=stringPorcentaje;
}
@end
