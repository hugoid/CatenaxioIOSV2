//
//  HIDLiga.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 9/28/14.
//  Copyright (c) 2014 Hugo Izquierdo. All rights reserved.
//

#import "HIDLiga.h"
#import <Parse/Parse.h>

@interface HIDLiga ()

@end

@implementation HIDLiga

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Clasificacion";
        //self.tabBarItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];

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
    
    //configuracion de la tabla
    [self.navigationController setNavigationBarHidden:NO];
    //color de la barra
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    //color de las celdas no rellenadas
    
    self.navigationController.title=@"Clasificacion";
    self.tabBarController.navigationItem.title = @"Liga";
    
    //colo de los botones
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //cambiar textos de la barra color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    
    //cargo la imagen
    //insertar botones en la barra de herramientas
    UIBarButtonItem *botonDescargar=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                   target:self
                                                                                   action:@selector(obtenerClasificacionParse)];
 
    //self.navigationItem.rightBarButtonItem=botonActualizar;
    
    //[self.navigationItem setRightBarButtonItems:@[botonDescargar] animated:YES];
    [self.tabBarController.navigationItem setRightBarButtonItem:botonDescargar];

    //quito el indicador
    [self.imagenIndicador stopAnimating];
    [self.imagenIndicador setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) pulsarBotonDescargar:(id) sender{
    NSString *link =
    @"http://hidandroid.hol.es/catenaxio/clasificacion.png";
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:link]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *connectionError) {
                               UIImage *imagen=[UIImage imageWithData:data];
                               self.imagenClasificacion.image=imagen;
                           }];
    
}

-(void) obtenerClasificacionParse{
    NSLog(@"descargo ");
    [self.imagenIndicador startAnimating];
    [self.imagenIndicador setHidden:NO];
    PFQuery *query=[PFQuery queryWithClassName:@"Clasificacion"];
    [query
     findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
         //
         
         if (!error) {
           
             //como obtengo el elemento clase del arrat
             PFFile *imageFile=[[objects objectAtIndex:0] valueForKey:@"imagen"];
             [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                 [self.imagenIndicador stopAnimating];
                 [self.imagenIndicador setHidden:YES];
                 //
                 [self.imagenClasificacion setImage:[UIImage imageWithData:data]];
                 
             } progressBlock:^(int percentDone) {
                 //
                 NSLog(@"descargo %d",percentDone);
             }];
             
         }
         else{
             [self.imagenIndicador stopAnimating];
             [self.imagenIndicador setHidden:YES];
         }
     }];
}

@end
