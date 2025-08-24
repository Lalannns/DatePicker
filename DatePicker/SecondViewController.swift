//
//  SecondViewController.swift
//  DatePicker
//
//  Created by Allan Auezkhan on 24.08.2025.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultTextView: UILabel!
    
    var resultStrings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextView.text = resultStrings.joined(separator: "\n")
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
