//
//  LectureViewController.swift
//  DevVenture
//
//  Created by Ygor Duarte Lemos Pereira on 25/05/20.
//  Copyright © 2020 Ygor Duarte Lemos Pereira. All rights reserved.
//

import UIKit

class LectureViewController: UIViewController {

    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTopics: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var textSummary: UITextView!
    
    var lecture: Lecture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lecture = lecture {
            imageThumb.image = UIImage(named: lecture.image)
            labelTitle.text = lecture.title
            labelTopics.text = lecture.topics
            labelDate.text = lecture.date
            textSummary.text = lecture.summary
        }
    }


    @IBAction func playLecture(_ sender: UIButton) {
        if let lecture = lecture {
            guard let url = URL(string: lecture.url) else {
              return
            }

            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}
