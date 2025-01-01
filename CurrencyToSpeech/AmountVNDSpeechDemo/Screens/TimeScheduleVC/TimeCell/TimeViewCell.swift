//
//  TimeViewCell.swift
//  AmountVNDSpeechDemo
//
//  Created by Nguyen Quang Hung on 16/05/2024.
//

import UIKit

class TimeViewCell: UICollectionViewCell {

    @IBOutlet weak var btnTime: UIButton!
    
    var weekdayString: String? {
        didSet {
            configureBtnTime()
        }
    }
    var isEnable = true {
        didSet {
            self.updateStatusBtnWeekday(isEnable: isEnable)
        }
    }
    var tappedTimeCell: (() -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btnTime.layer.cornerRadius = 8.0
    }
    
    func configureCells(weekday: String?, isEnable: Bool, tappedTimeCell: (() -> ())?) {
        self.weekdayString = weekday
        self.isEnable = isEnable
        self.tappedTimeCell = tappedTimeCell
    }

    func configureBtnTime() {
        self.btnTime.setTitle(self.weekdayString, for: .normal)
        self.btnTime.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.updateStatusBtnWeekday(isEnable: self.isEnable)
    }
    
    
    @IBAction func tappedBtnWeekday(_ sender: UIButton) {
        self.isEnable.toggle()
        self.tappedTimeCell?()
    }
    
    func updateStatusBtnWeekday(isEnable: Bool){
        self.btnTime.backgroundColor = isEnable ? .blue : .gray
    }
}
