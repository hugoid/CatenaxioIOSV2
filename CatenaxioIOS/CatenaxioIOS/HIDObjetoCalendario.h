//
//  HIDObjetoCalendario.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/27/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIDObjetoCalendario : NSObject

@property (nonatomic,strong) NSString *jornada;
@property (nonatomic,strong) NSString *fecha;
@property (nonatomic,strong) NSString *hora;
@property (nonatomic,strong) NSString *rival;
@property (nonatomic,strong) NSString *lugar;

-(id) initWithJornada:(NSString *) Jornada
            withFecha:(NSString *) Fecha
             withHora:(NSString *) Hora
            withRival:(NSString *) Rival
            withLugar:(NSString *) Lugar;
@end
