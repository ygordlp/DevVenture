//
//  ClassListTableViewController.swift
//  DevVenture
//
//  Created by Ygor Duarte Lemos Pereira on 25/05/20.
//  Copyright © 2020 Ygor Duarte Lemos Pereira. All rights reserved.
//

import UIKit

class LecturesListTableViewController: UITableViewController {
    
    var lectures: [Lecture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadClasses()
    }
    
    // MARK: - Methods
     private func loadClasses() {
        guard let jsonURL = Bundle.main.url(forResource: "lectures", withExtension: "json") else {return}
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let jsonDecoder = JSONDecoder();
            
            lectures = try jsonDecoder.decode([Lecture].self, from: jsonData)
         
         tableView.reloadData()
        } catch  {
            print(error)
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let lectureViewController = segue.destination as? LectureViewController
            
            if let index = tableView.indexPathForSelectedRow?.row {
                lectureViewController?.lecture = lectures[index]
            }
        }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lectures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LectureTableViewCell
            else{
                return UITableViewCell()
        }

        let lecture = lectures[indexPath.row]
        cell.configure(with: lecture)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
