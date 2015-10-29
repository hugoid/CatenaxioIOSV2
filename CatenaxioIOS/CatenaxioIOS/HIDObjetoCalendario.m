//
//  HIDObjetoCalendario.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/27/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDObjetoCalendario.h"

@implementation HIDObjetoCalendario
-(id) initWithJornada:(NSString *) Jornada
            withFecha:(NSString *) Fecha
             withHora:(NSString *) Hora
            withRival:(NSString *) Rival
            withLugar:(NSString *) Lugar{
    
    if(self=[super init]){
        _jornada=Jornada;
        _fecha=Fecha;
        _hora=Hora;
        _rival=Rival;
        _lugar=Lugar;
    }
    return self;
}



@end
