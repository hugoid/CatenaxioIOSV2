//
//  HIDObjetoResultado.h
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/7/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIDObjetoResultado : NSObject

@property (nonatomic,strong) NSString *rival;
@property (nonatomic,strong) NSString *resultado;
@property (nonatomic,strong) NSString *codigo;

-(id) initWithRival:(NSString *) Rival
      withResultado:(NSString *) Resultado
withCodigoResultado:(NSString *) Codigo;
@end
