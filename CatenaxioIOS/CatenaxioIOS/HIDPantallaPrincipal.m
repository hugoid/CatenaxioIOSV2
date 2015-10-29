//
//  HIDPantallaPrincipal.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/27/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDPantallaPrincipal.h"
#import "HIDCalendario.h"
#import "HIDEstadisticas.h"
#import "HIDLiga.h"
#import "HIDPartidosEmpatados.h"
#import "HIDPartidosPerdidos.h"
#import "HIDPartidosGanados.h"
#import "HIDTablaResultadosTableViewController.h"
#import "HIDTablaConvocatoria.h"

@interface HIDPantallaPrincipal ()

@end

@implementation HIDPantallaPrincipal

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
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushCalendario:(id)sender {
    HIDCalendario *calendario=[[HIDCalendario alloc]init];
    [self.navigationController pushViewController:calendario animated:YES];
}

- (IBAction)pushConvocatoria:(id)sender {
    HIDTablaConvocatoria *tabla=[[HIDTablaConvocatoria alloc]init];
    [self.navigationController pushViewController:tabla animated:YES];
}

- (IBAction)pushEstadisticas:(id)sender {
    HIDEstadisticas *estadisticas=[[HIDEstadisticas alloc]init];
    [self.navigationController pushViewController:estadisticas animated:YES];
}

- (IBAction)pushClasificacion:(id)sender {
    HIDLiga *liga=[[HIDLiga alloc]init];
    //HIDPartidosEmpatados *empatados=[[HIDPartidosEmpatados alloc]init];
    HIDPartidosGanados *ganados=[[HIDPartidosGanados alloc]init];
    HIDPartidosPerdidos *perdidos=[[HIDPartidosPerdidos alloc]init];
    //HIDTablaResultadosTableViewController *resultados=[[HIDTablaResultadosTableViewController alloc]init];
   // UINavigationBar *bar=[[UINavigationBar alloc]init];
    
   
    UITabBarController *tab=[[UITabBarController alloc]init];
    tab.viewControllers=@[liga,ganados];
    [self.navigationController pushViewController:tab animated:YES];
    
}
@end
