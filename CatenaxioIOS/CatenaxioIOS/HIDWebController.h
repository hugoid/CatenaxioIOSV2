//
//  HIDWebController.h
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/5/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HIDWebController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *web;

-(id) initWithGolesAbel:(int) gabel withGolesAnton:(int) ganton withGolesCano:(int) gcano
          withGolesHugo:(int) ghugo withGolesJordan:(int) gjordan withGolesMeri:(int) gmeri
       withGolesJuanito:(int) gjuanito ;
@end
