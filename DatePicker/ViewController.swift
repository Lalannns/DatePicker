//
//  ViewController.swift
//  DatePicker
//
//  Created by Allan Auezkhan on 24.08.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set picker modes
        startDatePicker.datePickerMode = .dateAndTime
        endDatePicker.datePickerMode = .dateAndTime
    }

    @IBAction func generateButtonTapped(_ sender: Any){
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        
        if startDate >= endDate {
            showAlert(message: "Start date must be earlier than end date.")
            return
        }

        // Create the list of dates
        var currentDate = startDate
        var results: [String] = []
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yy, EEE HH:mm"

        while currentDate <= endDate {
            results.append(formatter.string(from: currentDate))
            currentDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        }
        
        // Go to second VC with data
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            resultVC.resultStrings = results
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Invalid Dates", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
