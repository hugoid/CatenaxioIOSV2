//
//  HIDCalendario.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/27/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDCalendario.h"
#import "HIDObjetoCalendario.h"
#import "HIDCeldaTablaCalendarioCell.h"

@interface HIDCalendario ()

@end

@implementation HIDCalendario

NSMutableArray *celdasCalendario;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        //creo el model (cambiar al appdelegate en el futuro)
        celdasCalendario=[[NSMutableArray alloc]initWithCapacity:22];
        
        HIDObjetoCalendario *jornada1=[[HIDObjetoCalendario alloc]initWithJornada:@"1"
                                                                        withFecha:@"3/10/2014"
                                                                         withHora:@"18:00"
                                                                        withRival:@"DIETO UNITED"
                                                                        withLugar:@"JUAN DE LA CIERVA"];
        [celdasCalendario addObject:jornada1];
        
        HIDObjetoCalendario *jornada2=[[HIDObjetoCalendario alloc]initWithJornada:@"2"
                                                                        withFecha:@"18/10/2014"
                                                                         withHora:@"14:30"
                                                                        withRival:@"MONUMENTS MENS"
                                                                        withLugar:@"Giner"];
        [celdasCalendario addObject:jornada2];
        
        HIDObjetoCalendario *jornada3=[[HIDObjetoCalendario alloc]initWithJornada:@"3"
                                                                        withFecha:@"24/10/2014"
                                                                         withHora:@"17:00"
                                                                        withRival:@"PASEO B"
                                                                        withLugar:@"SECTOR III"];
        [celdasCalendario addObject:jornada3];
        
        HIDObjetoCalendario *jornada4=[[HIDObjetoCalendario alloc]initWithJornada:@"4"
                                                                        withFecha:@"7/11/2014"
                                                                         withHora:@"20:00"
                                                                        withRival:@"SET POINTS"
                                                                        withLugar:@"PERALES"];
        [celdasCalendario addObject:jornada4];
        
        HIDObjetoCalendario *jornada5=[[HIDObjetoCalendario alloc]initWithJornada:@"5"
                                                                        withFecha:@"15/11/2015"
                                                                         withHora:@"14:00"
                                                                        withRival:@"AD AZULES"
                                                                        withLugar:@"JUAN DE LA CIERVA"];
        [celdasCalendario addObject:jornada5];
        
        HIDObjetoCalendario *jornada6=[[HIDObjetoCalendario alloc]initWithJornada:@"6"
                                                                        withFecha:@"21/11/2014"
                                                                         withHora:@"19:00"
                                                                        withRival:@"WHISKY PARK"
                                                                        withLugar:@"GINER"];
        [celdasCalendario addObject:jornada6];
        
        HIDObjetoCalendario *jornada7=[[HIDObjetoCalendario alloc]initWithJornada:@"7"
                                                                        withFecha:@"29/11/2014"
                                                                         withHora:@"9:00"
                                                                        withRival:@"LA TABERNA DEL TARAO"
                                                                        withLugar:@"SECTOR III"];
        [celdasCalendario addObject:jornada7];
        
        HIDObjetoCalendario *jornada8=[[HIDObjetoCalendario alloc]initWithJornada:@"8"
                                                                        withFecha:@"12/12/2014"
                                                                         withHora:@"18:30"
                                                                        withRival:@"RAYO BERCIAL"
                                                                        withLugar:@"GINER"];
        [celdasCalendario addObject:jornada8];
        
        HIDObjetoCalendario *jornada9=[[HIDObjetoCalendario alloc]initWithJornada:@"9"
                                                                        withFecha:@"20/12/2014"
                                                                         withHora:@"16:00"
                                                                        withRival:@"NARANJA MECANICA B"
                                                                        withLugar:@"M4"];
        [celdasCalendario addObject:jornada9];
        
        HIDObjetoCalendario *jornada10=[[HIDObjetoCalendario alloc]initWithJornada:@"10"
                                                                         withFecha:@"9/1/2015"
                                                                          withHora:@"17:00"
                                                                         withRival:@"INTER FS"
                                                                         withLugar:@"M4"];
        [celdasCalendario addObject:jornada10];
        
        HIDObjetoCalendario *jornada11=[[HIDObjetoCalendario alloc]initWithJornada:@"11"
                                                                         withFecha:@"17/1/2015"
                                                                          withHora:@"11:00"
                                                                         withRival:@"DREAM TEAM"
                                                                         withLugar:@"GINER"];
        [celdasCalendario addObject:jornada11];
        
        HIDObjetoCalendario *jornada12=[[HIDObjetoCalendario alloc]initWithJornada:@"12"
                                                                         withFecha:@"23/1/2015"
                                                                          withHora:@"18:00"
                                                                         withRival:@"DIETO UNITED"
                                                                         withLugar:@"JUAN DE LA CIERVA"];
        [celdasCalendario addObject:jornada12];
        
        HIDObjetoCalendario *jornada13=[[HIDObjetoCalendario alloc]initWithJornada:@"13"
                                                                         withFecha:@"31/1/2015"
                                                                          withHora:@"15:00"
                                                                         withRival:@"MONUMENTS MENS"
                                                                         withLugar:@"PERALES"];
        [celdasCalendario addObject:jornada13];
        
        HIDObjetoCalendario *jornada14=[[HIDObjetoCalendario alloc]initWithJornada:@"14"
                                                                         withFecha:@"6/2/2015"
                                                                          withHora:@"17:00"
                                                                         withRival:@"PASEO B"
                                                                         withLugar:@"SECTOR III"];
        [celdasCalendario addObject:jornada14];
        
        
        
        HIDObjetoCalendario *jornada15=[[HIDObjetoCalendario alloc]initWithJornada:@"15"
                                                                         withFecha:@"13/2/2015"
                                                                          withHora:@"20:00"
                                                                         withRival:@"SET POINT"
                                                                         withLugar:@"PERALES"];
        [celdasCalendario addObject:jornada15];
        
        HIDObjetoCalendario *jornada16=[[HIDObjetoCalendario alloc]initWithJornada:@"16"
                                                                         withFecha:@"21/2/2015"
                                                                          withHora:@"14:00"
                                                                         withRival:@"AD AZULES"
                                                                         withLugar:@"JUAN DE LA CIERVA"];
        [celdasCalendario addObject:jornada16];
        
        HIDObjetoCalendario *jornada17=[[HIDObjetoCalendario alloc]initWithJornada:@"17"
                                                                         withFecha:@"27/2/2015"
                                                                          withHora:@"19:00"
                                                                         withRival:@"WHISKY PARK"
                                                                         withLugar:@"GINER"];
        [celdasCalendario addObject:jornada17];
        
        HIDObjetoCalendario *jornada18=[[HIDObjetoCalendario alloc]initWithJornada:@"18"
                                                                         withFecha:@"6/3/2015"
                                                                          withHora:@"9:00"
                                                                         withRival:@"LA TABERNA DEL TARAO"
                                                                         withLugar:@"SECTOR III"];
        [celdasCalendario addObject:jornada18];
        
        HIDObjetoCalendario *jornada19=[[HIDObjetoCalendario alloc]initWithJornada:@"19"
                                                                         withFecha:@"12/3/2015"
                                                                          withHora:@"18:30"
                                                                         withRival:@"RAYO BERCIAL"
                                                                         withLugar:@"GINER"];
        [celdasCalendario addObject:jornada19];
        
        HIDObjetoCalendario *jornada20=[[HIDObjetoCalendario alloc]initWithJornada:@"20"
                                                                         withFecha:@"3/4/2015"
                                                                          withHora:@"17:00"
                                                                         withRival:@"NARAJNA MECANICA B"
                                                                         withLugar:@"JUAN DE LA CIERVA"];
        [celdasCalendario addObject:jornada20];
        
        HIDObjetoCalendario *jornada21=[[HIDObjetoCalendario alloc]initWithJornada:@"21"
                                                                         withFecha:@"9/4/2015"
                                                                          withHora:@"17:00"
                                                                         withRival:@"INTER FS"
                                                                         withLugar:@"M4"];
        [celdasCalendario addObject:jornada21];
        
        HIDObjetoCalendario *jornada22=[[HIDObjetoCalendario alloc]initWithJornada:@"22"
                                                                         withFecha:@"17/4/2015"
                                                                          withHora:@"11:00"
                                                                         withRival:@"DREAM TEAM FS"
                                                                         withLugar:@"GINER"];
        [celdasCalendario addObject:jornada22];
        

        
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
    self.title=@"Calendario";
    //colo de los botones
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //cambiar textos de la barra color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    
    UINib *cellNib = [UINib nibWithNibName:@"CeldaTablaCalendario"
                                    bundle:nil];
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[HIDCeldaTablaCalendarioCell cellId]];
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
    return [celdasCalendario count];
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
    HIDCeldaTablaCalendarioCell *cell = [tableView dequeueReusableCellWithIdentifier:[HIDCeldaTablaCalendarioCell cellId]];
    if(cell==nil){
        cell=[[HIDCeldaTablaCalendarioCell alloc]init];
    }
    
    cell.labelJornada.text=[[celdasCalendario objectAtIndex:indexPath.row] jornada];
    cell.labelFecha.text=[[celdasCalendario objectAtIndex:indexPath.row] fecha];
    cell.labelHora.text=[[celdasCalendario objectAtIndex:indexPath.row] hora];
    cell.labelRival.text=[[celdasCalendario objectAtIndex:indexPath.row] rival];
    cell.labelLugar.text=[[celdasCalendario objectAtIndex:indexPath.row] lugar];
    
    NSLog(@"La celda %d ",[cell.labelJornada.text integerValue]);
    if ([cell.labelJornada.text integerValue] % 2){
        if ([cell.labelJornada.text integerValue]!=0) {
            
        
        [cell.vistaFondo setBackgroundColor:[UIColor colorWithRed:85.0/255.0 green:143.0/255.0 blue:220.0/255.0 alpha:1.0]];
        }
    }
    else{
        [cell.vistaFondo setBackgroundColor:[UIColor blueColor]];
    }
    
    
    
   
    
    // Configure the cell...
    
    return cell;
}

//la altura de la celda

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return [HIDCeldaTablaCalendarioCell cellHeight];
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

@end
