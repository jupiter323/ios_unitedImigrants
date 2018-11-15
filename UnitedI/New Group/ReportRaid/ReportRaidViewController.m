//
//  ReportRaidViewController.m
//  UnitedI
//
//  Created by Peace on 11/1/18.
//  Copyright © 2018 Peace. All rights reserved.
//

#import "ReportRaidViewController.h"

@interface ReportRaidViewController (){
    CLLocationManager *locationManager;
    float longitude;
    float latitude;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    NSString *address;
    BOOL isPossibleUpdate;
    CLLocation *currentLocation;
    PinImageDefinition pinKind;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *locationTFl;

@end
@implementation ReportRaidViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isPossibleUpdate = YES;
    pinKind = StandardPin;
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [self getCurrentLocation];
}
-(void)getCurrentLocation{
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    [locationManager requestWhenInUseAuthorization]; //
    NSLog(@"passed initwithcode");
}
- (IBAction)attachFile:(id)sender {
    pinKind = AttachMarkPin;
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = currentLocation.coordinate;
    [self.mapView addAnnotation:point];

    pinKind = AttachShowPin;
    CLLocationCoordinate2D location1;
    location1.longitude = currentLocation.coordinate.longitude+0.0015;
    location1.latitude = currentLocation.coordinate.latitude-0.001;
    point.coordinate = location1;
    [self.mapView addAnnotation:point];
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    if(!isPossibleUpdate) {
        return;
    }
    // go region
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    
    
 
    NSLog(@"didUpdateToLocation: %@", newLocation);
    currentLocation = newLocation;
    
    if (currentLocation != nil) {
        longitude = currentLocation.coordinate.longitude;
        latitude = currentLocation.coordinate.latitude;
    }
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            address = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                       placemark.subThoroughfare?placemark.subThoroughfare:@"", placemark.thoroughfare?placemark.thoroughfare:@"",
                       placemark.postalCode?placemark.postalCode:@"", placemark.locality?placemark.locality:@"",
                       placemark.administrativeArea?placemark.administrativeArea:@"",
                       placemark.country?placemark.country:@""];
            self.locationTFl.text = address;
            
            
            // Add an annotation
            MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
            point.coordinate = newLocation.coordinate;
            [self.mapView addAnnotation:point];
            
            currentLocation = newLocation;
            isPossibleUpdate = NO;
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}
#pragma mark - mapview delegate

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    static NSString *AnnotationViewID = @"annotationViewID";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    switch (pinKind) {
        case StandardPin:
            annotationView.image = [UIImage imageNamed:@"locationPin"];//add any image which you want to show on map instead of red pins
            pinKind = NonePin;
            break;
        case AttachMarkPin:
            annotationView.image = [UIImage imageNamed:@"attach"];//add any image which you want to show on map instead of red pins
            pinKind = NonePin;
            break;
        case AttachShowPin:
            annotationView.image = [UIImage imageNamed:@"attachPin"];//add any image which you want to show on map instead of red pins
            pinKind = NonePin;
            break;
        default:
            return nil;
            break;
    }
    annotationView.annotation = annotation;
    return annotationView;
}
#pragma mark - keyboard dismiss
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Navigation
- (IBAction)gotoReturn:(id)sender {
    [self returnFun];
}
- (IBAction)gotoMenu:(id)sender {
    [self toMenu];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
