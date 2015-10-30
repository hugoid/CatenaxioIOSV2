//
//  HIDPartidosResultados.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/29/15.
//  Copyright © 2015 Hugo Izquierdo. All rights reserved.
//

#import "HIDPartidosResultados.h"
#import "HIDCeldaResultados.h"
#import <Parse/Parse.h>
#import "HIDModeloJSONResultado.h"

@interface HIDPartidosResultados ()

@end

@implementation HIDPartidosResultados

static NSMutableArray *celdasResultados;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Resultados";
        //self.tabBarItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Resultados";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"obtener resultados");
    
    [self.indicadorEspera setHidden:YES];
    [self.indicadorEspera stopAnimating];
    
    //insertar botones en la barra de herramientas
    UIBarButtonItem *botonDescargar=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                  target:self
                                                                                  action:@selector(descagarResultadosParse)];
    
    //self.navigationItem.rightBarButtonItem=botonActualizar;
    
    //[self.navigationItem setRightBarButtonItems:@[botonDescargar] animated:YES];
    [self.tabBarController.navigationItem setRightBarButtonItem:botonDescargar];
    
    self.navigationController.title=@"Resultados";
    self.tabBarController.navigationItem.title = @"Liga";
    
    celdasResultados=[[NSMutableArray alloc]init];
    
    UINib *cellNib = [UINib nibWithNibName:@"CeldaResultados"
                                    bundle:nil];
    
    [self.tabla registerNib:cellNib forCellReuseIdentifier:[HIDCeldaResultados cellId]];
    
    self.tabla.delegate=self;
    self.tabla.dataSource=self;
    [self descagarResultadosParse];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [celdasResultados count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"Relleno las celdas");
 
    //tengo un error a la hora de cargar la celda personalizada, dejo una tabla standar para poder mostrar algo
    //tabla customize
    //static NSString *CellIdentifier = [HIDCeldaRTVE2 cellId];
    HIDCeldaResultados *cell = [tableView dequeueReusableCellWithIdentifier:[HIDCeldaResultados cellId]];
    if(cell==nil){
        cell=[[HIDCeldaResultados alloc]init];
    }
    
    //NSLog(@"Mi celda count %@",[[celdasResultados objectAtIndex:indexPath.row] rival]);
    cell.nombreRival.text=[[celdasResultados objectAtIndex:indexPath.row] Rival];
    NSString *golesFavor=[NSString stringWithFormat:@"%@ - %@",[[celdasResultados objectAtIndex:indexPath.row] GF],[[celdasResultados objectAtIndex:indexPath.row] GC]];
    cell.resultado.text=golesFavor;
    cell.jornada.text=[[celdasResultados objectAtIndexedSubscript:indexPath.row] Jornada];
    
    
    if ([[[celdasResultados objectAtIndex:indexPath.row] Indice] isEqualToString:@"G"]) {
        //
        UIImage *imagen=[UIImage imageNamed:@"aprobadoIOS"];
        cell.imagenResultado.image=imagen;
    }
    else if ([[[celdasResultados objectAtIndex:indexPath.row] Indice] isEqualToString:@"P"]) {
        UIImage *imagen=[UIImage imageNamed:@"suspendidoIOS"];
        cell.imagenResultado.image=imagen;
        
    }
    else if ([[[celdasResultados objectAtIndex:indexPath.row] Indice] isEqualToString:@"E"]) {
        UIImage *imagen=[UIImage imageNamed:@"igualIOS"];
        cell.imagenResultado.image=imagen;
    }
    
    
    
    
    // Configure the cell...
    
    return cell;
}

//la altura de la celda

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [HIDCeldaResultados cellHeight];
}

-(void) descagarResultadosParse{
    
    [self.indicadorEspera setHidden:NO];
    [self.indicadorEspera startAnimating];
    PFQuery *query=[PFQuery queryWithClassName:@"Partidos"];
    [query orderByAscending:@"Jornada"];
    
    [query
     findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
         //
         if (!error) {
             NSLog(@"Dscargo %@",objects);
             //
             
             NSMutableArray *listaModeloParseado=[[NSMutableArray alloc]init];
             [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
              
                 NSError* err = nil;
                 PFObject *objetoParse=obj;
                 
                 //NSString *mensaje=[NSString stringWithFormat:@"%@",objetoParse]);
                 NSArray *keys=[objetoParse allKeys];
                 NSString __block *mensajeJSON;
                 NSMutableString __block *mensajeJSONTotal=[[NSMutableString alloc]init];
                 [keys enumerateObjectsUsingBlock:^(id  _Nonnull objKey, NSUInteger idx, BOOL * _Nonnull stop) {
                     if (idx==0) {
                         if ([objKey isEqualToString:@"Rival"] || [objKey isEqualToString:@"Indice"] || [objKey isEqualToString:@"Temporada"]) {
                             mensajeJSON=[NSString stringWithFormat:@"{\"%@\":\"%@\",",objKey,[objetoParse valueForKey:objKey]];
                         }
                         else{
                             mensajeJSON=[NSString stringWithFormat:@"{\"%@\":%@,",objKey,[objetoParse valueForKey:objKey]];
                         }
                         
                     }
                     else{
                         if ([objKey isEqualToString:@"Rival"] || [objKey isEqualToString:@"Indice"] || [objKey isEqualToString:@"Temporada"]) {
                             mensajeJSON=[NSString stringWithFormat:@"\"%@\":\"%@\",",objKey,[objetoParse valueForKey:objKey]];
                         }
                         else{
                             mensajeJSON=[NSString stringWithFormat:@"\"%@\":%@,",objKey,[objetoParse valueForKey:objKey]];
                         }
                         
                     }
                     [mensajeJSONTotal appendString:mensajeJSON];
                 }];
                 [mensajeJSONTotal appendString:@"}"];
                 HIDModeloJSONResultado *estadisticasJugador=[[HIDModeloJSONResultado alloc]initWithString:mensajeJSONTotal error:&err];
                 [listaModeloParseado addObject:estadisticasJugador];
             }];
             int __block goles=0;
             
             
             NSLog(@"mi array es %@",listaModeloParseado);
             celdasResultados=[[NSMutableArray alloc]init];
             celdasResultados=listaModeloParseado;
             [self.tabla reloadData];
             
             UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:@"Estadisticas"
                                                           message:@"Datos Actualizados"
                                                          delegate:nil
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"OK", nil];
             [alerta show];
             [self.indicadorEspera setHidden:YES];
             [self.indicadorEspera stopAnimating];
             
         }
         else{
             NSLog(@"error");
             [self.indicadorEspera setHidden:YES];
             [self.indicadorEspera stopAnimating];
         }
     }];
    
}

@end
