//
//  ClassTableViewCell.swift
//  DevVenture
//
//  Created by Ygor Duarte Lemos Pereira on 25/05/20.
//  Copyright © 2020 Ygor Duarte Lemos Pereira. All rights reserved.
//

import UIKit

class LectureTableViewCell: UITableViewCell {

    @IBOutlet weak var imageThumb: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTopic: UILabel!
    @IBOutlet weak var labelDate: UILabel!
   
    func configure(with lecture: Lecture) {
        imageThumb.image = UIImage(named: lecture.image)
        labelTitle.text = lecture.title
        labelTopic.text = lecture.topics
        labelDate.text = lecture.date
    }

}
