//
//  HIDEstadisticas.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/27/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDEstadisticas.h"
#import "HIDObjetoEstadisticas.h"
#import "HIDCeldaEstadisticaCell.h"
#import "HIDWebController.h"
#import <Parse/Parse.h>
#import "HIDModeloEstadisticasJugador.h"
#import "HIDPartidosGanados.h"
@interface HIDEstadisticas ()

@end

@implementation HIDEstadisticas

NSMutableArray *celdasEstadisticas;
NSMutableArray *listaDescargada;
HIDObjetoEstadisticas *abel;
HIDObjetoEstadisticas *anton;
HIDObjetoEstadisticas *cano;
HIDObjetoEstadisticas *hugo;
HIDObjetoEstadisticas *jordan;
HIDObjetoEstadisticas *juanito;
HIDObjetoEstadisticas *meri;
HIDObjetoEstadisticas *fer;
HIDObjetoEstadisticas *abelD;
HIDObjetoEstadisticas *juanma;
UIActivityIndicatorView *indicador;
int golesTotales=0;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
         NSError* err = nil;
        NSString *stringAbelD=@"{\"Nombre\":\"AbelD\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadorAbelD=[[HIDModeloEstadisticasJugador alloc]initWithString:stringAbelD error:&err];
        
        NSString *stringAbel=@"{\"Nombre\":\"AbelG\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
       
        HIDModeloEstadisticasJugador *estadisticasJugadorAbel=[[HIDModeloEstadisticasJugador alloc]initWithString:stringAbel error:&err];
        
        
        
        NSString *stringJordan=@"{\"Nombre\":\"Jordan\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoJordan=[[HIDModeloEstadisticasJugador alloc]initWithString:stringJordan error:&err];
        
        NSString *stringAnton=@"{\"Nombre\":\"Anton\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoAnton=[[HIDModeloEstadisticasJugador alloc]initWithString:stringAnton error:&err];
        
        NSString *stringCano=@"{\"Nombre\":\"Cano\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoCano=[[HIDModeloEstadisticasJugador alloc]initWithString:stringCano error:&err];
        
        NSString *stringMeri=@"{\"Nombre\":\"Meri\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoMeri=[[HIDModeloEstadisticasJugador alloc]initWithString:stringMeri error:&err];
        
        NSString *stringHugo=@"{\"Nombre\":\"Hugo\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoHugo=[[HIDModeloEstadisticasJugador alloc]initWithString:stringHugo error:&err];
        
        NSString *stringJuanma=@"{\"Nombre\":\"Juanma\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoJuanma=[[HIDModeloEstadisticasJugador alloc]initWithString:stringJuanma error:&err];
        
        NSString *stringJuan=@"{\"Nombre\":\"Juan\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoJuan=[[HIDModeloEstadisticasJugador alloc]initWithString:stringJuan error:&err];
        
        NSString *stringInvitado=@"{\"Nombre\":\"ZInvitado\",\"PT\":0,\"PJ\":0,\"PG\":0,\"Goles\":0,\"Asistencias\":0}";
        HIDModeloEstadisticasJugador *estadisticasJugadoInvitado=[[HIDModeloEstadisticasJugador alloc]initWithString:stringInvitado error:&err];
        
        listaDescargada=[[NSMutableArray alloc]init];
        [listaDescargada addObject:estadisticasJugadorAbel];
        [listaDescargada addObject:estadisticasJugadorAbelD];
        [listaDescargada addObject:estadisticasJugadoJordan];
        [listaDescargada addObject:estadisticasJugadoAnton];
        [listaDescargada addObject:estadisticasJugadoCano];
        [listaDescargada addObject:estadisticasJugadoMeri];
        [listaDescargada addObject:estadisticasJugadoHugo];
        [listaDescargada addObject:estadisticasJugadoJuanma];
        [listaDescargada addObject:estadisticasJugadoJuan];
        [listaDescargada addObject:estadisticasJugadoInvitado];
        
        
        
        /*
        celdasEstadisticas=[[NSMutableArray alloc]initWithCapacity:8];
        
        //abel
        //abel
        abel=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"abel"]
                                               withTotales:@"0"
                                               withJugados:@"0"
                                               withGanados:@"0"
                                                 withGoles:@"0"
                                            withPorcentaje:@"0"
                                            withAsistencia:@"0"];
       
        [celdasEstadisticas addObject:abel];
        
        anton=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"anton"]
                                                withTotales:@"0"
                                                withJugados:@"0"
                                                withGanados:@"0"
                                                  withGoles:@"0"
                                             withPorcentaje:@"0"
                                             withAsistencia:@"0"];
        [celdasEstadisticas addObject:anton];
        
        cano=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"hector"]
                                               withTotales:@"0"
                                               withJugados:@"0"
                                               withGanados:@"0"
                                                 withGoles:@"0"
                                            withPorcentaje:@"0"
                                            withAsistencia:@"0"];
        [celdasEstadisticas addObject:cano];
        
        hugo=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"hugo3"]
                                               withTotales:@"0"
                                               withJugados:@"0"
                                               withGanados:@"0"
                                                 withGoles:@"0"
                                            withPorcentaje:@"0"
                                            withAsistencia:@"0"];
        [celdasEstadisticas addObject:hugo];
        
        jordan=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"jordan"]
                                                 withTotales:@"0"
                                                 withJugados:@"0"
                                                 withGanados:@"0"
                                                   withGoles:@"0"
                                              withPorcentaje:@"0"
                                              withAsistencia:@"0"];
        [celdasEstadisticas addObject:jordan];
        
        juanito=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"juanito"]
                                                  withTotales:@"0"
                                                  withJugados:@"0"
                                                  withGanados:@"0"
                                                    withGoles:@"0"
                                               withPorcentaje:@"0"
                                               withAsistencia:@"0"];
        [celdasEstadisticas addObject:juanito];
        
        meri=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"meri"]
                                               withTotales:@"0"
                                               withJugados:@"0"
                                               withGanados:@"0"
                                                 withGoles:@"0"
                                            withPorcentaje:@"0"
                                            withAsistencia:@"0"];
        [celdasEstadisticas addObject:meri];
        
        fer=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"fer"]
                                              withTotales:@"0"
                                              withJugados:@"0"
                                              withGanados:@"0"
                                                withGoles:@"0"
                                           withPorcentaje:@"0"
                                           withAsistencia:@"0"];
        [celdasEstadisticas addObject:fer];
        
        abelD=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"abelD"]
                                              withTotales:@"0"
                                              withJugados:@"0"
                                              withGanados:@"0"
                                                withGoles:@"0"
                                           withPorcentaje:@"0"
                                           withAsistencia:@"0"];
        [celdasEstadisticas addObject:abelD];
        
        juanma=[[HIDObjetoEstadisticas alloc]initWithJugador:[UIImage imageNamed:@"juanma"]
                                                withTotales:@"0"
                                                withJugados:@"0"
                                                withGanados:@"0"
                                                  withGoles:@"0"
                                             withPorcentaje:@"0"
                                             withAsistencia:@"0"];
        [celdasEstadisticas addObject:juanma];*/
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    golesTotales=0;
    
    //configuracion de la tabla
    [self.navigationController setNavigationBarHidden:NO];
    //color de la barra
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    //color de las celdas no rellenadas
    [self.tableView setBackgroundColor:[UIColor blackColor]];
    self.title=@"Estadísticas";
    //colo de los botones
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //cambiar textos de la barra color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    
    //insertar botones en la barra de herramientas
    UIBarButtonItem *botonActualizar=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                   target:self
                                                                                   action:@selector(pulsarBotonActualizar:)];
    //self.navigationItem.rightBarButtonItem=botonActualizar;
    
    UIBarButtonItem *botonGrafica=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                   target:self
                                                                                   action:@selector(pulsarBotonGrafica:)];
    //self.navigationItem.rightBarButtonItem=botonActualizar;

    [self.navigationItem setRightBarButtonItems:@[botonActualizar,botonGrafica] animated:YES];
    
    
    UINib *cellNib = [UINib nibWithNibName:@"CeldaEstadisticas"
                                    bundle:nil];
    
    
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[HIDCeldaEstadisticaCell cellId]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [listaDescargada count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HIDCeldaEstadisticaCell *cell = [tableView dequeueReusableCellWithIdentifier:[HIDCeldaEstadisticaCell cellId]];
    if(cell==nil){
        cell=[[HIDCeldaEstadisticaCell alloc]init];
    }
    
    /*cell.labelPartidosTotales.text=[[celdasEstadisticas objectAtIndex:indexPath.row] totales2];
    cell.labelPartidosJugados.text=[[celdasEstadisticas objectAtIndex:indexPath.row] jugados2];
    cell.labelPartidosGanados.text=[[celdasEstadisticas objectAtIndex:indexPath.row] ganados2];
    cell.labelGoles.text=[[celdasEstadisticas objectAtIndex:indexPath.row] goles2];
   cell.labelPorcentajeGoles.text=[[celdasEstadisticas objectAtIndex:indexPath.row] porcentaje2];
    cell.labelAsistencias.text=[[celdasEstadisticas objectAtIndex:indexPath.row] asistencia2];
    
    UIImageView *imagen=[[UIImageView alloc]initWithImage:[[celdasEstadisticas objectAtIndex:indexPath.row] jugador2]];
    
    cell.imagenPhoto.image=imagen.image;*/
    
    
    cell.labelPartidosTotales.text=[NSString stringWithFormat:@"%@",[[listaDescargada objectAtIndex:indexPath.row] PT]];
    cell.labelPartidosJugados.text=[NSString stringWithFormat:@"%@",[[listaDescargada objectAtIndex:indexPath.row] PJ]];
     cell.labelPartidosGanados.text=[NSString stringWithFormat:@"%@",[[listaDescargada objectAtIndex:indexPath.row] PG]];
    cell.labelGoles.text=[NSString stringWithFormat:@"%@",[[listaDescargada objectAtIndex:indexPath.row] Goles]];
    cell.labelAsistencias.text=[NSString stringWithFormat:@"%@",[[listaDescargada objectAtIndex:indexPath.row] Asistencias]];
    cell.labelPorcentajeGoles.text=@"xx";
    
    UIImage *imagen=[self obtenerImagen:[[listaDescargada objectAtIndex:indexPath.row] Nombre]];
    [cell.imagenPhoto setImage:imagen];
    
    //calculo el porcentaje de goles
    float golesJugador=[[[listaDescargada objectAtIndex:indexPath.row] Goles] floatValue];
    if (golesTotales!=0) {
        float porcentaje=golesJugador/golesTotales*100;
        cell.labelPorcentajeGoles.text=[NSString stringWithFormat:@"%.0f",porcentaje];
    }
    else{
        cell.labelPorcentajeGoles.text=@"0";
    }
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [HIDCeldaEstadisticaCell cellHeight];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Eventos botones
-(void) pulsarBotonActualizar:(id) sender{
    NSLog(@"update");
    
    
    indicador=[[UIActivityIndicatorView alloc]init];
    indicador.center=self.view.center;
    [indicador setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    [indicador setColor:[UIColor redColor]];
    [self.view addSubview:indicador];
    [indicador startAnimating];
    
    
    //[self descargarInformacion];
    [self descargarInformacionParse];
    
}

-(void) pulsarBotonGrafica:(id) sender{
    NSLog(@"grafica");
     [self mostrarGraficasParse];
    
}

#pragma mark -Download informatino
-(void) descargarInformacion{
    
    NSString *link =
    @"http://hidandroid.hol.es/catenaxio/obtener_estadisticas.php";
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:link]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               // handle response
                               NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                               NSDictionary *notesJSON =[NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingAllowFragments
                                                                                          error:&connectionError];
                               //NSLog(@"Los datos son %@",notesJSON);
                               [notesJSON enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                                   //
                                   //if ([[obj objectForKey:@"jugador"] isEqualToString:@"Abel"]) {
                                   
                                       NSLog(@"El objeto filtro %@",[obj objectAtIndex:5]);
                                   
                                   //}
                                   
                                   //inserto valores
                                   [abel modificowithTotales:[[obj objectAtIndex:0] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:0] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:0] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:0] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                               withAsistencia:[[obj objectAtIndex:0] objectForKey:@"asistencias"]];
                                   
                                   [anton modificowithTotales:[[obj objectAtIndex:1] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:1] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:1] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:1] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:1] objectForKey:@"asistencias"]];
                                   
                                   [cano modificowithTotales:[[obj objectAtIndex:2] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:2] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:2] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:2] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:2] objectForKey:@"asistencias"]];
                                   
                                   [hugo modificowithTotales:[[obj objectAtIndex:3] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:3] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:3] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:3] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:3] objectForKey:@"asistencias"]];
                                   
                                   [jordan modificowithTotales:[[obj objectAtIndex:4] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:4] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:4] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:4] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:4] objectForKey:@"asistencias"]];
                                   
                                   [juanito modificowithTotales:[[obj objectAtIndex:5] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:5] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:5] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:5] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:5] objectForKey:@"asistencias"]];
                                   
                                   [meri modificowithTotales:[[obj objectAtIndex:6] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:6] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:6] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:6] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:6] objectForKey:@"asistencias"]];
                                   
                                   [fer modificowithTotales:[[obj objectAtIndex:7] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:7] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:7] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:7] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:7] objectForKey:@"asistencias"]];
                                   
                                   //calculo el porcentaje
                                   float golesTotales=[[abel goles2] floatValue]+[[anton goles2] floatValue]+[[cano goles2] floatValue]+[[hugo goles2] floatValue]+[[jordan goles2] floatValue]+[[juanito goles2] floatValue]+[[meri goles2] floatValue]+[[fer goles2] floatValue];
                                   [abel calcularPorcentajeWithGoles:golesTotales];
                                   [anton calcularPorcentajeWithGoles:golesTotales];
                                   [cano calcularPorcentajeWithGoles:golesTotales];
                                   [hugo calcularPorcentajeWithGoles:golesTotales];
                                   [jordan calcularPorcentajeWithGoles:golesTotales];
                                   [juanito calcularPorcentajeWithGoles:golesTotales];
                                   [meri calcularPorcentajeWithGoles:golesTotales];
                                   [fer calcularPorcentajeWithGoles:golesTotales];
                                   [self.tableView reloadData];
                                   
                                   UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:@"Estadisticas"
                                                                                 message:@"Datos Actualizados"
                                                                                delegate:nil
                                                                       cancelButtonTitle:nil
                                                                       otherButtonTitles:@"OK", nil];
                                   [alerta show];
                                   [indicador stopAnimating];
                                   
                                   
                               }];
                               
                               
                           }];
    
}

