//
//  ViewController.swift
//  DatePicker
//
//  Created by Allan Auezkhan on 25.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDatePicker.datePickerMode = .dateAndTime
        endDatePicker.datePickerMode = .dateAndTime
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        
        guard startDate < endDate else {
            let alert = UIAlertController(title: "Error", message: "Start date must be earlier than end date", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.startDate = startDate
            vc.endDate = endDate
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
}
