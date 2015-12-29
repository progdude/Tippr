//
//  TipViewController.swift
//  Tippr
//
//  Created by Archit Rathi on 12/28/15.
//  Copyright © 2015 Archit Rathi. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var totalLabel: UITextField!
    
    @IBOutlet weak var percentControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var perPersonLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var peopleField: UITextField!
    
    @IBOutlet var secondView: UIView!
    
    var currency = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }

    @IBAction func totalChanged(sender: AnyObject) {
        var percents = [0.1,0.15,0.2];
        var percent = percents[percentControl.selectedSegmentIndex];
        
        var bill = NSString(string: billField.text!).doubleValue;
        var tip = bill*percent;
        var total=bill+tip;
        var perPerson = total/NSString(string: peopleField.text!).doubleValue;
        
        tipLabel.text = String(format: currency+"%.2f", tip);
        priceLabel.text = String(format: currency+"%.2f", total);
        perPersonLabel.text = String(format: currency+"%.2f", perPerson);
        
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(bill, forKey: "bill amount");
        defaults.setDouble(tip, forKey: "tip amount");
        defaults.synchronize();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        var percents = [0.1,0.15,0.2];

        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("default_tip_percentage")
        percentControl.selectedSegmentIndex = tipValue;
        
        totalLabel.text = defaults.stringForKey("bill amount");
        tipLabel.text = defaults.stringForKey("tip amount");
        peopleField.text = "2";
        
        var currencyFormatter = NSNumberFormatter();
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle;
        currencyFormatter.locale = NSLocale.currentLocale();
        var z = currencyFormatter.stringFromNumber(0)!
        currency = z[z.startIndex.advancedBy(0)...z.startIndex.advancedBy(1)]
        
        
        
    }
    
    
    
    @IBAction func personChanged(sender: AnyObject) {
        var percents = [0.1,0.15,0.2];
        var percent = percents[percentControl.selectedSegmentIndex];
        
        var bill = NSString(string: billField.text!).doubleValue;
        var tip = bill*percent;
        var total=bill+tip;
        var perPerson = total/NSString(string: peopleField.text!).doubleValue;
        
        tipLabel.text = String(format: currency+"%.2f", tip);
        priceLabel.text = String(format: currency+"%.2f", total);
        perPersonLabel.text = String(format: currency+"%.2f", perPerson);
        
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setDouble(bill, forKey: "bill amount");
        defaults.setDouble(tip, forKey: "tip amount");
        defaults.synchronize();
    }
    
    @IBAction func changePercent(sender: AnyObject) {
        var percents = [0.1,0.15,0.2];
        var percent = percents[percentControl.selectedSegmentIndex];
        
        var bill = NSString(string: billField.text!).doubleValue;
        var tip = bill*percent;
        var total=bill+tip;
        var perPerson = total/NSString(string: peopleField.text!).doubleValue;
        
        tipLabel.text = String(format: currency+"%.2f", tip);
        priceLabel.text = String(format: currency+"%.2f", total);
        perPersonLabel.text = String(format: currency+"%.2f", perPerson);
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