-(void) descargarInformacionParse{
    PFQuery *query=[PFQuery queryWithClassName:@"Jugadores"];
    [query orderByAscending:@"Nombre"];
   
    [query
     findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
         //
         if (!error) {
             NSLog(@"Dscargo %@",objects);
             //
            
             NSMutableArray *listaModeloParseado=[[NSMutableArray alloc]init];
             [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                 //ç
                 NSError* err = nil;
                 PFObject *objetoParse=obj;
                 
                 //NSString *mensaje=[NSString stringWithFormat:@"%@",objetoParse]);
                 NSArray *keys=[objetoParse allKeys];
                 NSString __block *mensajeJSON;
                 NSMutableString __block *mensajeJSONTotal=[[NSMutableString alloc]init];
                 [keys enumerateObjectsUsingBlock:^(id  _Nonnull objKey, NSUInteger idx, BOOL * _Nonnull stop) {
                     if (idx==0) {
                         if ([objKey isEqualToString:@"Nombre"]) {
                             mensajeJSON=[NSString stringWithFormat:@"{\"%@\":\"%@\",",objKey,[objetoParse valueForKey:objKey]];
                         }
                         else{
                             mensajeJSON=[NSString stringWithFormat:@"{\"%@\":%@,",objKey,[objetoParse valueForKey:objKey]];
                         }
                         
                     }
                     else{
                          if ([objKey isEqualToString:@"Nombre"]) {
                              mensajeJSON=[NSString stringWithFormat:@"\"%@\":\"%@\",",objKey,[objetoParse valueForKey:objKey]];
                          }
                          else{
                              mensajeJSON=[NSString stringWithFormat:@"\"%@\":%@,",objKey,[objetoParse valueForKey:objKey]];
                          }
                         
                     }
                     [mensajeJSONTotal appendString:mensajeJSON];
                 }];
                 [mensajeJSONTotal appendString:@"}"];
                 HIDModeloEstadisticasJugador *estadisticasJugador=[[HIDModeloEstadisticasJugador alloc]initWithString:mensajeJSONTotal error:&err];
                 [listaModeloParseado addObject:estadisticasJugador];
             }];
             int __block goles=0;
             [listaModeloParseado enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                 //
                 HIDModeloEstadisticasJugador *jugador=obj;
                 goles=goles+[jugador.Goles integerValue];
                 golesTotales=goles;
             }];
             
             NSLog(@"mi array es %@",listaModeloParseado);
             listaDescargada=[[NSMutableArray alloc]init];
             listaDescargada=listaModeloParseado;
             [self.tableView reloadData];
             
             UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:@"Estadisticas"
                                                           message:@"Datos Actualizados"
                                                          delegate:nil
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"OK", nil];
             [alerta show];
             [indicador stopAnimating];
             
         }
         else{
             NSLog(@"error");
         }
     }];
}

