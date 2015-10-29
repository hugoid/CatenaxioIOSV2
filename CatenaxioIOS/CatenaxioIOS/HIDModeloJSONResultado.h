//
//  HIDModeloJSONResultado.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/29/15.
//  Copyright © 2015 Hugo Izquierdo. All rights reserved.
//

#import "JSONModel.h"

@interface HIDModeloJSONResultado : JSONModel

@property (strong, nonatomic) NSString <Optional>* Rival;
@property (strong, nonatomic) NSNumber <Optional>* GF;
@property (strong, nonatomic) NSNumber <Optional>* GC;
@property (strong, nonatomic) NSString <Optional>* Indice;
@property (strong, nonatomic) NSString <Optional>* Jornada;
@property (strong, nonatomic) NSString <Optional>* Temporada;

@end
