//
//  HIDObjetoConvocatoria.h
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/8/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIDObjetoConvocatoria : NSObject


@property (nonatomic,strong) NSString *jugador;
@property  int resultado;
@property (nonatomic,strong) UIImage *foto;
@property (nonatomic,strong) UIImage *fotoIcono;


-(id) initWithJugador:(NSString *) Jugador
        withResultado:(int) Resultado   //0 voy 1 no voy 2 duda
             withFoto:(UIImage *) Foto
    withFotoResultado:(UIImage*) FotoIcono;

-(void) modificoResultadoWithFoto:(int) foto;
@end
