//
//  HIDWebController.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/5/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDWebController.h"

@interface HIDWebController ()

@end

@implementation HIDWebController

int golesAbel=0;
int golesAnton=0;
int golesCano=0;
int golesHugo=0;
int golesJordan=0;
int golesJuanito=0;
int golesMeri=0;


-(id) initWithGolesAbel:(int) gabel withGolesAnton:(int) ganton withGolesCano:(int) gcano
          withGolesHugo:(int) ghugo withGolesJordan:(int) gjordan withGolesMeri:(int) gmeri
       withGolesJuanito:(int) gjuanito{
    
    if(self=[super init]){
        golesAbel=gabel;
        golesAnton=ganton;
        golesCano=gcano;
        golesHugo=ghugo;
        golesJordan=gjordan;
        golesJuanito=gjuanito;
        golesMeri=gmeri;
        
        
    }
    
    return self;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *fullURL = @"http://hidandroid.hol.es/catenaxio/chart_goles.html?";
    NSURL *url = [NSURL URLWithString:fullURL];
    
    
    
    
    //creamos el String
    NSString *abel=[NSString stringWithFormat:@"abel=%d",golesAbel];
    NSString *anton=[NSString stringWithFormat:@"&jesus=%d",golesAnton];
    NSString *cano=[NSString stringWithFormat:@"&cano=%d",golesCano];
    NSString *hugo=[NSString stringWithFormat:@"&hugo=%d",golesHugo];
    NSString *jordan=[NSString stringWithFormat:@"&jordan=%d",golesJordan];
    NSString *meri=[NSString stringWithFormat:@"&meri=%d",golesMeri];
    NSString *juanito=[NSString stringWithFormat:@"&juanito=%d",golesJuanito];
    NSString *stringTotal=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",fullURL,abel,anton,cano,hugo,jordan,meri,juanito];
    
     NSURL *urltotal = [NSURL URLWithString:stringTotal];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:urltotal];
    [self.web loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
