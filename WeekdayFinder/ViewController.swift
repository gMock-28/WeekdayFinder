//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Gold_Mock on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    
    @IBOutlet weak var ShowingDay: UILabel!
    
    @IBAction func FindDay(_ sender: UIButton) {
        
        guard let day = dayTF.text, let month = monthTF.text, let year = yearTF.text else {
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday = dateFormatter.string(from: date)
        
        ShowingDay.text = weekday.capitalized
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

