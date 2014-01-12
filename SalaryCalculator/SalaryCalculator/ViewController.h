//
//  ViewController.h
//  PIC Salary
//
//  Created by mickshaw on 12/11/13.
//  Copyright (c) 2013 Potomac Integration and Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate, UITextFieldDelegate>
{
    
    IBOutlet UILabel *PersonalRate;
    IBOutlet UILabel *OfferRate;
    IBOutlet UILabel *Hours;
    
    IBOutlet UILabel  *AnnualSalary;
    IBOutlet UISlider *AnnualSalarySlider;
    
    IBOutlet UITextField *Holidays;
    IBOutlet UITextField *Fringe;
    IBOutlet UITextField *Vacation;
    
    IBOutlet UITextField *Bonus;
    
    IBOutlet UITextField *Insurance;
    IBOutlet UITextField *Savings;
    IBOutlet UITextField *HealthCare;
    IBOutlet UITextField *SSTax;
    IBOutlet UITextField *Medicare;
    IBOutlet UITextField *Unemployment;
    IBOutlet UITextField *Profit;
    IBOutlet UIButton *SendResults;
    
    
    
}

@property (nonatomic,retain) UILabel *PersonalRate;
@property (nonatomic,retain) UILabel *OfferRate;
@property (nonatomic,retain) UILabel *Hours;

@property (nonatomic,retain) UILabel *AnnualSalary;
@property (nonatomic,retain) UISlider *AnnualSalarySlider;

@property (nonatomic,retain) UITextField *Holidays;
@property (nonatomic,retain) UITextField *Fringe;
@property (nonatomic,retain) UITextField *Vacation;

@property (nonatomic,retain) UITextField *Bonus;
@property (nonatomic,retain) UITextField *Insurance;
@property (nonatomic,retain) UITextField *Savings;
@property (nonatomic,retain) UITextField *HealthCare;
@property (nonatomic,retain) UITextField *SSTax;
@property (nonatomic,retain) UITextField *Medicare;
@property (nonatomic,retain) UITextField *Unemployment;
@property (nonatomic,retain) UITextField *Profit;


- (IBAction)SendResults:(id)sender;



@end
