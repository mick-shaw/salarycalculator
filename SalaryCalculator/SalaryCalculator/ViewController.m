//
//  ViewController.m
//  PIC Salary
//
//  Created by mickshaw on 12/11/13.
//  Copyright (c) 2013 Potomac Integration and Consulting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize OfferRate;
@synthesize PersonalRate;
@synthesize Hours;

@synthesize AnnualSalary;
@synthesize AnnualSalarySlider;


@synthesize Holidays;
@synthesize Fringe;
@synthesize Vacation;

@synthesize Bonus;
@synthesize Insurance;
@synthesize Savings;
@synthesize HealthCare;
@synthesize SSTax;
@synthesize Medicare;
@synthesize Unemployment;
@synthesize Profit;





- (IBAction) sliderValueChanged:(UISlider *)sender {
    
    
    int value = (int)(sender.value / 1000.0);
    AnnualSalary.text = [NSString stringWithFormat:@"%d", value * 1000];
    sender.minimumValue = 30000;
    sender.maximumValue = 300000;
    
    double HolidayHours = [Holidays.text integerValue];
    double FringeHours = [Fringe.text integerValue];
    double VacationHours = [Vacation.text integerValue];
    double BonusPercent = [Bonus.text doubleValue];
    double InsPercent = [Insurance.text doubleValue];
    double SavePercent = [Savings.text doubleValue];
    double HealthPercent = [HealthCare.text doubleValue];
    double SSNPercent = [SSTax.text doubleValue];
    double MedPercent = [Medicare.text doubleValue];
    double UnemplyPercent = [Unemployment.text doubleValue];
    double ProfitPercent = [Profit.text doubleValue];
    
    
    double EmployeeSalary = [AnnualSalary.text doubleValue];
    
    //NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    //[nf setNumberStyle:NSNumberFormatterCurrencyStyle];
    //double EmployeeSalary = [[nf numberFromString:AnnualSalary.text] doubleValue];
    
    double Holidayhrs = HolidayHours *8;
    double Fringehrs = FringeHours *8;
    double Vacationhrs = VacationHours *8;
    
    double TotalHours = 2080;
    double AnnualHours = TotalHours - Holidayhrs - Fringehrs - Vacationhrs;
    
    double Overhead = BonusPercent+InsPercent+SavePercent+HealthPercent+SSNPercent+MedPercent+UnemplyPercent+ProfitPercent;
    
    double Hundred = 100;
    double OverHeadCalc = Overhead / Hundred + 1;
    
    //double OverheadCalc = 1 + Overhead;
    
    double Employee = EmployeeSalary/AnnualHours + .01;
    double Finaloffer = OverHeadCalc * Employee + .01;
    
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
    [numberFormatter setMaximumFractionDigits:2];
    
    NSNumber *n1 = [NSNumber numberWithDouble:HolidayHours];
    NSNumber *n2 = [NSNumber numberWithDouble:FringeHours];
    NSNumber *n3 = [NSNumber numberWithDouble:VacationHours];
    NSNumber *n4 = [NSNumber numberWithDouble:AnnualHours];
    
    NSNumber *r1 = [NSNumber numberWithDouble:Employee];
    NSNumber *r2 = [NSNumber numberWithDouble:EmployeeSalary];
    NSNumber *r3 = [NSNumber numberWithDouble:Finaloffer];
    
    
    NSString *HolidayString = [numberFormatter stringFromNumber:n1];
    Holidays.text = HolidayString;
    
    NSString *FringeString =[numberFormatter stringFromNumber:n2];
    Fringe.text = FringeString;
    
    NSString *VacationString =[numberFormatter stringFromNumber:n3];
    Vacation.text = VacationString;
    
    NSString *AnnualHoursString =[numberFormatter stringFromNumber:n4];
    Hours.text = AnnualHoursString;
    
    NSString *EmployeeString =[numberFormatter stringFromNumber:r1];
    PersonalRate.text = EmployeeString;
    
    NSString *EmployeeSalaryString =[numberFormatter stringFromNumber:r2];
    AnnualSalary.text = EmployeeSalaryString;
    
    NSString *FinalOfferString =[numberFormatter stringFromNumber:r3];
    OfferRate.text = FinalOfferString;
    
    
}




-(IBAction) btnCalculate:(id) sender{
    
    
    
    NSString *OfferString = @"77.38";
    OfferRate.text = OfferString;
    
    NSString *PersonalRateString = @"54.36";
    PersonalRate.text = PersonalRateString;
    
    NSString *HoursString = @"1840";
    Hours.text = HoursString;
    
    NSString *AnnualString = @"100000";
    AnnualSalary.text = AnnualString;
    
    NSString *HolidaysString = @"10";
    Holidays.text = HolidaysString;
    
    NSString *FringeString = @"10";
    Fringe.text = FringeString;
    
    NSString *VacationString = @"10";
    Vacation.text = VacationString;
    
    NSString *BonusString = @"10.00";
    Bonus.text = BonusString;
    
    NSString *InsuranceString = @"5.00";
    Insurance.text = InsuranceString;
    
    NSString *SavingsString = @"4.00";
    Savings.text = SavingsString;
    
    NSString *HealthCareString = @"4.00";
    HealthCare.text = HealthCareString;
    
    NSString *SSTaxString = @"6.20";
    SSTax.text = SSTaxString;
    
    NSString *MedicareString = @"1.45";
    Medicare.text = MedicareString;
    
    NSString *Unemploymentstring = @"2.60";
    Unemployment.text = Unemploymentstring;
    
    NSString *ProfitString = @"10.00";
    Profit.text = ProfitString;
    
    
}

-(IBAction)SendResults:(id)sender{
    
    NSString *AnnualPay = AnnualSalary.text;
    NSString *LoadedRate = OfferRate.text;
    NSString *PersonalHours = PersonalRate.text;
    NSString *VacationDays = Vacation.text;
    
    
    
    NSString *resultsText = [NSString stringWithFormat:@"Annual Salary: $%@\nLoaded Hourly Rate: $%@\nPersonal Hourly Rate: $%@\nVacation Days: %@\n\n",AnnualPay,LoadedRate,PersonalHours,VacationDays];
    
    resultsText = [resultsText stringByAppendingString: @"Sent from PIC Rate Calculator."];
    
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
    [mailController setMailComposeDelegate:self];
    NSString *address = @"";
    NSArray *addressArray = [[NSArray alloc]initWithObjects:address, nil];
    [mailController setMessageBody:resultsText isHTML:NO];
    [mailController setToRecipients:addressArray];
    [mailController setSubject:@"Salary Cacluation Results"];
    [mailController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:mailController animated:YES completion:nil];

    
    
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    [Holidays resignFirstResponder];
    [Fringe resignFirstResponder];
    [Vacation resignFirstResponder];
    [Medicare resignFirstResponder];
    [SSTax resignFirstResponder];
    [HealthCare  resignFirstResponder];
    [Savings resignFirstResponder];
    [Insurance resignFirstResponder];
    [Bonus resignFirstResponder];
    [Unemployment resignFirstResponder];
    [Profit resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField)
    {
        [textField resignFirstResponder];
    }
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Holidays.delegate = self;
    Fringe.delegate = self;
    Vacation.delegate = self;
    Medicare.delegate = self;
    SSTax.delegate = self;
    HealthCare.delegate = self;
    Savings.delegate = self;
    Insurance.delegate = self;
    Bonus.delegate = self;
    Unemployment.delegate = self;
    Profit.delegate = self;
    
   
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