-(void) mostrarGrafica{
    
    NSString *link =
    @"http://hidandroid.hol.es/catenaxio/obtener_estadisticas.php";
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:link]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               // handle response
                               NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                               NSDictionary *notesJSON =[NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingAllowFragments
                                                                                          error:&connectionError];
                               //NSLog(@"Los datos son %@",notesJSON);
                               [notesJSON enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                                   //
                                   //if ([[obj objectForKey:@"jugador"] isEqualToString:@"Abel"]) {
                                   
                                   NSLog(@"El objeto filtro %@",[obj objectAtIndex:5]);
                                   
                                   //}
                                   
                                   //inserto valores
                                   [abel modificowithTotales:[[obj objectAtIndex:0] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:0] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:0] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:0] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:0] objectForKey:@"asistencias"]];
                                   
                                   [anton modificowithTotales:[[obj objectAtIndex:1] objectForKey:@"partidos"]
                                                  withJugados:[[obj objectAtIndex:1] objectForKey:@"titulares"]
                                                  withGanados:[[obj objectAtIndex:1] objectForKey:@"partidosGanados"]
                                                    withGoles:[[obj objectAtIndex:1] objectForKey:@"goles"]
                                               withPorcentaje:@"0"
                                               withAsistencia:[[obj objectAtIndex:1] objectForKey:@"asistencias"]];
                                   
                                   [cano modificowithTotales:[[obj objectAtIndex:2] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:2] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:2] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:2] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:2] objectForKey:@"asistencias"]];
                                   
                                   [hugo modificowithTotales:[[obj objectAtIndex:3] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:3] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:3] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:3] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:3] objectForKey:@"asistencias"]];
                                   
                                   [jordan modificowithTotales:[[obj objectAtIndex:4] objectForKey:@"partidos"]
                                                   withJugados:[[obj objectAtIndex:4] objectForKey:@"titulares"]
                                                   withGanados:[[obj objectAtIndex:4] objectForKey:@"partidosGanados"]
                                                     withGoles:[[obj objectAtIndex:4] objectForKey:@"goles"]
                                                withPorcentaje:@"0"
                                                withAsistencia:[[obj objectAtIndex:4] objectForKey:@"asistencias"]];
                                   
                                   [juanito modificowithTotales:[[obj objectAtIndex:5] objectForKey:@"partidos"]
                                                    withJugados:[[obj objectAtIndex:5] objectForKey:@"titulares"]
                                                    withGanados:[[obj objectAtIndex:5] objectForKey:@"partidosGanados"]
                                                      withGoles:[[obj objectAtIndex:5] objectForKey:@"goles"]
                                                 withPorcentaje:@"0"
                                                 withAsistencia:[[obj objectAtIndex:5] objectForKey:@"asistencias"]];
                                   
                                   [meri modificowithTotales:[[obj objectAtIndex:6] objectForKey:@"partidos"]
                                                 withJugados:[[obj objectAtIndex:6] objectForKey:@"titulares"]
                                                 withGanados:[[obj objectAtIndex:6] objectForKey:@"partidosGanados"]
                                                   withGoles:[[obj objectAtIndex:6] objectForKey:@"goles"]
                                              withPorcentaje:@"0"
                                              withAsistencia:[[obj objectAtIndex:6] objectForKey:@"asistencias"]];
                                   
                                   [fer modificowithTotales:[[obj objectAtIndex:7] objectForKey:@"partidos"]
                                                withJugados:[[obj objectAtIndex:7] objectForKey:@"titulares"]
                                                withGanados:[[obj objectAtIndex:7] objectForKey:@"partidosGanados"]
                                                  withGoles:[[obj objectAtIndex:7] objectForKey:@"goles"]
                                             withPorcentaje:@"0"
                                             withAsistencia:[[obj objectAtIndex:7] objectForKey:@"asistencias"]];
                                   
                                   //calculo el porcentaje
                                   float golesTotales=[[abel goles2] floatValue]+[[anton goles2] floatValue]+[[cano goles2] floatValue]+[[hugo goles2] floatValue]+[[jordan goles2] floatValue]+[[juanito goles2] floatValue]+[[meri goles2] floatValue]+[[fer goles2] floatValue];
                                   [abel calcularPorcentajeWithGoles:golesTotales];
                                   [anton calcularPorcentajeWithGoles:golesTotales];
                                   [cano calcularPorcentajeWithGoles:golesTotales];
                                   [hugo calcularPorcentajeWithGoles:golesTotales];
                                   [jordan calcularPorcentajeWithGoles:golesTotales];
                                   [juanito calcularPorcentajeWithGoles:golesTotales];
                                   [meri calcularPorcentajeWithGoles:golesTotales];
                                   [fer calcularPorcentajeWithGoles:golesTotales];
                                   [self.tableView reloadData];
                                   
                                   
                                   [indicador stopAnimating];
                                   HIDWebController *web=[[HIDWebController alloc]initWithGolesAbel:[[abel goles2] integerValue] withGolesAnton:[[anton goles2] integerValue]  withGolesCano:[[cano goles2] integerValue]  withGolesHugo:[[hugo goles2] integerValue]  withGolesJordan:[[jordan goles2] integerValue]  withGolesMeri:[[meri goles2] integerValue]  withGolesJuanito:[[juanito goles2] integerValue] ];
                                   [self.navigationController pushViewController:web animated:YES];
                                   
                               }];
                               
                               
                           }];

    
    
    
    
    
   
}

