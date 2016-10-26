//
//  ViewController.swift
//  DataSales
//
//  Created by Cody Garvin on 10/19/16.
//  Copyright © 2016 Cody Garvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SalesDataViewDelegate, UITextFieldDelegate {

    @IBOutlet var soldTextField: UITextField?
    @IBOutlet var unsoldTextField: UITextField?
    @IBOutlet var daysTextField: UITextField?
    @IBOutlet var valueTextField: UITextField?
    
    var viewModel: SalesRingViewModel? = nil
    var dataView: SalesDataView? = nil
    var masksOn: Bool = false
    var tapGesture: UIGestureRecognizer? = nil
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tapGesture = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mock out a data model and view mode
        buildModels()
        
        // Do any additional setup after loading the view, typically from a nib.
        guard let _ = viewModel else { return }
        
        // Add the SalesDataView
        dataView = SalesDataView(viewModel: viewModel!)
        guard let _ = dataView else { return }
        
        dataView?.delegate = self
        
        self.view.addSubview(dataView!)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        dataView?.translatesAutoresizingMaskIntoConstraints = false;
        
        // Add the data view
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[dataView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["dataView": dataView!])
        
        NSLayoutConstraint.activate(constraints)
        
        // Handle the keyboard dismiss
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler(_:)))
        self.view.addGestureRecognizer(tapGesture!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateRingView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buildModels() {
        
        let soldValue = soldTextField?.text ?? "0"
        let unsoldValue = unsoldTextField?.text ?? "0"
        let daysValue = daysTextField?.text ?? "1"
        let totalValue = valueTextField?.text ?? "0.00"
        
        let dataModel = SalesDataModel(itemsSold: Int(soldValue)!, totalItems: Int(unsoldValue)!, days: Int(daysValue)!, totalSales: Double(totalValue)!)
        viewModel = SalesRingViewModel(salesDataModel: dataModel)
        
        if dataView != nil {
            dataView?.viewModel = viewModel
        }
    }
    
    func updateRingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.dataView?.startRingFill()
        }
    }
    
    func tapHandler(_ sender: UITapGestureRecognizer? = nil) {
        view.endEditing(true)
    }
    
    @IBAction func updateView(_ sender: Any!) {
        buildModels()
        updateRingView()
    }
    
    // MARK: - Delegate Functions
    func didTapViewAll(_ sender: Any!) {
        let alert = UIAlertController(title: "Selling Data", message: "All selling data will go here", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

