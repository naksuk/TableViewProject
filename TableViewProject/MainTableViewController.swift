//
//  MainTableViewController.swift
//  TableViewProject
//
//  Created by 中村亮介 on 2021/04/08.
//

import UIKit

class Player{
    let name: String
    let image: UIImage
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class MainTableViewController: UITableViewController {
    
    private let cellId = "cellId"
//    private let players = [
//        ["aaaaa", "bbbbb", "ccccc", "ddddd", "eeeeee"],
//        ["aaaaa", "bbbbb", "ccccc", "ddddd", "eeeeee"],
//        ["aaaaa", "bbbbb", "ccccc", "ddddd", "eeeeee"]
//    ]

    private let players: [[Player]] = [
        [.init(name: "ENEGY", image: #imageLiteral(resourceName: "green")),
        .init(name: "KHAOS", image: #imageLiteral(resourceName: "orange")),
        .init(name: "PIPELINE PUNCH", image: #imageLiteral(resourceName: "pink")),
        .init(name: "CUBA LIBRE", image: #imageLiteral(resourceName: "red")),
        .init(name: "ABSOLUTELY ZERO", image: #imageLiteral(resourceName: "blue")),
        .init(name: "ULTRA", image: #imageLiteral(resourceName: "white")),
        .init(name: "M3 EXTRA STRENGTH", image: #imageLiteral(resourceName: "m3")),
        .init(name: "SUPER COLA", image: #imageLiteral(resourceName: "bigred")),
        .init(name: "BIG ENEGY", image: #imageLiteral(resourceName: "big"))
        ],
        
        [.init(name: "ENEGY", image: #imageLiteral(resourceName: "green")),
         .init(name: "KHAOS", image: #imageLiteral(resourceName: "orange")),
         .init(name: "PIPELINE PUNCH", image: #imageLiteral(resourceName: "pink")),
         .init(name: "CUBA LIBRE", image: #imageLiteral(resourceName: "red")),
         .init(name: "ABSOLUTELY ZERO", image: #imageLiteral(resourceName: "blue")),
         .init(name: "ULTRA", image: #imageLiteral(resourceName: "white")),
         .init(name: "M3 EXTRA STRENGTH", image: #imageLiteral(resourceName: "m3")),
         .init(name: "SUPER COLA", image: #imageLiteral(resourceName: "bigred")),
         .init(name: "BIG ENEGY", image: #imageLiteral(resourceName: "big"))
        ],
        
        [.init(name: "ENEGY", image: #imageLiteral(resourceName: "green")),
         .init(name: "KHAOS", image: #imageLiteral(resourceName: "orange")),
         .init(name: "PIPELINE PUNCH", image: #imageLiteral(resourceName: "pink")),
         .init(name: "CUBA LIBRE", image: #imageLiteral(resourceName: "red")),
         .init(name: "ABSOLUTELY ZERO", image: #imageLiteral(resourceName: "blue")),
         .init(name: "ULTRA", image: #imageLiteral(resourceName: "white")),
         .init(name: "M3 EXTRA STRENGTH", image: #imageLiteral(resourceName: "m3")),
         .init(name: "SUPER COLA", image: #imageLiteral(resourceName: "bigred")),
         .init(name: "BIG ENEGY", image: #imageLiteral(resourceName: "big"))
        ]
    ]
    
    
    
    override func viewDidLoad() {
        //self.overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellId)
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar(){
        
        navigationItem.title = "Monster"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(white: 0.9, alpha: 1)
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
}

//MARK: -TableView設定
extension MainTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "1990s"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .gray
        label.textColor = .white
        
        switch section {
        case 0:
            label.text = "1990s"
        case 1:
            label.text = "2000s"
        case 2:
            label.text = "2010s"
        default:
            break
        }
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MainTableViewCell
        
        let player = players[indexPath.section][indexPath.row]
        cell.nameLabel.text = player.name
        cell.playerImageView.image = player.image
        //cell.textLabel?.text = players[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        viewController.player = players[indexPath.section][indexPath.row]
        var generation = "1990s"
        if indexPath.section == 1 {
            generation = "2000s"
        } else if indexPath.section == 2 {
            generation = "2010s"
        }
        
        viewController.generationLabel.text = generation
        navigationController?.pushViewController(viewController, animated: true)
    }
}
