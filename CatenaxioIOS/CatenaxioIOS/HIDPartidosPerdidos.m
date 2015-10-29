//
//  HIDPartidosPerdidos.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/28/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDPartidosPerdidos.h"

@interface HIDPartidosPerdidos ()

@end

@implementation HIDPartidosPerdidos

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Perdidos";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *botonDescargar=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                  target:self
                                                                                  action:@selector(downloadResultados:)];
    
    //self.navigationItem.rightBarButtonItem=botonActualizar;
    
    //[self.navigationItem setRightBarButtonItems:@[botonDescargar] animated:YES];
    [self.tabBarController.navigationItem setRightBarButtonItem:botonDescargar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) downloadResultados:(id) sender{
    NSString *link =@"http://hidandroid.hol.es/catenaxio/obtener_resultados.php";
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:link]];
    int __block abel=0;
    int __block  cano=0;
    int __block jesus=0;
    int __block hugo=0;
    int __block jordan=0;
    int __block juanito=0;
    int __block meri=0;
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               
                               
                               
                               NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                               NSDictionary *notesJSON =[NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingAllowFragments
                                                                                          error:&connectionError];
                               NSLog(@"Resultados: %d",[notesJSON count]);
                               
                               [notesJSON enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                                   //
                                   //if ([[obj objectForKey:@"jugador"] isEqualToString:@"Abel"]) {
                                   
                                   NSLog(@"El objeto filtro %@",obj  );
                                   //numero de objetos
                                   int partidos=[obj count];
                                   for (id x in obj) {
                                       //
                                       NSLog(@"El resultado es: %@",x);
                                       if ([[x objectForKey:@"GPE"] isEqualToString:@"P"]) {
                                           abel=abel+[[x objectForKey:@"Abel"] integerValue];
                                           cano=cano+[[x objectForKey:@"Cano"] integerValue];
                                           hugo=hugo+[[x objectForKey:@"Hugo"] integerValue];
                                           meri=meri+[[x objectForKey:@"Meri"] integerValue];
                                           jesus=jesus+[[x objectForKey:@"Jesus"] integerValue];
                                           juanito=juanito+[[x objectForKey:@"Juanito"] integerValue];
                                           jordan=jordan+[[x objectForKey:@"Jordan"] integerValue];
                                       }
                                       
                                   }
                                   [self CreoGraficaWithAbel:abel
                                                   withAnton:jesus
                                                    withCano:cano
                                                    withHugo:hugo
                                                  withJordan:jordan
                                                 withJuanito:juanito
                                                    withMeri:meri];
                                   
                                   
                                   
                               }];
                               
                           }];
    
}
-(void) CreoGraficaWithAbel:(int) abel withAnton:(int) anton withCano:(int) cano withHugo:(int) hugo withJordan:(int) jordan withJuanito:(int) juanito withMeri:(int) meri{
    
    NSString *fullURL = @"http://hidandroid.hol.es/catenaxio/chart_perdidos.html?";
    NSURL *url = [NSURL URLWithString:fullURL];
    
    
    
    
    //creamos el String
    NSString *Abel=[NSString stringWithFormat:@"abel=%d",abel];
    NSString *Anton=[NSString stringWithFormat:@"&jesus=%d",anton];
    NSString *Cano=[NSString stringWithFormat:@"&cano=%d",cano];
    NSString *Hugo=[NSString stringWithFormat:@"&hugo=%d",hugo];
    NSString *Jordan=[NSString stringWithFormat:@"&jordan=%d",jordan];
    NSString *Meri=[NSString stringWithFormat:@"&meri=%d",meri];
    NSString *Juanito=[NSString stringWithFormat:@"&juanito=%d",juanito];
    NSString *stringTotal=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",fullURL,Abel,Anton,Cano,Hugo,Jordan,Meri,Juanito];
    
    NSURL *urltotal = [NSURL URLWithString:stringTotal];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:urltotal];
    [self.visorWeb loadRequest:requestObj];
    
}

@end
