//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Anderson Alencar on 03/07/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimenterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (Notification) in
            
            self.formatView() // nommomento que carregar a view ela vai começar a observar essa notificação, que quando disparada vai executar o refresh da view
            
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    
    func formatView () {
        
        self.swAutoRefresh.setOn(self.config.autoRefresh, animated: false)
        self.slTimenterval.setValue(Float(self.config.timeInterval), animated: false)
        self.scColorScheme.selectedSegmentIndex = self.config.colorScheme
        changeTimeIntervalLabel()
    }
    
    func changeTimeIntervalLabel() {
        self.lbTimeInterval.text = self.config.timeIntervalDescription
    }
    

    
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        
        self.config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        
        self.config.timeInterval = Double(sender.value)
        changeTimeIntervalLabel()
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        
        self.config.colorScheme = sender.selectedSegmentIndex
    }
    

}
