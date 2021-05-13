//
//  MainTableViewCell.swift
//  TableViewProject
//
//  Created by 中村亮介 on 2021/04/08.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    let playerImageViewWidth: CGFloat = 50
    let playerImageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .black
        //iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ここに名前が入ります"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        addSubview(playerImageView)
        addSubview(nameLabel)
        [
            playerImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            playerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: playerImageViewWidth),
            playerImageView.heightAnchor.constraint(equalToConstant: playerImageViewWidth),
            
            nameLabel.leftAnchor.constraint(equalTo: playerImageView.rightAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ].forEach{ $0.isActive = true}
        playerImageView.layer.cornerRadius = playerImageViewWidth / 2
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
