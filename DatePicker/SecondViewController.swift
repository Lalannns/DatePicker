//
//  SecondViewController.swift
//  DatePicker
//
//  Created by Allan Auezkhan on 25.08.2025.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
        var timer = Timer()
        var isTimerRunning = false
        
        var startDate: Date!
        var endDate: Date!
        var currentDate: Date!
        var savedDate: Date!
        
        let formatter: DateFormatter = {
            let df = DateFormatter()
            df.dateFormat = "dd MM yy, EEE HH:mm"
            return df
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        guard startDate != nil && endDate != nil else { return }
               
        currentDate = startDate
        savedDate = startDate
               
        updateLabel()
    }
    
    func updateLabel() {
            label.text = formatter.string(from: currentDate)
        }
        
        @objc func countTime() {
        guard currentDate < endDate else {
                timer.invalidate()
                isTimerRunning = false
                return
            }
            
            currentDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
            updateLabel()
        }
    
    
    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning { return }
               
               timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
               isTimerRunning = true
    }
    

    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        currentDate = savedDate
        updateLabel()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
