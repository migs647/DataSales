//
//  ViewController.swift
//  RingGaugeDemo
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: SalesRingViewModel? = nil
    var ringView: SalesRingView? = nil
    var masksOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mock out a data model and view mode
        buildModels()
        
        // Do any additional setup after loading the view, typically from a nib.
        guard let _ = viewModel else { return }
        guard let tempRingView = SalesRingView(viewModel: viewModel!) else { return }
        
        ringView = tempRingView
        ringView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ringView!)
        
        // Add the autoresize
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(>=100)-[ringView(==196)]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["ringView":ringView!])
        view.addConstraints(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[ringView(==196)]", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: ["ringView":ringView!])
        view.addConstraints(horizontalConstraints)
        
        let centerConstraint = NSLayoutConstraint(item: ringView!, attribute: NSLayoutAttribute.centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(centerConstraint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buildModels() {
        let dataModel = SalesDataModel(itemsSold: 9, totalItems: 17, days: Int(arc4random_uniform(60) + 1), totalSales: 647.23)
        viewModel = SalesRingViewModel(salesDataModel: dataModel)
    }
    
    @IBAction func startAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            // your function here
            self?.ringView?.startRingFill()
        }
    }
    
    @IBAction func resetLayers() {
        buildModels()
        ringView?.reset()
        ringView?.viewModel = viewModel
    }
    
    @IBAction func toggleLayers() {
        
        if masksOn {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        }
        
        masksOn = !masksOn
        
        ringView?.toggleMasks()
    }
}

