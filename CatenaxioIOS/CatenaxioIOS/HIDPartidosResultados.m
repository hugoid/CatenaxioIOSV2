//
//  HIDPartidosResultados.m
//  CatenaxioIOS
//
//  Created by Hugo Izquierdo on 10/29/15.
//  Copyright © 2015 Hugo Izquierdo. All rights reserved.
//

#import "HIDPartidosResultados.h"

@interface HIDPartidosResultados ()

@end

@implementation HIDPartidosResultados

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
    
    self.navigationController.title=@"Resultados";
    self.tabBarController.navigationItem.title = @"Liga";
}

@end
