//
//  HIDObjetoResultado.m
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/7/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDObjetoResultado.h"

@implementation HIDObjetoResultado

-(id) initWithRival:(NSString *) Rival
      withResultado:(NSString *) Resultado
withCodigoResultado:(NSString *) Codigo


{
    
    if(self=[super init]){
        _resultado=Resultado;
        _rival=Rival;
        _codigo=Codigo;
        
    }
    return self;
}

@end
