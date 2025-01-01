//
//  DetailViewCell.swift
//  AmountVNDSpeechDemo
//
//  Created by Nguyen Quang Hung on 16/05/2024.
//

import UIKit

class DetailViewCell: UITableViewCell {

    @IBOutlet weak var lbContent: UILabel!
    
    var content: String? {
        didSet {
            configureCellDetail()
        }
    }
    var tappedDetailCell: ((String) -> ())? = nil

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCells(content: String?, tappedDetailCell: ((String) -> ())?) {
        self.content = content
        self.tappedDetailCell = tappedDetailCell
    }
    
    private func configureCellDetail(){
        guard let content = content else { return }
        self.lbContent.text = "Cell: \(content)"
    }
    
    
    @IBAction func tappedBtnDetail(_ sender: UIButton) {
        self.tappedDetailCell?(self.content ?? "")
    }
}