-(void) mostrarGraficasParse{
    //NSData *locationCountData = [NSJSONSerialization dataWithJSONObject:locationCount   options:NSJSONWritingPrettyPrinted error:nil];
    //NSString *locationCountString = [[NSString alloc] initWithData:locationCountData encoding:NSUTF8StringEncoding];
    
  
   
    HIDWebController *ganados=[[HIDWebController alloc]initWithListaGoles:listaDescargada];
    [self.navigationController pushViewController:ganados animated:YES];
    

    
}

-(UIImage *) obtenerImagen:(NSString *) nombre{
    if ([nombre isEqualToString:@"AbelG"]) {
        return [UIImage imageNamed:@"abel"];
    }
    else if([nombre isEqualToString:@"AbelD"]) {
        return [UIImage imageNamed:@"abelD"];
    }
    else if([nombre isEqualToString:@"Jordan"]) {
        return [UIImage imageNamed:@"jordan"];
    }
    else if([nombre isEqualToString:@"Anton"]) {
        return [UIImage imageNamed:@"anton"];
    }
    else if([nombre isEqualToString:@"Cano"]) {
        return [UIImage imageNamed:@"hector"];
    }
    else if([nombre isEqualToString:@"Meri"]) {
        return [UIImage imageNamed:@"meri"];
    }
    else if([nombre isEqualToString:@"Hugo"]) {
        return [UIImage imageNamed:@"hugo3"];
    }
    else if([nombre isEqualToString:@"Juanma"]) {
        return [UIImage imageNamed:@"juanma"];
    }
    else if([nombre isEqualToString:@"Juan"]) {
        return [UIImage imageNamed:@"juanito"];
    }
    else if([nombre isEqualToString:@"ZInvitado"]) {
        return [UIImage imageNamed:@"fer"];
    }
    else{
    return [UIImage imageNamed:@"hugo3"];
    }
}

@end
