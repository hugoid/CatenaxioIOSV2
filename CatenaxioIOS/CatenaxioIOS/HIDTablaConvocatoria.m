//
//  HIDTablaConvocatoria.m
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/8/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDTablaConvocatoria.h"
#import "HIDObjetoConvocatoria.h"
#import "HIDCeldaConvocatoria.h"

@interface HIDTablaConvocatoria ()

@end

@implementation HIDTablaConvocatoria
NSMutableArray *celdasEstadisticas;
HIDObjetoConvocatoria *abel;
HIDObjetoConvocatoria *anton;
HIDObjetoConvocatoria *cano;
HIDObjetoConvocatoria *hugo;
HIDObjetoConvocatoria *jordan;
HIDObjetoConvocatoria *juanito;
HIDObjetoConvocatoria *meri;
HIDObjetoConvocatoria *fer;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        celdasEstadisticas=[[NSMutableArray alloc]initWithCapacity:8];
        
        //abel
        abel=[[HIDObjetoConvocatoria alloc]initWithJugador:@"abel"
                                             withResultado:0
                                                  withFoto:[UIImage imageNamed:@"abel"]
                                         withFotoResultado:[UIImage imageNamed:@"baja"]];
        
        
        [celdasEstadisticas addObject:abel];
        
        //anton
        anton=[[HIDObjetoConvocatoria alloc]initWithJugador:@"anton"
                                             withResultado:0
                                                  withFoto:[UIImage imageNamed:@"anton"]
                                         withFotoResultado:[UIImage imageNamed:@"alta"]];
        
        
        [celdasEstadisticas addObject:anton];
        
        //cano
        cano=[[HIDObjetoConvocatoria alloc]initWithJugador:@"cano"
                                             withResultado:0
                                                  withFoto:[UIImage imageNamed:@"hector"]
                                         withFotoResultado:[UIImage imageNamed:@"alta"]];
        
        
        [celdasEstadisticas addObject:cano];
        
        //hugo
        hugo=[[HIDObjetoConvocatoria alloc]initWithJugador:@"hugo"
                                             withResultado:0
                                                  withFoto:[UIImage imageNamed:@"hugo3"]
                                         withFotoResultado:[UIImage imageNamed:@"alta"]];
        
        
        [celdasEstadisticas addObject:hugo];
        
        //jordan
        jordan=[[HIDObjetoConvocatoria alloc]initWithJugador:@"jordan"
                                             withResultado:0
                                                  withFoto:[UIImage imageNamed:@"jordan"]
                                         withFotoResultado:[UIImage imageNamed:@"alta"]];
        
        
        [celdasEstadisticas addObject:jordan];
        
        //juanito
        juanito=[[HIDObjetoConvocatoria alloc]initWithJugador:@"juanito"
                                             withResultado:0
                                                  withFoto:[UIImage imageNamed:@"juanito"]
                                         withFotoResultado:[UIImage imageNamed:@"duda"]];
        
        
        [celdasEstadisticas addObject:juanito];
        
        //meri
        meri=[[HIDObjetoConvocatoria alloc]initWithJugador:@"meri"
                                                withResultado:0
                                                     withFoto:[UIImage imageNamed:@"meri"]
                                            withFotoResultado:[UIImage imageNamed:@"baja"]];
        
        
        [celdasEstadisticas addObject:meri];
        
        //juanito
        fer=[[HIDObjetoConvocatoria alloc]initWithJugador:@"fer"
                                                withResultado:0
                                                     withFoto:[UIImage imageNamed:@"fer"]
                                            withFotoResultado:[UIImage imageNamed:@"alta"]];
        
        
        [celdasEstadisticas addObject:fer];
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
    
    UIBarButtonItem *botonEnviar=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                target:self
                                                                                action:@selector(pulsarBotonEnviar:)];
    //self.navigationItem.rightBarButtonItem=botonActualizar;
    
    [self.navigationItem setRightBarButtonItems:@[botonActualizar,botonEnviar] animated:YES];
    
    
    UINib *cellNib = [UINib nibWithNibName:@"CeldaConvocatoria"
                                    bundle:nil];
    
    
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[HIDCeldaConvocatoria cellId]];
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
    HIDCeldaConvocatoria *cell = [tableView dequeueReusableCellWithIdentifier:[HIDCeldaConvocatoria cellId]];
    if(cell==nil){
        cell=[[HIDCeldaConvocatoria alloc]init];
    }
    
    cell.fotoJugador.image=[[celdasEstadisticas objectAtIndex:indexPath.row] foto] ;
    cell.fotoIcono.image=[[celdasEstadisticas objectAtIndex:indexPath.row] fotoIcono];
    
   
    


    
    
    
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [HIDCeldaConvocatoria cellHeight];
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark- Evento botones

-(void) pulsarBotonActualizar:(id) sender{
    NSLog(@"descarga");
    
    NSString *link =
    @"http://hidandroid.hol.es/catenaxio/ejemploJSON.php";
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:link]];
    //0  voy 2 duda 1 voy
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
                                   NSLog(@"El resultado: %@",notesJSON);
                                   NSLog(@"El objeto filtro %@",[obj objectAtIndex:5]);
                                   
                                   //}
                                   
                                  
                                   [abel modificoResultadoWithFoto:[[[obj objectAtIndex:0] valueForKey:@"resultado"] integerValue] ];
                                   [anton modificoResultadoWithFoto:[[[obj objectAtIndex:1] valueForKey:@"resultado"] integerValue] ];
                                   [cano modificoResultadoWithFoto:[[[obj objectAtIndex:2] valueForKey:@"resultado"] integerValue] ];
                                   [hugo modificoResultadoWithFoto:[[[obj objectAtIndex:3] valueForKey:@"resultado"] integerValue] ];
                                   [jordan modificoResultadoWithFoto:[[[obj objectAtIndex:4] valueForKey:@"resultado"] integerValue] ];
                                   [juanito modificoResultadoWithFoto:[[[obj objectAtIndex:5] valueForKey:@"resultado"] integerValue] ];
                                   [meri modificoResultadoWithFoto:[[[obj objectAtIndex:6] valueForKey:@"resultado"] integerValue] ];
                                   [fer modificoResultadoWithFoto:[[[obj objectAtIndex:7] valueForKey:@"resultado"] integerValue] ];
                                   [self.tableView reloadData];
                                   
                                   //inserto valores
                                /*   [abel modificowithTotales:[[obj objectAtIndex:0] objectForKey:@"partidos"]
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
                                   [indicador stopAnimating];*/
                                   
                                   
                               }];
                               
                               
                           }];

    
}
-(void) pulsarBotonEnviar:(id) sender{
    UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:@"Enviar"
                                                  message:@"Seleccione la opcion"
                                                 delegate:self
                                        cancelButtonTitle:@"cancel"
                                        otherButtonTitles:@"Voy",@"No Voy",@"Duda", nil];
    [alerta show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Pulsado %d",buttonIndex);
    if(buttonIndex==0){//cancel
        
    }
    else if(buttonIndex==1){ //voy
        
    }
    else if(buttonIndex==2){ //no voy
        
    }
}


@end
