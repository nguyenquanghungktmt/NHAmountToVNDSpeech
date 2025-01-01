//
//  TimeSchduleViewController.swift
//  AmountVNDSpeechDemo
//
//  Created by Nguyen Quang Hung on 16/05/2024.
//

import UIKit

class TimeSchduleViewController: UIViewController {

    @IBOutlet weak var clvTimeSchedule: UICollectionView!
    
    let weekdays = ["T2", "T3", "T4", "T5", "T6", "T7", "CN", "T2", "T3", "T4", "T5", "T6", "T7", "CN"]
    var enableWeekdays: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.enableWeekdays = Array(repeating: true, count: self.weekdays.count)
        
        
        clvTimeSchedule.register(UINib(nibName: "TimeViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeViewCell")
        clvTimeSchedule.delegate = self
        clvTimeSchedule.dataSource = self
    }

    
    @IBAction func tappedBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension TimeSchduleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weekdays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let timeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeViewCell", for: indexPath) as! TimeViewCell
        let indexCell = indexPath.row
//        let isEnable = self.enableWeekdays[indexCell]
        timeCell.configureCells(weekday: self.weekdays[indexCell], isEnable: self.enableWeekdays[indexCell], tappedTimeCell: {
            [weak self] in
            if let self = self {
                self.enableWeekdays[indexCell].toggle()
//                collectionView.reloadItems(at: [indexPath])
            }
        })
        return timeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44.0, height: 44.0)
    }
}
