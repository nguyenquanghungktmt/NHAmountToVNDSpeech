//
//  DetailViewController.swift
//  AmountVNDSpeechDemo
//
//  Created by Nguyen Quang Hung on 15/05/2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tbvDetail: UITableView!
    
    var data = ["Create .gitlab-ci.yml file", "Configuring Runner", "Author", "References",
                "Create .gitlab-ci.yml file", "Configuring Runner", "Author", "References",
                "Create .gitlab-ci.yml file", "Configuring Runner", "Author", "References",
                "Create .gitlab-ci.yml file", "Configuring Runner", "Author", "References"]
    
    let spacingHeight: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbvDetail.delegate = self
        tbvDetail.dataSource = self
        tbvDetail.register(UINib(nibName: "DetailViewCell", bundle: nil), forCellReuseIdentifier: "DetailViewCell")
//        tbvDetail.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        self.tbvDetail.automaticallyAdjustsScrollIndicatorInsets = false;
        tbvDetail.sectionHeaderHeight = 0
        tbvDetail.sectionFooterHeight = 0

    }

    @IBAction func tappedDetail(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as? DetailViewCell else {
            return UITableViewCell()
        }
        detailCell.configureCells(content: self.data[indexPath.section], tappedDetailCell: {
            [weak self] content in
            guard let strongSelf = self else { return }
            strongSelf.showToast(message: content)
        })
        detailCell.layer.borderWidth = 0.5
        return detailCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    // MARK: - Table View delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section)")
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            // remove the item from the data model
            self.data.remove(at: indexPath.row)

            // delete the table view row
            let indexSet = IndexSet(arrayLiteral: indexPath.section)
            tableView.deleteSections(indexSet, with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Xóa"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 10))
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 10))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
}
