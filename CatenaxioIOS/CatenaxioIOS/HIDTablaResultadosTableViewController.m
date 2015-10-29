//
//  HIDTablaResultadosTableViewController.m
//  CatenaxioIOS
//
//  Created by Hugo Integrasys on 10/7/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDTablaResultadosTableViewController.h"
#import "HIDCalendario.h"
#import "HIDObjetoCalendario.h"
#import "HIDCeldaResultados.h"
#import "HIDObjetoResultado.h"

@interface HIDTablaResultadosTableViewController ()

@end

@implementation HIDTablaResultadosTableViewController

NSMutableArray *celdasResultados;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title=@"Resultados";
        [self downloadResultados];
        
        
        
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
    
    //colo de los botones
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //cambiar textos de la barra color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    
    UINib *cellNib = [UINib nibWithNibName:@"CeldaResultados"
                                    bundle:nil];
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[HIDCeldaResultados cellId]];
    
    
    //obtengo resultados
    //[self downloadResultados];
    
    
    
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
    return [celdasResultados count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"Relleno las celdas");
    /*[celdasCalendario enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
     //
     NSLog(@"copio: %@", [obj jornada]);
     }];*/
    //tengo un error a la hora de cargar la celda personalizada, dejo una tabla standar para poder mostrar algo
    //tabla customize
    //static NSString *CellIdentifier = [HIDCeldaRTVE2 cellId];
    HIDCeldaResultados *cell = [tableView dequeueReusableCellWithIdentifier:[HIDCeldaResultados cellId]];
    if(cell==nil){
        cell=[[HIDCeldaResultados alloc]init];
    }
    
    //NSLog(@"Mi celda count %@",[[celdasResultados objectAtIndex:indexPath.row] rival]);
    cell.nombreRival.text=[[celdasResultados objectAtIndex:indexPath.row] rival];
    cell.resultado.text=[[celdasResultados objectAtIndex:indexPath.row] resultado];
    
  
    if ([[[celdasResultados objectAtIndex:indexPath.row] codigo] isEqualToString:@"G"]) {
        //
        UIImage *imagen=[UIImage imageNamed:@"aprobadoIOS"];
        cell.imagenResultado.image=imagen;
    }
    else if ([[[celdasResultados objectAtIndex:indexPath.row] codigo] isEqualToString:@"P"]) {
        UIImage *imagen=[UIImage imageNamed:@"suspendidoIOS"];
        cell.imagenResultado.image=imagen;
        
    }
    else if ([[[celdasResultados objectAtIndex:indexPath.row] codigo] isEqualToString:@"E"]) {
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


-(void) downloadResultados{
    NSString *link =@"http://hidandroid.hol.es/catenaxio/obtener_resultados.php";
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:link]];
   
    
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
                                   celdasResultados=[[NSMutableArray alloc]initWithCapacity:partidos+2];
                               
                                   [celdasResultados insertObject:[[HIDObjetoResultado alloc] initWithRival:@""
                                                                                              withResultado:@""
                                                                                        withCodigoResultado:@"X"]
                                                                                                    atIndex:0];
                                
                                   int i=1;
                                   int punteroJSON=0;
                                   for (id x in obj) {
                                       //
                                       //NSLog(@"El resultado es: %@",x);
                                       
                                       [celdasResultados insertObject:[[HIDObjetoResultado alloc] initWithRival:[[obj valueForKey:@"Rival"] objectAtIndex:punteroJSON]
                                                                                                  withResultado:[[obj valueForKey:@"Resultado"] objectAtIndex:punteroJSON]
                                                                                            withCodigoResultado:[[obj valueForKey:@"GPE"] objectAtIndex:punteroJSON]]
                                                              atIndex:i];
                                       i++;
                                       punteroJSON++;
                                       
                                   }
                                   [celdasResultados insertObject:[[HIDObjetoResultado alloc] initWithRival:@""
                                                                                              withResultado:@""
                                                                                        withCodigoResultado:@"X"]
                                                          atIndex:i];
                                   
                                   
                                   
                                   
                               }];
                               
                           }];
    
}


@end
