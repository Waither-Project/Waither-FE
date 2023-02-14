//
//  NotiViewController.swift
//  Waither_UI
//
//  Created by 최다경 on 2023/01/17.
//

import UIKit

class NotiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notiTableView: UITableView!
    var noti: [String] = ["14:20부터 10분간 소나기가 와요!", "오늘 오후 6시부터 8시까지 비가 와요!\n우산을 챙겨가세요.", "오늘 바람이 대체로 많이 불 예정이에요.", "새벽에 온도가 많이 떨어져요. 창문을\n닫고 주무세요. (잠)"]
    var time: [String] = ["14:00", "08:20", "08:20", "20:20"]
    var date: [String] = ["오늘", "오늘", "오늘", "오늘"]
    override func viewDidLoad() {
        super.viewDidLoad()

        notiTableView.delegate = self
        notiTableView.dataSource = self
        notiTableView.separatorStyle = .none
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.notiTableView.dequeueReusableCell(withIdentifier: "NotiTableViewCell", for: indexPath) as! NotiTableViewCell
        cell.notiLabel?.text = noti[indexPath.row]
        cell.timeLabel?.text = time[indexPath.row]
        cell.dateLabel?.text = date[indexPath.row]
//        cell.notiView.layer.cornerRadius = cell.notiView.frame.height / 3
        cell.backgroundColor = UIColor(named: "cellColor")
        cell.selectionStyle = .none

//        //shaow 효과
//        cell.notiView.layer.shadowOpacity = 0.5
//        cell.notiView.layer.shadowColor = UIColor.black.cgColor
//        cell.notiView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cell.notiView.layer.shadowRadius = 5
//        cell.notiView.layer.masksToBounds = false
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //cell 높이 return
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath)

        cell?.contentView.backgroundColor = .white
        //cell?.backgroundColor = .white

     

      }
    


    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                // delete the item here
            self.noti.remove(at: indexPath.row)
            self.time.remove(at: indexPath.row)
            self.date.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
                completionHandler(true)
            }
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = UIColor(named: "trashColor")
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }
    @IBAction func deleteAllBtnPrsd(_ sender: UIButton) {
        notiTableView.removeFromSuperview()
    }
    
    @IBAction func readNotiDeleteBtnPrsd(_ sender: UIButton) {
        notiTableView.removeFromSuperview()
    }
    
    @IBAction func refreshBtnPrsd(_ sender: UIButton) {
        self.notiTableView?.beginUpdates()
        self.notiTableView?.reloadRows(at: self.notiTableView.indexPathsForVisibleRows!, with: .none)
        self.notiTableView?.endUpdates()
    }
}
