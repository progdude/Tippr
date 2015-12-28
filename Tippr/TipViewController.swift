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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        tipLabel.text = String(format: "$%.2f", tip);
        priceLabel.text = String(format: "$%.2f", total);
        perPersonLabel.text = String(format: "$%.2f", perPerson);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        var percents = [0.1,0.15,0.2];

        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("default_tip_percentage")
        percentControl.selectedSegmentIndex = tipValue;
        
        peopleField.text = "1";
        
    }
    
    @IBAction func personChanged(sender: AnyObject) {
        var percents = [0.1,0.15,0.2];
        var percent = percents[percentControl.selectedSegmentIndex];
        
        var bill = NSString(string: billField.text!).doubleValue;
        var tip = bill*percent;
        var total=bill+tip;
        var perPerson = total/NSString(string: peopleField.text!).doubleValue;
        
        tipLabel.text = String(format: "$%.2f", tip);
        priceLabel.text = String(format: "$%.2f", total);
        perPersonLabel.text = String(format: "$%.2f", perPerson);
    }
    
    @IBAction func changePercent(sender: AnyObject) {
        var percents = [0.1,0.15,0.2];
        var percent = percents[percentControl.selectedSegmentIndex];
        
        var bill = NSString(string: billField.text!).doubleValue;
        var tip = bill*percent;
        var total=bill+tip;
        var perPerson = total/NSString(string: peopleField.text!).doubleValue;
        
        tipLabel.text = String(format: "$%.2f", tip);
        priceLabel.text = String(format: "$%.2f", total);
        perPersonLabel.text = String(format: "$%.2f", perPerson);
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
