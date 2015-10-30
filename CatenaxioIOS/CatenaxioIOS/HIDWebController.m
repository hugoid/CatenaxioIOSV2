//
//  HIDWebController.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/5/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDWebController.h"
#import "HIDModeloEstadisticasJugador.h"

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
static NSMutableArray *listaGoles;

static Boolean mostrarGoles=false;

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

-(id) initWithListaGoles:(NSArray *) miLista{
    if(self=[super init]){
        listaGoles=[[NSMutableArray alloc]init];
        listaGoles=miLista;
        mostrarGoles=true;
        
    }
    
    return self;
}

-(id) initWithListaAsistencias:(NSArray *) miLista{
    if(self=[super init]){
        listaGoles=[[NSMutableArray alloc]init];
        listaGoles=miLista;
        mostrarGoles=false;
        
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
    //version anterior
    /*NSString *fullURL = @"http://hidandroid.hol.es/catenaxio/chart_goles.html?";
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
    [self.web loadRequest:requestObj];*/
}

-(void) viewWillAppear:(BOOL)animated{
    //version nueva del java script
    
    NSString *path;
    NSBundle *thisBundle = [NSBundle mainBundle];
    
    
    path = [thisBundle pathForResource:@"ejemplo3" ofType:@"html"];
    NSURL *instructionsURL = [NSURL fileURLWithPath:path];
    [self.web loadRequest:[NSURLRequest requestWithURL:instructionsURL]];
    
    // NSString * jsCallBack = [NSString stringWithFormat:@"myFunction()"];
    //[self.visorWeb stringByEvaluatingJavaScriptFromString:jsCallBack];
    
    //[self.visorWeb stringByEvaluatingJavaScriptFromString:@"myFunction()"];
    self.web.delegate=self;
    [self.web setScalesPageToFit:true];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //NSString *mipeticionPrueba=[NSString stringWithFormat:@"myFunction2('%@','%@')",@"hola",@"xx"];
    //[self.web stringByEvaluatingJavaScriptFromString:mipeticionPrueba];
    
    
    int __block abelG=20;
    int __block abelD=1;
    int __block jordan=2;
    int __block anton=3;
    int __block cano=4;
    int __block meri=5;
    int __block hugo=6;
    int __block juanma=7;
    int __block juan=8;
    int __block invitado=0;
    
    NSString *key=@"Goles";
    if (!mostrarGoles) {
        key=@"Asistencias";
    }
    
    [listaGoles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        HIDModeloEstadisticasJugador *jugador=obj;
        if ([jugador.Nombre isEqualToString:@"AbelG"]) {
            abelG=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"AbelD"]) {
            abelD=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Jordan"]) {
            jordan=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Anton"]) {
            anton=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Cano"]) {
            cano=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Meri"]) {
            meri=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Hugo"]) {
            hugo=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Juanma"]) {
            juanma=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"Juan"]) {
            juan=[[jugador valueForKey:key] intValue];
        }
        else if ([jugador.Nombre isEqualToString:@"ZInvitado"]) {
            invitado=[[jugador valueForKey:key] intValue];
        }
    }];
    
    NSString *titulo=@"Goles";
    if (!mostrarGoles) {
        titulo=@"Asistencias";
    }
    NSString *peticion=[NSString stringWithFormat:@"drawChart(%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,'%@')",abelG,abelD,jordan,anton,cano,meri,hugo,juanma,juan,invitado,titulo];
    [self.web stringByEvaluatingJavaScriptFromString:peticion];
  

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
