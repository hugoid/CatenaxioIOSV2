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
@interface HIDEstadisticas ()

@end

@implementation HIDEstadisticas

NSMutableArray *celdasEstadisticas;
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

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
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
        [celdasEstadisticas addObject:juanma];
    
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
    return [celdasEstadisticas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HIDCeldaEstadisticaCell *cell = [tableView dequeueReusableCellWithIdentifier:[HIDCeldaEstadisticaCell cellId]];
    if(cell==nil){
        cell=[[HIDCeldaEstadisticaCell alloc]init];
    }
    
    cell.labelPartidosTotales.text=[[celdasEstadisticas objectAtIndex:indexPath.row] totales2];
    cell.labelPartidosJugados.text=[[celdasEstadisticas objectAtIndex:indexPath.row] jugados2];
    cell.labelPartidosGanados.text=[[celdasEstadisticas objectAtIndex:indexPath.row] ganados2];
    cell.labelGoles.text=[[celdasEstadisticas objectAtIndex:indexPath.row] goles2];
   cell.labelPorcentajeGoles.text=[[celdasEstadisticas objectAtIndex:indexPath.row] porcentaje2];
    cell.labelAsistencias.text=[[celdasEstadisticas objectAtIndex:indexPath.row] asistencia2];
    
    UIImageView *imagen=[[UIImageView alloc]initWithImage:[[celdasEstadisticas objectAtIndex:indexPath.row] jugador2]];
    
    cell.imagenPhoto.image=imagen.image;
    
    
    
    
    
    
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
    
    
    [self descargarInformacion];
    
}

-(void) pulsarBotonGrafica:(id) sender{
    NSLog(@"grafica");
     [self mostrarGrafica];
    
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

@end
