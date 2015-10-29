//
//  HIDObjetoConvocatoria.m
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/8/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDObjetoConvocatoria.h"

@implementation HIDObjetoConvocatoria


-(id) initWithJugador:(NSString *) Jugador
      withResultado:(int) Resultado   //0 voy 1 no voy 2 duda
       withFoto:(UIImage *) Foto
    withFotoResultado:(UIImage*) FotoIcono


{
    
    if(self=[super init]){
        _resultado=Resultado;
        _jugador=Jugador;
        _foto=Foto;
        _fotoIcono=FotoIcono;
        
    }
    return self;
}

-(void) modificoResultadoWithFoto:(int) foto{
    if (foto==0) { //voy
        self.fotoIcono=[UIImage imageNamed:@"alta"];
    }
    else if(foto==1){ //no voy
        self.fotoIcono=[UIImage imageNamed:@"baja"];
    }
    else if(foto==2){ //duda
        self.fotoIcono=[UIImage imageNamed:@"duda"];
    }
    else{
        self.fotoIcono=[UIImage imageNamed:@"alta"];
    }
  
}



@end
